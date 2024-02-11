return {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  opts = function()
    require("telescope").load_extension("flutter")
    return {
      ui = { border = "rounded" },
      debugger = {
        enabled = false,
        run_via_dap = false,
        exception_breakpoints = {},
      },
      outline = { auto_open = false },
      decorations = {
        statusline = { device = true, app_version = true },
      },
      widget_guides = { enabled = true, debug = false },
      dev_log = { enabled = true, open_cmd = "tabedit" },
      lsp = {
        color = {
          enabled = true,
          background = true,
          virtual_text = false,
        },
        settings = {
          showTodos = false,
          renameFilesWithClasses = "always",
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          lineLength = 100,
        },
      },
    }
  end,
  dependencies = {
    { "RobertBrunhage/flutter-riverpod-snippets" },
  },
}
