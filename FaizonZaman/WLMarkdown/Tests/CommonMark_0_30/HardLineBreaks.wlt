BeginTestSection["HardLineBreaks"]
(* ---------------------------- Hard line breaks ---------------------------- *)
(* ----------- https://spec.commonmark.org/0.30/#hard-line-breaks ----------- *)
VerificationTest[
	ImportMarkdown["<a href=\"foo  \nbar\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<a href=\"foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar\">"|>]},
	"TestID"->"Hard line breaks-642"
	]

VerificationTest[
	ImportMarkdown["<a href=\"foo\\\nbar\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "<a href=\"foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar\">"|>]},
	"TestID"->"Hard line breaks-643"
	]

VerificationTest[
	ImportMarkdown["`code  \nspan`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "code  "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"span", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Hard line breaks-640"
	]

VerificationTest[
	ImportMarkdown["`code\\\nspan`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "code\\"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"span", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Hard line breaks-641"
	]

VerificationTest[
	ImportMarkdown["### foo\\\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo\\"|>]},
	"TestID"->"Hard line breaks-646"
	]

VerificationTest[
	ImportMarkdown["### foo  \n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 3, "Data" -> "foo  "|>]},
	"TestID"->"Hard line breaks-647"
	]

VerificationTest[
	ImportMarkdown["foo\\\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>]},
	"TestID"->"Hard line breaks-644"
	]

VerificationTest[
	ImportMarkdown["foo  \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>]},
	"TestID"->"Hard line breaks-645"
	]

VerificationTest[
	ImportMarkdown["*foo  \nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo  "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Hard line breaks-638"
	]

VerificationTest[
	ImportMarkdown["*foo\\\nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo\\"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Hard line breaks-639"
	]

VerificationTest[
	ImportMarkdown["foo  \n     bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " bar"|>]},
	"TestID"->"Hard line breaks-636"
	]

VerificationTest[
	ImportMarkdown["foo\\\n     bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " bar"|>]},
	"TestID"->"Hard line breaks-637"
	]

VerificationTest[
	ImportMarkdown["foo       \nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo       "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-635"
	]

VerificationTest[
	ImportMarkdown["foo  \nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-633"
	]

VerificationTest[
	ImportMarkdown["foo\\\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Hard line breaks-634"
	]

EndTestSection[]