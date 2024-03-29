return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-plenary",
    "sidlatau/neotest-dart",
    "weilbith/neotest-gradle",
  },
  event = "VeryLazy",
  --opts = function(_, opts)
  --  vim.list_extend(opts.adapters, {
  --    require("neotest-dart")({ command = "flutter" }),
  --    require("neotest-gradle"),
  --  })
  --end,
  config = function()
    local status_ok, neotest = pcall(require, "neotest")
    if not status_ok then
      return
    end

    neotest.setup({
      adapters = {
        require("neotest-dart")({
          command = "flutter",
          -- use_lsp = true,
        }),
        require("neotest-plenary"),
        require("neotest-gradle"),
      },
      output = {
        open_on_run = false,
      },
      discovery = {
        enabled = false,
      },
      diagnostic = {
        enabled = true,
      },
      floating = {
        border = "rounded",
        max_height = 0.8,
        max_width = 0.8,
        options = {},
      },
      quickfix = {
        enabled = false,
      },
      state = {
        enabled = true,
      },
    })
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "]n", function()
      neotest.jump.next({ status = "failed" })
    end, opts)
    vim.keymap.set("n", "[n", function()
      neotest.jump.prev({ status = "failed" })
    end, opts)
    vim.keymap.set("n", "]t", neotest.jump.next, opts)
    vim.keymap.set("n", "[t", neotest.jump.prev, opts)
  end,
}
