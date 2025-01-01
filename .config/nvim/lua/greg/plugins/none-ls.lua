return {
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            {"williamboman/mason.nvim", config = true}
        },
        opts = {
            ensure_installed = {
                "stylua"
            },
            automatic_installation = false
        }
    },
    { "nvimtools/none-ls.nvim",
        dependencies = {
        "jay-babu/mason-null-ls.nvim",
        },
        config = function ()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting

            null_ls.setup({
                sources = {
                    formatting.stylua
                }
            })

            vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = "Format code"})
        end
    }
}
