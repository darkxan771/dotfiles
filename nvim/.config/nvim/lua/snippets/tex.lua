local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- skip -> bigskip
	ls.snippet(
		"skip",
		fmt(
			[[
\bigskip
{} 
    ]],
			{
				ls.insert_node(1),
			}
		)
	),

	-- mskip -> bigskip
	ls.snippet(
		"mskip",
		fmt(
			[[
\medskip
{} 
    ]],
			{
				ls.insert_node(1),
			}
		)
	),

	-- bali → align environment
	ls.snippet(
		"bali",
		fmt(
			[[
\begin{{align*}}
{} 
\end{{align*}}
    ]],
			{
				ls.insert_node(1),
			}
		)
	),

	-- mapi → map environment
	ls.snippet(
		"mapi",
		fmt(
			[[
\begin{{align*}}
{} &\to \\
   &\mapsto
\end{{align*}}
    ]],
			{
				ls.insert_node(1),
			}
		)
	),

	-- tikz -> tikzpicture environment
	ls.snippet(
		"tikz",
		fmt(
			[[
\begin{{tikzpicture}}[scale=1]
{}
\end{{tikzpicture}}
    ]],
			{
				ls.insert_node(1),
			}
		)
	),

	-- prop -> proposition environment
	ls.snippet(
		"prop",
		fmt(
			[[
\begin{{proposition}}[{title}]
{body}
\end{{proposition}}
    ]],
			{
				title = ls.insert_node(1, "Title"),
				body = ls.insert_node(2),
			}
		)
	),

	-- coro -> corollary environment
	ls.snippet(
		"coro",
		fmt(
			[[
\begin{{corollary}}[{title}]
{body}
\end{{corollary}}
    ]],
			{
				title = ls.insert_node(1, "Title"),
				body = ls.insert_node(2),
			}
		)
	),

	-- rem -> remark environment
	ls.snippet(
		"rem",
		fmt(
			[[
\begin{{remark}}
{}
\end{{remark}}
    ]],
			{
				ls.insert_node(1),
			}
		)
	),

	-- exam -> example environment
	ls.snippet(
		"exam",
		fmt(
			[[
\begin{{example}}
{}
\end{{example}}
    ]],
			{
				ls.insert_node(1),
			}
		)
	),
}
