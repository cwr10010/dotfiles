-- This allows me to create my custom snippets
-- All you need to do, if using the lazyvim.org distro, is to enable the
-- coding.luasnip LazyExtra and then add this file
return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  opts = function(_, opts)
    local ls = require("luasnip")

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node

    -- #####################################################################
    --                            Markdown
    -- #####################################################################

    -- Helper function to create code block snippets
    local function create_code_block_snippet(lang)
      return s({
        trig = lang,
        name = "Codeblock",
        desc = lang .. " codeblock",
      }, {
        t({ "```" .. lang, "" }),
        i(1),
        t({ "", "```" }),
      })
    end

    -- Define languages for code blocks
    local languages = {
      "txt",
      "lua",
      "sql",
      "go",
      "regex",
      "bash",
      "markdown",
      "markdown_inline",
      "yaml",
      "json",
      "jsonc",
      "cpp",
      "csv",
      "java",
      "javascript",
      "python",
      "dockerfile",
      "html",
      "css",
      "templ",
      "php",
    }

    -- Generate snippets for all languages
    local snippets = {}

    for _, lang in ipairs(languages) do
      table.insert(snippets, create_code_block_snippet(lang))
    end

    ls.add_snippets("markdown", snippets)
  end,
}
