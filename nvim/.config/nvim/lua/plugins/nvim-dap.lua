return {
  {
    "mfussenegger/nvim-dap",
    keys = {

      {
        "<f5>",
        function()
          require("dap").continue()
        end,
        desc = "Run/Continue",
      },
      {
        "<s-f5>",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<f9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<s-f9>",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<f10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<c-f10>",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<f11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<s-f11>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
    },
  },
}
