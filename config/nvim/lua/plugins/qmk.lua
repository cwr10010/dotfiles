return {
  "codethread/qmk.nvim",
  dependencies = {
    "joelspadin/tree-sitter-devicetree",
  },
  config = function()
    local qmk = require("qmk")
    qmk.setup({
      name = "corne",
      variant = "zmk",
      comment_preview = {
        keymap_overrides = {
          Y = "Z",
          Z = "Y",
          MINUS = "ß",
          EQUAL = "´",
          LBKT = "Ü",
          RBKT = "+",
          SEMI = "Ö",
          SQT = "Ä",
          BSLH = "#",
          FSLH = "-",
        },
      },
      layout = {
        "x x x x x x _ _ _ x x x x x x",
        "x x x x x x _ _ _ x x x x x x",
        "x x x x x x _ _ _ x x x x x x",
        "_ _ _ _ x x x _ x x x _ _ _ _",
      },
    })
  end,
}
