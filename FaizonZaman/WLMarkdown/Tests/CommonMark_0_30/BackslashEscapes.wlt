BeginTestSection["BackslashEscapes"]
(* ---------------------------- BackslashEscapes ---------------------------- *)
(* ----------- https://spec.commonmark.org/0.30/#backslash-escapes ---------- *)

VerificationTest[
	ImportMarkdown["    \\[\\]\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>]}|>]},
	"TestID"->"Backslash escapes-18"
	]

VerificationTest[
	ImportMarkdown["`` \\[\\` ``\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "``", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], " "}|>]}|>]},
	"TestID"->"Backslash escapes-17"
	]

VerificationTest[
	ImportMarkdown["~~~\n\\[\\]\n~~~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "~~~"|>]},
	"TestID"->"Backslash escapes-19"
	]

VerificationTest[
	ImportMarkdown["\\\t\\A\\a\\ \\3\\\[CurlyPhi]\\<<\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "\\\t\\A\\a\\ \\3\\\[CurlyPhi]\\<<"|>]},
	"TestID"->"Backslash escapes-13"
	]

VerificationTest[
	ImportMarkdown["<a href=\"/bar\\/)\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"/bar\\/)\""|>]}|>]},
	"TestID"->"Backslash escapes-21"
	]

VerificationTest[
	ImportMarkdown["\\\\*emphasis*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\\\", MarkdownElement[<|"Element" -> "*", "Data" -> "emphasis"|>]}|>]},
	"TestID"->"Backslash escapes-15"
	]

VerificationTest[
	ImportMarkdown["foo\\\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo\\"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Backslash escapes-16"
	]

VerificationTest[
	ImportMarkdown["``` foo\\+bar\nfoo\n```\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> " foo\\+bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>]},
	"TestID"->"Backslash escapes-24"
	]

VerificationTest[
	ImportMarkdown["[foo](/bar\\* \"ti\\*tle\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo", "/bar\\* \"ti\\*tle\""}|>]}|>]},
	"TestID"->"Backslash escapes-22"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: /bar\\* \"ti\\*tle\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo]: /bar\\", MarkdownElement[<|"Element" -> "*", "Data" -> " \"ti\\"|>], "tle\""}|>]},
	"TestID"->"Backslash escapes-23"
	]

VerificationTest[
	ImportMarkdown["<http://example.com?find=\\*>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://example.com?find=\\*"|>]}|>]},
	"TestID"->"Backslash escapes-20"
	]

VerificationTest[
	ImportMarkdown["\\*not emphasized*\n\\<br/> not a tag\n\\[not a link](/foo)\n\\`not code`\n1\\. not a list\n\\* not a list\n\\# not a heading\n\\[foo]: /url \"not a reference\"\n\\&ouml; not a character entity\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "*", "Data" -> "not emphasized"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "br/"|>], " not a tag"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"not a link", "/foo"}|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "`", "Data" -> "not code"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "1\\. not a list"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " not a list"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\\# not a heading"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "foo]: /url \"not a reference\""}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\\&ouml; not a character entity"|>]},
	"TestID"->"Backslash escapes-14"
	]

VerificationTest[
	ImportMarkdown["\\!\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\\!\\\"\\#\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "$"|>], "\\%\\&\\'", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\("|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\)"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "\\+\\,\\-\\.\\/\\:\\;\\", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "\\=\\"|>], "\\?\\@", MarkdownElement[<|"Element" -> "LineLaTex", "Data" -> "\\\\"|>], "\\^\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "\\{\\|\\}\\~"}|>]},
	"TestID"->"Backslash escapes-12"
	]
EndTestSection[]