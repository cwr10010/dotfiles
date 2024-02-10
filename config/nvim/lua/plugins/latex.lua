return {
  {
    "f3fora/nvim-texlabconfig",
    config = function()
      require("lspconfig").texlab.setup({
        setting = {
          texlab = {
            forwardSearch = {
              executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
              args = { "%l", "%p", "%f" },
            },
          },
        },
      })
    end,
  },
}
