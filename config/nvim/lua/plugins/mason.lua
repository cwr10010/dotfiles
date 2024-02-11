return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      opts = function(_, opts)
        vim.list_extend(opts.ensure_installed, { "kotlin-debug-adapter" })
      end,
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "kotlin_language_server",
        "docker_compose_language_service",
        "dockerls",
        "texlab",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "ktlint",
        "prettier",
        "stylua",
      },
    })
  end,
}
