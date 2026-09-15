return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>bn', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
        { '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
    },
    opts = {
        options = {
            diagnostics = 'nvim_lsp',

            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match 'error' and ' ' or ' '
                return ' ' .. icon .. count
            end,
        },
    },
}
