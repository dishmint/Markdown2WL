BeginTestSection["Tabs"]
(* ---------------------------------- Tabs ---------------------------------- *)
(* ----------------- https://spec.commonmark.org/0.30/#tabs ----------------- *)

VerificationTest[
	ImportMarkdown["\tfoo\tbaz\t\tbim\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\tfoo\tbaz\t\tbim"|>]},
	"TestID"->"Tabs-1"
	]
VerificationTest[
	ImportMarkdown["  \tfoo\tbaz\t\tbim\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  \tfoo\tbaz\t\tbim"|>]},
	"TestID"->"Tabs-2"
	]
VerificationTest[
	ImportMarkdown["    a\ta\n    \:1f50\ta\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "a\ta"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "\:1f50\ta"|>]},
	"TestID"->"Tabs-3"
	]
VerificationTest[
	ImportMarkdown["  - foo\n\n\tbar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\tbar"|>]},
	"TestID"->"Tabs-4"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n\t\tbar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\t\tbar"|>]},
	"TestID"->"Tabs-5"
	]

VerificationTest[
	ImportMarkdown[">\t\tfoo\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "\tfoo"|>]},
	"TestID"->"Tabs-6"
	]

VerificationTest[
	ImportMarkdown["-\t\tfoo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "\tfoo"|>]},
	"TestID"->"Tabs-7"
	]

VerificationTest[
	ImportMarkdown["    foo\n\tbar\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\tbar"|>]},
	"TestID"->"Tabs-8"
	]

VerificationTest[
	ImportMarkdown[" - foo\n   - bar\n\t - baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "baz"|>]},
	"TestID"->"Tabs-9"
	]

VerificationTest[
	ImportMarkdown["#\tFoo\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "Foo"|>]},
	"TestID"->"Tabs-10"
	]

VerificationTest[
	ImportMarkdown["*\t*\t*\t\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "\t"|>], "\t"}|>]},
	"TestID"->"Tabs-11"
	]
EndTestSection[]