return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'ruff' },
            },
            format_on_save = {
                timeout_ms = 300,
                lsp_format = 'fallback',
            },
        },
    },
}
