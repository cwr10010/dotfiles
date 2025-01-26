-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua

-- This allows me to create my custom snippets
-- All you need to do, if using the lazyvim.org distro, is to enable the
-- coding.luasnip LazyExtra and then add this file

-- If you're a dotfiles scavenger, definitely watch this video (you're welcome)
-- https://youtu.be/FmHhonPjvvA?si=8NrcRWu4GGdmTzee

return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  opts = function(_, opts)
    local ls = require("luasnip")

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node

    local function clipboard()
      return vim.fn.getreg("+")
    end

    -- Base function to process YouTube snippets with custom formatting
    local function process_youtube_snippets(file_path, format_func)
      local snippets = {}
      local file = io.open(file_path, "r")
      if not file then
        vim.notify("Could not open snippets file: " .. file_path, vim.log.levels.ERROR)
        return snippets
      end

      local lines = {}
      for line in file:lines() do
        if line == "" then
          if #lines == 2 then
            local title, url = lines[1], lines[2]
            local formatted_content = format_func(title, url)
            table.insert(snippets, formatted_content)
          end
          lines = {}
        else
          table.insert(lines, line)
        end
      end

      -- Handle the last snippet if file doesn't end with blank line
      if #lines == 2 then
        local title, url = lines[1], lines[2]
        local formatted_content = format_func(title, url)
        table.insert(snippets, formatted_content)
      end

      file:close()
      return snippets
    end

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

    -- #####################################################################
    --                         all the filetypes
    -- #####################################################################
    ls.add_snippets("all", {
      s({
        trig = "workflow",
        name = "Add this -> lamw25wmal",
        desc = "Add this -> lamw25wmal",
      }, {
        t("lamw25wmal"),
      }),

      s({
        trig = "lam",
        name = "Add this -> lamw25wmal",
        desc = "Add this -> lamw25wmal",
      }, {
        t("lamw25wmal"),
      }),

      s({
        trig = "mw25",
        name = "Add this -> lamw25wmal",
        desc = "Add this -> lamw25wmal",
      }, {
        t("lamw25wmal"),
      }),
    })

    return opts
  end,
}
