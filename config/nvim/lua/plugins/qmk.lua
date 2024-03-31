return {
  "codethread/qmk.nvim",
  dependencies = {
    "joelspadin/tree-sitter-devicetree",
  },
  ft = "devicetree",
  lazy = true,
  config = function()
    local qmk = require("qmk")
    qmk.setup({
      name = "corne",
      variant = "zmk",
      layout = {
        "x x x x x x _ _ _ x x x x x x",
        "x x x x x x _ _ _ x x x x x x",
        "x x x x x x _ _ _ x x x x x x",
        "_ _ _ _ x x x _ x x x _ _ _ _",
      },
    })
  end,
}
