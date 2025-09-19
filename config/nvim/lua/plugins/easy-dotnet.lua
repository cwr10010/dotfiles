return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local dotnet = require("easy-dotnet")
    dotnet.setup()
  end,
}
