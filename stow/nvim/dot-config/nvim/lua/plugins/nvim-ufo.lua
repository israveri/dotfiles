return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    opts = {
        provider_selector = function(bufnr, filetype, buftype)
            -- return { "treesitter", "indent"}
            return { "lsp", "indent"}
        end,
        preview = {
            win_config = {
                border = {'┏', '━', '┓', '┃', '┛', '━', '┗', '┃'},
                winhighlight = 'Normal:Folded',
                winblend = 0
            },
            mappings = {
                scrollU = '<S-Up>',
                scrollD = '<S-Down>',
                jumpTop = '[',
                jumpBot = ']'
            }
        },
    },
    config = function(_, opts)
        vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

        vim.keymap.set('n', 'zO', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zC', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zz', function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end)

        require("ufo").setup(opts)
    end,
}
