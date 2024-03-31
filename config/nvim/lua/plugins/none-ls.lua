return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.textidote,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.pg_format,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.sqlformat,
        null_ls.builtins.formatting.yamlfix,
      },
    })
  end,
}
