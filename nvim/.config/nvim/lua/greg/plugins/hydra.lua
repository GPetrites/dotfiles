return {{
    "nvimtools/hydra.nvim",
    config = function()
        local Hydra = require("hydra")

        Hydra({
            name = "Splits",
            mode = "n",
            body = "<c-p>",
            config = {
                exit = true,
                foreign_keys = nil,
            },
            heads = {
                { "-", "<c-w>s" },
                { "_", "<c-w>s" },
                { "|", "<c-w>v" },
                { "!", "<c-w>v" }
            }
        })
    end
}}
