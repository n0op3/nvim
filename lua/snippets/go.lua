local ls = require("luasnip")
local s, i = ls.snippet, ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
    s("ie", fmt([[
if err != nil {{
	return {}
}}
]], { i(1, "err") })),

    s("iew", fmt([[
if err != nil {{
	return fmt.Errorf("{}: %w", err)
}}
]], { i(1, "context") }))
})
