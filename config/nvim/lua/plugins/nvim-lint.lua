return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      kotlin = { "ktlint" },
      python = { "pylint", "mypy", "ruff" },
      fish = { "fish" },
      json = { "jsonlint" },
      yaml = { "yamllint" },
      markdown = { "markdownlint" },
    }

    -- local venv_path =
    --  'import sys; sys.path.append("~/.pyenv/versions/nvim_env/lib/python3.11/site-packages/"); import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)'

    -- local pylint = lint.linters.pylint
    -- pylint.args = {
    --   "-f",
    --   "json",
    --  "--init-hook",
    --  venv_path,
    -- }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
