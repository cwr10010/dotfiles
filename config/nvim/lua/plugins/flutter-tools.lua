return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "RobertBrunhage/flutter-riverpod-snippets",
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = true,
  ft = "dart",
  lazy = true,
  opts = function()
    require("telescope").load_extension("flutter")
    return {
      ui = { border = "rounded" },
      debugger = {
        enabled = false,
        run_via_dap = false,
        exception_breakpoints = {},
      },
      outline = { auto_open = true },
      decorations = {
        statusline = { device = true, app_version = true },
      },
      widget_guides = { enabled = true },
      dev_log = { enabled = true, notify_errors = true, open_cmd = "tabedit" },
      lsp = {
        color = {
          enabled = true,
          background = true,
        },
        settings = {
          showTodos = true,
          renameFilesWithClasses = "prompt",
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          lineLength = 120,
        },
      },
    }
  end,
}
