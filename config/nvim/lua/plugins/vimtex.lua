return {
  "lervag/vimtex",
  event = "VeryLazy",
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
      pattern = { "tex" },
      desc = "Enable german spell checking and text wrapping for LaTeX",
      callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "de"
      end,
    })

    vim.g["vimtex_view_method"] = "skim"
    vim.g["vimtex_quickfix_mode"] = 0
    vim.g["vimtex_view_skim_sync"] = 1
    vim.g["wimtex_view_skim_activate"] = 1
    vim.g["vimtex_mappings_enabled"] = 1
    vim.g["vimtex_indent_enabled"] = 1
    vim.g["vimtex_syntax_enabled"] = 1
    vim.g["vimtex_log_ignore"] = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }
    vim.g["vimtex_context_pdf_viewer"] = "skim"
end,
}
