return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            {"williamboman/mason.nvim", config= true},
        },
        config = {
            ensure_installed = {
                "lua_ls"
            }
        }
    },  
  {
    'folke/lazydev.nvim',
   dependencies = {
  { 'Bilal2453/luvit-meta', lazy = true },

        } ,
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
      { 'j-hui/fidget.nvim', opts = {} },
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp"
        },
          config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local signs = { Error = '', Warn = '', Info = '', Hint = '' }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = ""})
        end

            local keymap = vim.keymap

            vim.api.nvim_create_autocmd("LspAttach", {
              group = vim.api.nvim_create_augroup("UserLspConfig", {}),
              callback = function()
                keymap.set("n", "gR", ":Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references
                keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration"}) -- go to declaration
                keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", { desc = "Show LSP definitions"}) -- show lsp definitions
                keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", { desc = "Show LSP implementations"}) -- show lsp implementations
                keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions"}) -- show lsp type definitions
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions"}) -- see available code actions, in visual mode will apply to selection
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename"}) -- smart rename
                keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics"}) -- show  diagnostics for file
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics"}) -- show diagnostics for line
                keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic"}) -- jump to previous diagnostic in buffer
                keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic"}) -- jump to next diagnostic in buffer
                keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor"}) -- show documentation for what is under cursor
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP"}) -- mapping to restart lsp if necessary
              end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())

            mason_lspconfig.setup_handlers({
              function(server_name)
                lspconfig[server_name].setup({
                  capabilities = capabilities,
                })
              end,
              ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                  capabilities = capabilities,
                  settings = {
                    Lua = {
                      diagnostics = {
                        globals = { "vim" },
                      },
                      completion = {
                        callSnippet = "Replace",
                      },
                    },
                  },
                })
              end,
            })
    
        end
    }
}

--   config = function()
--
    -- Main LSP Configuration
    -- 'neovim/nvim-lspconfig',
    -- dependencies = {
    --   -- Automatically install LSPs and related tools to stdpath for Neovim
    --   { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    --   'williamboman/mason-lspconfig.nvim',
    --   'WhoIsSethDaniel/mason-tool-installer.nvim',
    --
    --   -- Useful status updates for LSP.
    --   -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    --   { 'j-hui/fidget.nvim', opts = {} },
    --
    --   -- Allows extra capabilities provided by nvim-cmp
    --   'hrsh7th/cmp-nvim-lsp',
    -- },
    --       -- The following two autocommands are used to highlight references of the
    --       -- word under your cursor when your cursor rests there for a little while.
    --       --    See `:help CursorHold` for information about when this is executed
    --       --
    --       -- When you move your cursor, the highlights will be cleared (the second autocommand).
    --       local client = vim.lsp.get_client_by_id(event.data.client_id)
    --       if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    --         local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
    --         vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    --           buffer = event.buf,
    --           group = highlight_augroup,
    --           callback = vim.lsp.buf.document_highlight,
    --         })
    --
    --         vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    --           buffer = event.buf,
    --           group = highlight_augroup,
    --           callback = vim.lsp.buf.clear_references,
    --         })
    --
    --         vim.api.nvim_create_autocmd('LspDetach', {
    --           group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
    --           callback = function(event2)
    --             vim.lsp.buf.clear_references()
    --             vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
    --           end,
    --         })
    --       end
    --

  --
  --
  --     -- Enable the following language servers
  --     --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --     --
  --     --  Add any additional override configuration in the following tables. Available keys are:
  --     --  - cmd (table): Override the default command used to start the server
  --     --  - filetypes (table): Override the default list of associated filetypes for the server
  --     --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
  --     --  - settings (table): Override the default settings passed when initializing the server.
  --     --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
  --     local servers = {
  --       -- clangd = {},
  --       -- gopls = {},
  --       -- pyright = {},
  --       -- rust_analyzer = {},
  --       -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --       --
  --       -- Some languages (like typescript) have entire language plugins that can be useful:
  --       --    https://github.com/pmizio/typescript-tools.nvim
  --       --
  --       -- But for many setups, the LSP (`ts_ls`) will work just fine
  --       -- ts_ls = {},
  --       --
  --
  --       lua_ls = {
  --         -- cmd = { ... },
  --         -- filetypes = { ... },
  --         -- capabilities = {},
  --         settings = {
  --           Lua = {
  --             completion = {
  --               callSnippet = 'Replace',
  --             },
  --             -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
  --             -- diagnostics = { disable = { 'missing-fields' } },
  --           },
  --         },
  --       },
  --     }
  --
