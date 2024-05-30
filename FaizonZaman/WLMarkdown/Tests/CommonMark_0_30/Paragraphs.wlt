BeginTestSection["Paragraphs"]
(* ------------------------------- Paragraphs ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#paragraphs -------------- *)

TestCreate[
	ImportMarkdown["aaa\n\nbbb\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>]
				}
			|>
		],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
		},
	"TestID"->"Paragraphs-219"
	]

TestCreate[
	ImportMarkdown["aaa\nbbb\n\nccc\nddd\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]
				}
			|>
		],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "ccc"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "ddd"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Paragraphs-220"
]

TestCreate[
	ImportMarkdown["aaa\n\n\nbbb\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>]
				}
			|>
		],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Paragraphs-221"
]

TestCreate[
	ImportMarkdown["  aaa\n bbb\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Paragraphs-222"
]

TestCreate[
	ImportMarkdown["aaa\n             bbb\n                                       ccc\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "ccc"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Paragraphs-223"
]

TestCreate[
	ImportMarkdown["   aaa\nbbb\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
	},
	"TestID"->"Paragraphs-224"
]

TestCreate[
	ImportMarkdown["    aaa\nbbb\n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "CodeBlock",
				"Data" -> {
					MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "aaa"|>]
				}
			|>
		],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
		},
	"TestID"->"Paragraphs-225"
]

TestCreate[
	ImportMarkdown["aaa     \nbbb     \n"],
	{
		MarkdownElement[<|"Element" -> "BeginMarkdown"|>],
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>],
					MarkdownElement[<|"Element" -> "LineBreak"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]
				}
			|>
		],
		MarkdownElement[<|"Element" -> "EndMarkdown"|>]
		},
	"TestID"->"Paragraphs-226"
]

EndTestSection[]