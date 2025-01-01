return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    main = "nvim-treesitter.configs",
    opts = { -- enable syntax highlighting
        highlight = {
            enable = true,
        },
        indent = { enable = true },
        autotag = {
            enable = true,
        },
        ensure_installed = {
            "bash",
            "bicep",
            "css",
            "dockerfile",
            "gitignore",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
}
