return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "dart",
        "dockerfile",
        "kotlin",
      })
    end
  end,
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        disable = { "latex" },
      },
      -- enable indentation
      indent = {
        enable = true,
      },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "css",
        "dart",
        "devicetree",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "typescript",
        "vim",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ignore_install = {},
      auto_install = true,
      sync_install = false,
    })

    vim.api.nvim_create_autocmd({
      "BufNewFile",
      "BufRead",
    }, {
      pattern = "*.keymap",
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_option(buf, "filetype", "devicetree")
      end,
    })

    require("ts_context_commentstring").setup({})
  end,
}
