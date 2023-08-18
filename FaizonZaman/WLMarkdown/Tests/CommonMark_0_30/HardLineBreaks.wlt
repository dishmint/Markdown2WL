BeginTestSection["HardLineBreaks"]
(* ---------------------------- Hard line breaks ---------------------------- *)
(* ----------- https://spec.commonmark.org/0.30/#hard-line-breaks ----------- *)
TestCreate[
	ImportMarkdown["<a href=\"foo  \nbar\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<a href=\"foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar\">"|>]},
	"TestID"->"Hard line breaks-642"
	]

TestCreate[
	ImportMarkdown["<a href=\"foo\\\nbar\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<a href=\"foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar\">"|>]},
	"TestID"->"Hard line breaks-643"
	]

TestCreate[
	ImportMarkdown["`code  \nspan`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "code  "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"span", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Hard line breaks-640"
	]

TestCreate[
	ImportMarkdown["`code\\\nspan`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "code\\"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"span", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Hard line breaks-641"
	]

TestCreate[
	ImportMarkdown["### foo\\\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo\\"|>]},
	"TestID"->"Hard line breaks-646"
	]

TestCreate[
	ImportMarkdown["### foo  \n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo  "|>]},
	"TestID"->"Hard line breaks-647"
	]

TestCreate[
	ImportMarkdown["foo\\\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>]},
	"TestID"->"Hard line breaks-644"
	]

TestCreate[
	ImportMarkdown["foo  \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>]},
	"TestID"->"Hard line breaks-645"
	]

TestCreate[
	ImportMarkdown["*foo  \nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo  "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Hard line breaks-638"
	]

TestCreate[
	ImportMarkdown["*foo\\\nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo\\"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Hard line breaks-639"
	]

TestCreate[
	ImportMarkdown["foo  \n     bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " bar"|>]},
	"TestID"->"Hard line breaks-636"
	]

TestCreate[
	ImportMarkdown["foo\\\n     bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " bar"|>]},
	"TestID"->"Hard line breaks-637"
	]

TestCreate[
	ImportMarkdown["foo       \nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo       "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-635"
	]

TestCreate[
	ImportMarkdown["foo  \nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-633"
	]

TestCreate[
	ImportMarkdown["foo\\\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-634"
	]

EndTestSection[]