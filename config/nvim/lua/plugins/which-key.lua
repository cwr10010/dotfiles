return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>d", group = "DAP" },
        { "<leader>n", group = "+Noice" },
        { "<leader>o", group = "+Obsidian" },
        { "<leader>S", group = "+Split" },
        { "<leader>t", group = "+test" },
      },
    },
  },
}
