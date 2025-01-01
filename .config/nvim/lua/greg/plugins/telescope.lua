return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        -- "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod
        local builtin = require("telescope.builtin")

        --    local trouble = require("trouble")
        --  local trouble_telescope = require("trouble.sources.telescope")

        -- or create your custom action
        -- local custom_actions = transform_mod({
        --   open_trouble_qflist = function(prompt_bufnr)
        --     trouble.toggle("quickfix")
        --    end,
        -- })

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        -- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                        -- ["<C-t>"] = trouble_telescope.open,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", ":Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "[S]earch existing [B]uffers" })
        keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { desc = "[S]earch [H]elp" })
    end,
}

-- vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
-- vim.keymap.set('n', '<leader>gcf', builtin.git_bcommits, { desc = 'Search [G]it [C]ommits for current [F]ile' })
-- vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search [G]it [B]ranches' })
-- vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search [G]it [S]tatus (diff view)' })
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]resume' })
-- vim.keymap.set('n', '<leader>sds', function()
--   builtin.lsp_document_symbols {
--     symbols = { 'Class', 'Function', 'Method', 'Constructor', 'Interface', 'Module', 'Property' },
--   }
-- end, { desc = '[S]each LSP document [S]ymbols' })
-- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>s/', function()
--   builtin.live_grep {
--     grep_open_files = true,
--     prompt_title = 'Live Grep in Open Files',
--   }
-- end, { desc = '[S]earch [/] in Open Files' })
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })
