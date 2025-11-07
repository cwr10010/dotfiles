return {
  -- https://github.com/fisadev/vim-isort
  "fisadev/vim-isort",
  ft = "python",
  config = function()
    -- Disable default key binding
    vim.g.vim_isort_map = ""
    -- vim.g.vim_isort_python_version = "python3"
    vim.g.python3_host_prog = vim.fn.expand("$HOME/.pyenv/versions/3.12.11/envs/neovim/bin/python")
    -- Automatically format file buffer when saving
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = "*.py",
      callback = function()
        vim.cmd("Isort")
      end,
    })
  end,
}
