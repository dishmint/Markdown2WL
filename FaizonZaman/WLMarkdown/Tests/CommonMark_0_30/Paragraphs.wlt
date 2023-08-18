BeginTestSection["Paragraphs"]
(* ------------------------------- Paragraphs ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#paragraphs -------------- *)

TestCreate[
	ImportMarkdown["    aaa\nbbb\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-225"
	]

TestCreate[
	ImportMarkdown["   aaa\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-224"
	]

TestCreate[
	ImportMarkdown["  aaa\n bbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " bbb"|>]},
	"TestID"->"Paragraphs-222"
	]

TestCreate[
	ImportMarkdown["aaa     \nbbb     \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa     "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb     "|>]},
	"TestID"->"Paragraphs-226"
	]

TestCreate[
	ImportMarkdown["aaa\n\n\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-221"
	]

TestCreate[
	ImportMarkdown["aaa\n\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-219"
	]

TestCreate[
	ImportMarkdown["aaa\n             bbb\n                                       ccc\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "         bbb"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "                                   ccc"|>]},
	"TestID"->"Paragraphs-223"
	]

TestCreate[
	ImportMarkdown["aaa\nbbb\n\nccc\nddd\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "ccc"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "ddd"|>]},
	"TestID"->"Paragraphs-220"
	]

EndTestSection[]