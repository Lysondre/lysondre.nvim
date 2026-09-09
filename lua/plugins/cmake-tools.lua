return {
    'Civitasv/cmake-tools.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'akinsho/toggleterm.nvim',
    },
    opts = {
        cmake_runner = {
            name = 'toggleterm',
            default_opts = {
                toggleterm = {
                    direction = 'horizontal',
                },
            },
        },
    },
    init = function()
        local function generate()
            local cmake = require 'cmake-tools'
            local generate_options = cmake.get_generate_options()
            cmake.generate(generate_options)
        end

        local function build()
            local cmake = require 'cmake-tools'
            local build_options = cmake.get_build_options()
            cmake.build(build_options)
        end

        local function run()
            local cmake = require 'cmake-tools'
            cmake.run()
        end

        vim.keymap.set('n', '<leader>cg', generate, { desc = '[G]enerate CMake Project' })
        vim.keymap.set('n', '<leader>cb', build, { desc = '[B]uild CMake Project' })
        vim.keymap.set('n', '<leader>cr', run, { desc = '[R]un CMake Project' })
    end,
}
