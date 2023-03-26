BeginTestSection["SetextHeadings"]
(* ----------------------------- Setext headings ---------------------------- *)
(* ------------ https://spec.commonmark.org/0.30/#setext-headings ----------- *)

VerificationTest[
	ImportMarkdown["\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-97"
	]

VerificationTest[
	ImportMarkdown["---\n---\n"],
	{MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-98"
	]

VerificationTest[
	ImportMarkdown["    foo\n---\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-100"
	]

VerificationTest[
	ImportMarkdown["\\> foo\n------\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\> foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "------"|>]},
	"TestID"->"Setext headings-102"
	]

VerificationTest[
	ImportMarkdown["- Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-94"
	]

VerificationTest[
	ImportMarkdown["> Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-92"
	]

VerificationTest[
	ImportMarkdown["- foo\n-----\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-99"
	]

VerificationTest[
	ImportMarkdown["> foo\n-----\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-101"
	]

VerificationTest[
	ImportMarkdown["Foo\\\n----\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>]},
	"TestID"->"Setext headings-90"
	]

VerificationTest[
	ImportMarkdown["Foo\n    ---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "---"|>]},
	"TestID"->"Setext headings-87"
	]

VerificationTest[
	ImportMarkdown["Foo  \n-----\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>]},
	"TestID"->"Setext headings-89"
	]

VerificationTest[
	ImportMarkdown["Foo\n   ----      \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   ----      "|>]},
	"TestID"->"Setext headings-86"
	]

VerificationTest[
	ImportMarkdown["`Foo\n----\n`\n\n<a title=\"a lot\n---\nof dashes\"/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "Foo"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "----"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<a title=\"a lot"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "of dashes\"/>"|>]},
	"TestID"->"Setext headings-91"
	]

VerificationTest[
	ImportMarkdown["> foo\nbar\n===\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>]},
	"TestID"->"Setext headings-93"
	]

VerificationTest[
	ImportMarkdown["Foo\nBar\n---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-95"
	]

VerificationTest[
	ImportMarkdown["---\nFoo\n---\nBar\n---\nBaz\n"],
	{MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Baz"|>]},
	"TestID"->"Setext headings-96"
	]

VerificationTest[
	ImportMarkdown["  Foo *bar\nbaz*\t\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"  Foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "\t"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-82"
	]

VerificationTest[
	ImportMarkdown["Foo\n\nbar\n---\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-103"
	]

VerificationTest[
	ImportMarkdown["Foo *bar\nbaz*\n====\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "===="|>]},
	"TestID"->"Setext headings-81"
	]

VerificationTest[
	ImportMarkdown["Foo\nbar\n* * *\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-105"
	]

VerificationTest[
	ImportMarkdown["Foo\nbar\n\n---\n\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-104"
	]

VerificationTest[
	ImportMarkdown["Foo\nbar\n\\---\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\\---"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Setext headings-106"
	]

VerificationTest[
	ImportMarkdown["Foo *bar*\n=========\n\nFoo *bar*\n---------\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "========="|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "---------"|>]},
	"TestID"->"Setext headings-80"
	]

VerificationTest[
	ImportMarkdown["    Foo\n    ---\n\n    Foo\n---\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "---"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>]},
	"TestID"->"Setext headings-85"
	]

VerificationTest[
	ImportMarkdown["Foo\n-------------------------\n\nFoo\n=\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-------------------------"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "="|>]},
	"TestID"->"Setext headings-83"
	]

VerificationTest[
	ImportMarkdown["Foo\n= =\n\nFoo\n--- -\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "= ="|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "--- -"|>]},
	"TestID"->"Setext headings-88"
	]

VerificationTest[
	ImportMarkdown["   Foo\n---\n\n  Foo\n-----\n\n  Foo\n  ===\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-----"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  ==="|>]},
	"TestID"->"Setext headings-84"
	]

EndTestSection[]