BeginTestSection["CodeSpans"]
(* ------------------------------- Code Spans ------------------------------- *)
(* -------------- https://spec.commonmark.org/0.30/#code-spans -------------- *)

VerificationTest[
	ImportMarkdown["` `` `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-330"
	]

VerificationTest[
	ImportMarkdown["`  ``  `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-331"
	]

VerificationTest[
	ImportMarkdown["` `\n`  `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "  "|>]}|>]},
	"TestID"->"Code spans-334"
	]

VerificationTest[
	ImportMarkdown["` a`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " a"|>]}|>]},
	"TestID"->"Code spans-332"
	]

VerificationTest[
	ImportMarkdown["`<a href=\"`\">`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"`\""|>]}|>]}|>]},
	"TestID"->"Code spans-343"
	]

VerificationTest[
	ImportMarkdown["<a href=\"`\">`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"`\""|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-344"
	]

VerificationTest[
	ImportMarkdown["` b `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> " b "|>]}|>]},
	"TestID"->"Code spans-333"
	]

VerificationTest[
	ImportMarkdown["```foo``\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> "foo``"|>]},
	"TestID"->"Code spans-347"
	]

VerificationTest[
	ImportMarkdown["``\nfoo \n``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-336"
	]

VerificationTest[
	ImportMarkdown["`foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo"}|>]},
	"TestID"->"Code spans-348"
	]

VerificationTest[
	ImportMarkdown["`foo`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> "foo"|>]}|>]},
	"TestID"->"Code spans-328"
	]

VerificationTest[
	ImportMarkdown["*foo`*`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-341"
	]

VerificationTest[
	ImportMarkdown["`` foo ` bar ``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-329"
	]

VerificationTest[
	ImportMarkdown["` foo `` bar `\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], " bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-340"
	]

VerificationTest[
	ImportMarkdown["``foo`bar``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-339"
	]

VerificationTest[
	ImportMarkdown["`foo\\`bar`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-338"
	]

VerificationTest[
	ImportMarkdown["`foo``bar``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-349"
	]

VerificationTest[
	ImportMarkdown["``\nfoo\nbar  \nbaz\n``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "``"|>]}|>]},
	"TestID"->"Code spans-335"
	]

VerificationTest[
	ImportMarkdown["`foo   bar \nbaz`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "foo   bar "}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-337"
	]

VerificationTest[
	ImportMarkdown["`<http://foo.bar.`baz>`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "`", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.`baz"|>]}|>]}|>]},
	"TestID"->"Code spans-345"
	]

VerificationTest[
	ImportMarkdown["<http://foo.bar.`baz>`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar.`baz"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Code spans-346"
	]

VerificationTest[
	ImportMarkdown["[not a `link](/foo`)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"not a `link", "/foo`"}|>]}|>]},
	"TestID"->"Code spans-342"
	]
EndTestSection[]