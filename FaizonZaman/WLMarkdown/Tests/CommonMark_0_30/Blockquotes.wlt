BeginTestSection["BlockQuotes"]
(* ------------------------------- Blockquotes ------------------------------ *)
(* ------------- https://spec.commonmark.org/0.30/#block-quotes ------------- *)

TestCreate[
	ImportMarkdown["> # Foo\n> bar\n> baz\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "BlockQuote",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Foo"|>],
					MarkdownElement[
						<|
							"Element" -> "Paragraph",
							"Data" -> {
								MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>],
								MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]
							}
						|>
					]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Block quotes-228"
]

TestCreate[
	ImportMarkdown["># Foo\n>bar\n> baz\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "BlockQuote",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Foo"|>],
					MarkdownElement[
						<|
							"Element" -> "Paragraph",
							"Data" -> {
								MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>],
								MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]
							}
						|>
					]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Block quotes-229"
]

TestCreate[
	ImportMarkdown["   > # Foo\n   > bar\n > baz\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "BlockQuote",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Foo"|>],
					MarkdownElement[
						<|
							"Element" -> "Paragraph",
							"Data" -> {
								MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>],
								MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]
							}
						|>
					]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Block quotes-230"
]

TestCreate[
	ImportMarkdown["    > # Foo\n    > bar\n    > baz\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "CodeBlock",
				"Data" -> {
					MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "> # Foo"|>],
					MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "> bar"|>],
					MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "> baz"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Block quotes-231"
]

TestCreate[
	ImportMarkdown["> # Foo\n> bar\nbaz\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "BlockQuote",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Foo"|>],
					MarkdownElement[
						<|
							"Element" -> "Paragraph",
							"Data" -> {
								MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>],
								MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]
							}
						|>
					]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Block quotes-232"
]

TestCreate[
	ImportMarkdown["> bar\nbaz\n> foo\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "BlockQuote",
				"Data" -> {
					MarkdownElement[
						<|
							"Element" -> "Paragraph",
							"Data" -> {
								MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>],
								MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>],
								MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>]
							}
						|>
					]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Block quotes-233"
]

TestCreate[
	ImportMarkdown["> foo\n---\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "BlockQuote",
				"Data" -> {
					MarkdownElement[
						<|
							"Element" -> "Paragraph",
							"Data" -> {
								MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>]
							}
						|>
					]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "ThematicBreak"|>],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Block quotes-234"
]

TestCreate[
	ImportMarkdown[">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>]},
	"TestID"->"Block quotes-239"
	]

TestCreate[
	ImportMarkdown[">\n>  \n> \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> " "|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> {}|>]},
	"TestID"->"Block quotes-240"
	]

TestCreate[
	ImportMarkdown["> aaa\n***\n> bbb\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bbb"|>]},
	"TestID"->"Block quotes-246"
	]

TestCreate[
	ImportMarkdown["> bar\n>\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-249"
	]

TestCreate[
	ImportMarkdown["> bar\n\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-248"
	]

TestCreate[
	ImportMarkdown["> bar\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Block quotes-247"
	]

TestCreate[
	ImportMarkdown[">     code\n\n>    not code\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "    code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "   not code"|>]},
	"TestID"->"Block quotes-252"
	]

TestCreate[
	ImportMarkdown["> ```\nfoo\n```\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Block quotes-237"
	]

TestCreate[
	ImportMarkdown[">\n> foo\n>  \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> " "|>]},
	"TestID"->"Block quotes-241"
	]

TestCreate[
	ImportMarkdown[">     foo\n    bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "    foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-236"
	]

TestCreate[
	ImportMarkdown["> > > foo\nbar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "> > foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-250"
	]

TestCreate[
	ImportMarkdown["> - foo\n- bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "- foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"Block quotes-235"
	]

TestCreate[
	ImportMarkdown["> foo\n    - bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "bar"|>]},
	"TestID"->"Block quotes-238"
	]

TestCreate[
	ImportMarkdown["> foo\n>\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-244"
	]

TestCreate[
	ImportMarkdown["> foo\n\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-242"
	]

TestCreate[
	ImportMarkdown["> foo\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-243"
	]

TestCreate[
	ImportMarkdown["foo\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Block quotes-245"
	]

TestCreate[
	ImportMarkdown[">>> foo\n> bar\n>>baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">>> foo"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>baz"|>]},
	"TestID"->"Block quotes-251"
	]

EndTestSection[]