return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
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
    local treesitter = require("nvim-treesitter")

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
      install = {
        "bash",
        "c",
        "css",
        "dart",
        "devicetree",
        "dockerfile",
        "gitignore",
        "html",
        "java",
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
        vim.api.nvim_set_option_value("filetype", "devicetree", { buf = buf })
      end,
    })

    require("ts_context_commentstring").setup({})
  end,
}
