BeginTestSection["ATXHeadings"]
(* ------------------------------ ATX Headings ------------------------------ *)
(* -------------- https://spec.commonmark.org/0.30/#atx-heading ------------- *)

VerificationTest[
	ImportMarkdown["# foo\n## foo\n### foo\n#### foo\n##### foo\n###### foo\n"],
	{
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 2, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 4, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 5, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 6, "Data" -> "foo"|>]
		},
	"TestID"->"ATX headings-62"
	]

VerificationTest[
	ImportMarkdown["####### foo\n"],
	{MarkdownElement[<|"Element" -> "Paragraph", "Data" -> {MarkdownElement[<|"Element" -> "Line", "Data" -> "####### foo"|>]}|>]},
	"TestID"->"ATX headings-63"
	]

VerificationTest[
	ImportMarkdown["#5 bolt\n\n#hashtag\n"],
	{
		MarkdownElement[<|"Element" -> "Paragraph", "Data" -> {MarkdownElement[<|"Element" -> "Line", "Data" -> "#5 bolt"|>]}|>],
		MarkdownElement[<|"Element" -> "EmptyLine"|>],
		MarkdownElement[<|"Element" -> "Paragraph", "Data" -> {MarkdownElement[<|"Element" -> "Line", "Data" -> "#hashtag"|>]}|>]
		},
	"TestID"->"ATX headings-64"
	]

VerificationTest[
	ImportMarkdown["\\## foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\## foo"|>]},
	"TestID"->"ATX headings-65"
	]

VerificationTest[
	ImportMarkdown["# foo *bar* \*baz\*\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> {"foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], " \*baz\*"}|>]},
	"TestID"->"ATX headings-66"
	]

VerificationTest[
	ImportMarkdown["#                  foo                     \n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "foo"|>]},
	"TestID"->"ATX headings-67"
	]

VerificationTest[
	ImportMarkdown[" ### foo\n  ## foo\n   # foo\n"],
	{
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 2, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "foo"|>]
		},
	"TestID"->"ATX headings-68"
	]

VerificationTest[
	ImportMarkdown["    # foo\n"],
	{MarkdownElement[<|"Element" -> "CodeLine", "Data" -> "# foo"|>]},
	"TestID"->"ATX headings-69"
	]

VerificationTest[
	ImportMarkdown["foo\n    # bar\n"],
	{
		MarkdownElement[
			<|
				"Element" -> "Paragraph",
				"Data" -> {
					MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>],
					MarkdownElement[<|"Element" -> "Line", "Data" -> "# bar"|>]
					}
				|>
				]
		},
	"TestID"->"ATX headings-70"
	]

VerificationTest[
	ImportMarkdown["## foo ##\n  ###   bar    ###\n"],
	{
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 2, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "bar"|>]
		},
	"TestID"->"ATX headings-71"
	]

VerificationTest[
	ImportMarkdown["# foo ##################################\n##### foo ##\n"],
	{
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 5, "Data" -> "foo"|>]
		},
	"TestID"->"ATX headings-72"
	]

VerificationTest[
	ImportMarkdown["### foo ###     \n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo"|>]},
	"TestID"->"ATX headings-73"
	]

VerificationTest[
	ImportMarkdown["### foo ### b\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo ### b"|>]},
	"TestID"->"ATX headings-74"
	]

VerificationTest[
	ImportMarkdown["# foo#\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "foo#"|>]},
	"TestID"->"ATX headings-75"
	]

VerificationTest[
	ImportMarkdown["### foo \\###\n## foo #\\##\n# foo \\#\n"],
	{
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo ###"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 2, "Data" -> "foo ###"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "foo #"|>]
		},
	"TestID"->"ATX headings-76"
	]

VerificationTest[
	ImportMarkdown["****\n## foo\n****\n"],
	{
		MarkdownElement[<|"Element" -> "ThematicBreak"|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 2, "Data" -> "foo"|>],
		MarkdownElement[<|"Element" -> "ThematicBreak"|>]
		},
	"TestID"->"ATX headings-77"
	]

VerificationTest[
	ImportMarkdown["Foo bar\n# baz\nBar foo\n"],
	{
		MarkdownElement[<|"Element" -> "Paragraph", "Data" -> {MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo bar"|>]}|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "baz"|>],
		MarkdownElement[<|"Element" -> "Paragraph", "Data" -> {MarkdownElement[<|"Element" -> "Line", "Data" -> "Bar foo"|>]}|>]
		},
	"TestID"->"ATX headings-78"
	]
VerificationTest[
	ImportMarkdown["## \n#\n### ###\n"],
	{
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 2, "Data" -> {}|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> {}|>],
		MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> {}|>]
		},
	"TestID"->"ATX headings-79"
	]

EndTestSection[]