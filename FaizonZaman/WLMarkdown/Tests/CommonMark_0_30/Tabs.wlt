BeginTestSection["Tabs"]
(* ---------------------------------- Tabs ---------------------------------- *)
(* ----------------- https://spec.commonmark.org/0.30/#tabs ----------------- *)

TestCreate[
	ImportMarkdown["\tfoo\tbaz\t\tbim\n"],
	{MarkdownElement[<|"Element" -> "CodeBlock", "Data" -> {MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "foo	baz		bim"|>]}|>]},
	"TestID"->"Tabs-1"
	]

TestCreate[
	ImportMarkdown["  \tfoo\tbaz\t\tbim\n"],
	{MarkdownElement[<|"Element" -> "CodeBlock", "Data" -> {MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "foo	baz		bim"|>]}|>]},
	"TestID"->"Tabs-2"
	]

TestCreate[
	ImportMarkdown["    a\ta\n    \:1f50\ta\n"],
	{MarkdownElement[<|"Element" -> "CodeBlock", "Data" -> {MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "a	a"|>], MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "ὐ	a"|>]}|>]},
	"TestID"->"Tabs-3"
	]

TestCreate[
	ImportMarkdown["  - foo\n\n\tbar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\tbar"|>]},
	"TestID"->"Tabs-4"
	]

TestCreate[
	ImportMarkdown["- foo\n\n\t\tbar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\t\tbar"|>]},
	"TestID"->"Tabs-5"
	]

TestCreate[
	ImportMarkdown[">\t\tfoo\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "\tfoo"|>]},
	"TestID"->"Tabs-6"
	]

TestCreate[
	ImportMarkdown["-\t\tfoo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "\tfoo"|>]},
	"TestID"->"Tabs-7"
	]

TestCreate[
	ImportMarkdown["    foo\n\tbar\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\tbar"|>]},
	"TestID"->"Tabs-8"
	]

TestCreate[
	ImportMarkdown[" - foo\n   - bar\n\t - baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "baz"|>]},
	"TestID"->"Tabs-9"
	]

TestCreate[
	ImportMarkdown["#\tFoo\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Foo"|>]},
	"TestID"->"Tabs-10"
	]

TestCreate[
	ImportMarkdown["*\t*\t*\t\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "\t"|>], "\t"}|>]},
	"TestID"->"Tabs-11"
	]
EndTestSection[]