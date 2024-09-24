BeginTestSection["BackslashEscapes"]
(* ---------------------------- BackslashEscapes ---------------------------- *)
(* ----------- https://spec.commonmark.org/0.30/#backslash-escapes ---------- *)

TestCreate[
	ImportMarkdown["\\!\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~\n"],
	{
		MarkdownElement[<|"Element"->"BeginMarkdown"|>],
		MarkdownElement[<|"Element"->"Paragraph", "Data"-> {MarkdownElement["Element"->"Line", "Data"->"!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~"]}|>],
		MarkdownElement[<|"Element"->"EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-12"
	]


TestCreate[
	ImportMarkdown["\\\t\\A\\a\\ \\3\\\[CurlyPhi]\\<<\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>], 
		MarkdownElement[<|"Element" -> "Paragraph", "Data" -> {MarkdownElement[<|"Element" -> "Line", "Data" -> "\\\t\\A\\a\\ \\3\\\[CurlyPhi]\\<<"|>]}|>], 
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-13"
	]

TestCreate[
	ImportMarkdown["\\*not emphasized*\n\\<br/> not a tag\n\\[not a link](/foo)\n\\`not code`\n1\\. not a list\n\\* not a list\n\\# not a heading\n\\[foo]: /url \"not a reference\"\n\\&ouml; not a character entity\n"],
	{
		MarkdownElement[<|"Element"->"BeginMarkdown"|>],
		MarkdownElement[<|"Eement"->"Paragraph", "Data"->{
			MarkdownElement[<|"Element"->"Line", "Data" -> "\\*not emphasized*"|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "\\<br/> not a tag"|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "\\[not a link", "/foo]"|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "\\`not code`"|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "1\\. not a list"|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "\\* not a list"|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "\\# not a heading"|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "[foo]: /url \"not a reference\""|>],
			MarkdownElement[<|"Element"->"Line", "Data" -> "\\&ouml; not a character entity"|>]
		}|>],
		MarkdownElement[<|"Element"->"EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-14"
	]
TestCreate[
	ImportMarkdown["\\\\*emphasis*\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>], 
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\\\", MarkdownElement[<|"Element" -> "*", "Data" -> "emphasis"|>]}|>]
				}
			|>
		], 
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-15"
	]

TestCreate[
	ImportMarkdown["foo\\\nbar\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>], 
		MarkdownElement[<|"Element" -> "Paragraph", "Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], 
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]
				}
			|>
		], 
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-16"
	]


TestCreate[
	ImportMarkdown["`` \\[\\` ``\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Code", "Data" -> "\\[\\`"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-17"
	]

TestCreate[
	ImportMarkdown["    \\[\\]\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[<|"Element" -> "CodeBlock", "Data" -> {MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "\\[\\]"|>]}|>], 
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-18"
	]


TestCreate[
	ImportMarkdown["~~~\n\\[\\]\n~~~\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[<|"Element" -> "CodeBlock", "Data" -> "\\[\\]"|>],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-19"
	]

TestCreate[
	ImportMarkdown["<http://example.com?find=\\*>\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>], 
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[
						<|
							"Element" -> "Line",
							"Data" -> {
								MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://example.com?find=\\*"|>]
							}
						|>
					]
				}
			|>
		], 
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-20"
	]

TestCreate[
	ImportMarkdown["<a href=\"/bar\\/)\">\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[<|"Element" -> "Line", "Data" -> "<a href=\"/bar\\/)\">"|>],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-21"
	]

TestCreate[
	ImportMarkdown["[foo](/bar\\* \"ti\\*tle\")\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Line",
				"Data" -> {
					MarkdownElement[
						<|
							"Element" -> "HyperLink",
							"Data" -> {"foo", <|"URL" -> "/bar*", "Title" -> "ti*tle"|>}
						|>
					]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Backslash escapes-22"
	]

TestCreate[
	ImportMarkdown["[foo]\n\n[foo]: /bar\\* \"ti\\*tle\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo]: /bar\\", MarkdownElement[<|"Element" -> "*", "Data" -> " \"ti\\"|>], "tle\""}|>]},
	"TestID"->"Backslash escapes-23"
	]

TestCreate[
	ImportMarkdown["``` foo\\+bar\nfoo\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " foo\\+bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Backslash escapes-24"
	]

EndTestSection[]