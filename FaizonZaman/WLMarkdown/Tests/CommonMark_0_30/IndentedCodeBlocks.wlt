BeginTestSection["IndentedCodeBlocks"]
(* --------------------------- Indented codeblocks -------------------------- *)
(* --------- https://spec.commonmark.org/0.30/#indented-code-blocks --------- *)

TestCreate[
	ImportMarkdown["1.  foo\n\n    - bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-109"
	]

TestCreate[
	ImportMarkdown["    <a/>\n    *hi*\n\n    - one\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "<a/>"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "hi"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "one"|>]},
	"TestID"->"Indented code blocks-110"
	]

TestCreate[
	ImportMarkdown["    a simple\n      indented code block\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "a simple"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  indented code block"|>]},
	"TestID"->"Indented code blocks-107"
	]

TestCreate[
	ImportMarkdown["    chunk1\n      \n      chunk2\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk1"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  chunk2"|>]},
	"TestID"->"Indented code blocks-112"
	]

TestCreate[
	ImportMarkdown["    chunk1\n\n    chunk2\n  \n \n \n    chunk3\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk1"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk2"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "chunk3"|>]},
	"TestID"->"Indented code blocks-111"
	]

TestCreate[
	ImportMarkdown["\n    \n    foo\n    \n\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {}|>]},
	"TestID"->"Indented code blocks-117"
	]

TestCreate[
	ImportMarkdown["    foo  \n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo  "|>]},
	"TestID"->"Indented code blocks-118"
	]

TestCreate[
	ImportMarkdown["        foo\n    bar\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-116"
	]

TestCreate[
	ImportMarkdown["  - foo\n\n    bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-108"
	]

TestCreate[
	ImportMarkdown["    foo\nbar\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-114"
	]

TestCreate[
	ImportMarkdown["Foo\n    bar\n\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>]},
	"TestID"->"Indented code blocks-113"
	]

TestCreate[
	ImportMarkdown["# Heading\n    foo\nHeading\n------\n    foo\n----\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Heading"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Heading"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "------"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>]},
	"TestID"->"Indented code blocks-115"
	]

EndTestSection[]