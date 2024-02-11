return {
  "nvim-neotest/neotest",
  dependencies = {
    { "sidlatau/neotest-dart" },
    { "weilbith/neotest-gradle" },
  },
  event = "VeryLazy",
  opts = function(_, opts)
    vim.list_extend(opts.adapters, {
      require("neotest-dart")({ command = "flutter" }),
      require("neotest-gradle"),
    })
  end,
}
