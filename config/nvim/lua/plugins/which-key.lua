return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>d"] = { name = "+DAP" },
        ["<leader>n"] = { name = "+Noice" },
        ["<leader>o"] = { name = "+Obsidian" },
        ["<leader>m"] = { "<cmd>Mason<cr>", "Mason" },
        ["<leader>S"] = { name = "+Split" },
        ["<leader>t"] = { name = "+test" },
        ["<leader>Z"] = { "<cmd>ZenMode<cr>", "ZenMode" },
      },
    },
  },
}
