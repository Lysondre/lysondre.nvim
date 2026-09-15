import os
import shutil
import subprocess
import sys
from abc import ABC, abstractmethod
from pathlib import Path

from typing import Literal
from collections.abc import Callable

InstallCallback = Callable[[], None]


def ask_confirm() -> bool:
    resp = input("Confirm to proceed: [y/N] ").lower()

    return resp == "y"


class Installer(ABC):
    def __init__(self) -> None:
        self.normal_installs: list[str] = []
        self.special_installs: dict[str, InstallCallback] = {}

    @abstractmethod
    def check_installed(self, program: str) -> bool:
        raise NotImplementedError("Method not implemented")

    @abstractmethod
    def get_install_command(self) -> list[str]:
        raise NotImplementedError("Method not implemented")

    def add_package_install(self, program: str):
        self.normal_installs.append(program)

    def add_special_install(self, program: str, install_fn: InstallCallback):
        self.special_installs[program] = install_fn


class ArchInstaller(Installer):
    def __init__(self) -> None:
        super().__init__()

        self.installed_programs: frozenset[str] = self.load_installed_programs()

    def load_installed_programs(self) -> frozenset[str]:
        results = subprocess.run(
            ["pacman", "-Q"], capture_output=True, text=True
        ).stdout.split("\n")

        results = [res.split(" ")[0] for res in results]

        return frozenset(results)

    def check_installed(self, program: str) -> bool:
        return program in self.installed_programs

    def get_install_command(self) -> list[str]:
        return ["pacman", "-s"] + self.normal_installs


class UbuntuInstaller(Installer):
    def __init__(self) -> None:
        super().__init__()

        self.installed_programs: frozenset[str] = self.load_installed_programs()

    def load_installed_programs(self) -> frozenset[str]:
        results = subprocess.run(
            ["apt", "list", "--installed"], capture_output=True, text=True
        ).stdout.split("\n")

        results = [res.split("/")[0] for res in results]

        return frozenset(results)

    def check_installed(self, program: str) -> bool:
        return program in self.installed_programs

    def get_install_command(self) -> list[str]:
        return ["apt", "install"] + self.normal_installs


def install_remote_tar(url: str, name: str, executable: str, gz: bool = True):
    filename = name + ".tar"

    if gz:
        filename += ".gz"

    full_url = url + filename

    _ = subprocess.run(["curl", "-LO", full_url])
    _ = subprocess.run(["tar", "-xzvf" if gz else "-xvf", filename])

    source_dir = Path(name)

    if not source_dir.exists():
        source_dir = Path(executable)
        name = executable

        if not source_dir.exists():
            print(f"Error installing {executable}")
            return

    if source_dir.is_file():
        temp_file = source_dir.with_suffix(source_dir.suffix + ".tmp")

        _ = source_dir.rename(temp_file)

        (source_dir / "bin").mkdir(parents=True, exist_ok=True)

        _ = shutil.move(str(temp_file), str(source_dir / "bin" / name))

    local_dir = Path("~/.local").expanduser()

    Path("~/.local/bin").expanduser().mkdir(parents=True, exist_ok=True)

    if source_dir.exists() and source_dir.is_dir():
        _ = shutil.move(str(source_dir), str(local_dir))

        os.symlink(
            str(local_dir / name / "bin" / executable),
            str(local_dir / "bin" / executable),
        )


def ubuntu_install_neovim():
    name = "nvim-linux-x86_64"
    version = "v0.11.2"
    URL = f"https://github.com/neovim/neovim/releases/download/{version}/"

    install_remote_tar(URL, name, "nvim")


def ubuntu_install_lazygit():
    name = "lazygit_0.64.1_linux_x86_64"
    URL = "https://github.com/jesseduffield/lazygit/releases/download/v0.64.1/"

    install_remote_tar(URL, name, "lazygit")


DEPS = {
    "lazygit": {
        "arch": "package",
        "ubuntu": ubuntu_install_lazygit,
    },
    "curl": {
        "arch": "package",
        "ubuntu": "package",
    },
    "ripgrep": {
        "arch": "package",
        "ubuntu": "package",
    },
    "neovim": {
        "arch": "package",
        "ubuntu": ubuntu_install_neovim,
    },
    "cmake": {
        "arch": "package",
        "ubuntu": "package",
    },
    "unzip": {
        "arch": "package",
        "ubuntu": "package",
    },
    "git": {
        "arch": "package",
        "ubuntu": "package",
    },
}

# some packages that are OS specific
OS_PACKAGES = {
    "arch": [],
    "ubuntu": ["python3-venv"],
}


def get_distro() -> Literal["ubuntu", "arch", "unsupported"]:
    if os.path.exists("/etc/os-release"):
        with open("/etc/os-release") as f:
            content = f.read().lower()

            if "ubuntu" in content:
                return "ubuntu"
            elif "arch" in content:
                return "arch"

    return "unsupported"


def main():
    fake_install = False

    distro = get_distro()

    print(f"{distro} detected.")

    if distro == "arch":
        installer = ArchInstaller()
    elif distro == "ubuntu":
        installer = UbuntuInstaller()
    else:
        print("This system is not supported. Aborting.")
        return

    for program, commands in DEPS.items():
        if installer.check_installed(program):
            continue

        if commands[distro] == "package":
            installer.add_package_install(program)
        else:
            installer.add_special_install(program, commands[distro])

    for program in OS_PACKAGES[distro]:
        if not installer.check_installed(program):
            installer.add_package_install(program)

    if len(installer.normal_installs) <= 0:
        print("Nothing to install in package manager...")
    else:
        pm_command = installer.get_install_command()

        print("Running command:")
        print(" ".join(pm_command))

        confirm = ask_confirm()

        if not confirm:
            print("Aborting...")
            return

        if not fake_install:
            _ = subprocess.run(pm_command)

    if len(installer.special_installs) <= 0:
        print("Nothing to custom install...")
    else:
        for program, function in installer.special_installs.items():
            print(f"Installing {program}")
            confirm = ask_confirm()

            if not confirm:
                continue

            if not fake_install:
                function()

    print("Done")


if __name__ == "__main__":
    main()
