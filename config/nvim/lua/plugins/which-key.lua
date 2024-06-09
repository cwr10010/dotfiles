return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>d"] = { name = "+DAP" },
        ["<leader>n"] = { name = "+Noice" },
        ["<leader>o"] = { name = "+Obsidian" },
        ["<leader>S"] = { name = "+Split" },
        ["<leader>t"] = { name = "+test" },
      },
    },
  },
}
