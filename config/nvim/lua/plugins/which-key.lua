return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>d"] = { name = "+DAP" },
        ["<leader>m"] = { name = "+Mason", m = { "<cmd>Mason<cr>", "Mason" } },
      },
    },
  },
}
