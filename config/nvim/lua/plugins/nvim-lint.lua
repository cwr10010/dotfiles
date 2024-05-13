return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    linters_by_ft = {
      kotlin = { "ktlint" },
      python = {
        "pylint",
        "mypy",
        "ruff",
      },
      fish = { "fish" },
      json = { "jsonlint" },
      yaml = { "yamllint" },
      markdown = { "markdownlint", "vale" },
    },
  },
  config = function()
    local lint = require("lint")
    --lint.linters.markdownlint.args = {
    --  "--disable",
    --  "MD013",
    --  "MD007",
    --  "--", -- Required
    --}

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
