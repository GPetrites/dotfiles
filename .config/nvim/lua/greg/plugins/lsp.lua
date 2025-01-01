return {
    { "williamboman/mason.nvim", config = {} },
    { "williamboman/mason-lspconfig.nvim", config = {} },
    { "WhoIsSethDaniel/mason-tool-installer.nvim", config = {
        ensure_installed = {
            "lua_ls"
        }
    } },
}
