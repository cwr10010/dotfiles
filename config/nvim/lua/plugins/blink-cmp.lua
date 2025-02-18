return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    enabled = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
      },

      appearance = {
        use_nvim_cmp_as_default = true,
      },

      signature = {
        enabled = true,
      },
    },
  },
}
