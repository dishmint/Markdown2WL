BeginTestSection["SetextHeadings"]
(* ----------------------------- Setext headings ---------------------------- *)
(* ------------ https://spec.commonmark.org/0.30/#setext-headings ----------- *)

TestCreate[
	ImportMarkdown["\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-97"
	]

TestCreate[
	ImportMarkdown["---\n---\n"],
	{MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-98"
	]

TestCreate[
	ImportMarkdown["    foo\n---\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-100"
	]

TestCreate[
	ImportMarkdown["\\> foo\n------\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\> foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "------"|>]},
	"TestID"->"Setext headings-102"
	]

TestCreate[
	ImportMarkdown["- Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-94"
	]

TestCreate[
	ImportMarkdown["> Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-92"
	]

TestCreate[
	ImportMarkdown["- foo\n-----\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-99"
	]

TestCreate[
	ImportMarkdown["> foo\n-----\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-101"
	]

TestCreate[
	ImportMarkdown["Foo\\\n----\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>]},
	"TestID"->"Setext headings-90"
	]

TestCreate[
	ImportMarkdown["Foo\n    ---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "---"|>]},
	"TestID"->"Setext headings-87"
	]

TestCreate[
	ImportMarkdown["Foo  \n-----\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-89"
	]

TestCreate[
	ImportMarkdown["Foo\n   ----      \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   ----      "|>]},
	"TestID"->"Setext headings-86"
	]

TestCreate[
	ImportMarkdown["`Foo\n----\n`\n\n<a title=\"a lot\n---\nof dashes\"/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "Foo"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<a title=\"a lot"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "of dashes\"/>"|>]},
	"TestID"->"Setext headings-91"
	]

TestCreate[
	ImportMarkdown["> foo\nbar\n===\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>]},
	"TestID"->"Setext headings-93"
	]

TestCreate[
	ImportMarkdown["Foo\nBar\n---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-95"
	]

TestCreate[
	ImportMarkdown["---\nFoo\n---\nBar\n---\nBaz\n"],
	{MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Baz"|>]},
	"TestID"->"Setext headings-96"
	]

TestCreate[
	ImportMarkdown["  Foo *bar\nbaz*\t\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  Foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "\t"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-82"
	]

TestCreate[
	ImportMarkdown["Foo\n\nbar\n---\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-103"
	]

TestCreate[
	ImportMarkdown["Foo *bar\nbaz*\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-81"
	]

TestCreate[
	ImportMarkdown["Foo\nbar\n* * *\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-105"
	]

TestCreate[
	ImportMarkdown["Foo\nbar\n\n---\n\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-104"
	]

TestCreate[
	ImportMarkdown["Foo\nbar\n\\---\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\\---"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-106"
	]

TestCreate[
	ImportMarkdown["Foo *bar*\n=========\n\nFoo *bar*\n---------\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "========="|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "---------"|>]},
	"TestID"->"Setext headings-80"
	]

TestCreate[
	ImportMarkdown["    Foo\n    ---\n\n    Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "---"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-85"
	]

TestCreate[
	ImportMarkdown["Foo\n-------------------------\n\nFoo\n=\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-------------------------"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "="|>]},
	"TestID"->"Setext headings-83"
	]

TestCreate[
	ImportMarkdown["Foo\n= =\n\nFoo\n--- -\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "= ="|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "--- -"|>]},
	"TestID"->"Setext headings-88"
	]

TestCreate[
	ImportMarkdown["   Foo\n---\n\n  Foo\n-----\n\n  Foo\n  ===\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  ==="|>]},
	"TestID"->"Setext headings-84"
	]

EndTestSection[]