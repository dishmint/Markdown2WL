BeginTestSection["LinkReferenceDefinitions"]
(* ----------------------- Link reference definitions ----------------------- *)
(* ------ https://spec.commonmark.org/0.30/#link-reference-definitions ------ *)

VerificationTest[
	ImportMarkdown["Foo\n[bar]: /baz\n\n[bar]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]"|>]},
	"TestID"->"Link reference definitions-213"
	]

VerificationTest[
	ImportMarkdown["[foo]: <bar>(baz)\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo]: ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bar"|>], "(baz)"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-201"
	]

VerificationTest[
	ImportMarkdown["[Foo bar]:\n<my url>\n'title'\n\n[Foo bar]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo bar]:"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "my url"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "'title'"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo bar]"|>]},
	"TestID"->"Link reference definitions-195"
	]

VerificationTest[
	ImportMarkdown["[Foo*bar\\]]:my_(url) 'title (with parens)'\n\n[Foo*bar\\]]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[Foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>], "]:my", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "(url) 'title (with parens)'"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[Foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>], "]"}|>]},
	"TestID"->"Link reference definitions-194"
	]

VerificationTest[
	ImportMarkdown["[foo]: <>\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: <>"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-200"
	]

VerificationTest[
	ImportMarkdown["[foo]:\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]:"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-199"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: first\n[foo]: second\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: first"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: second"|>]},
	"TestID"->"Link reference definitions-204"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n> [foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Link reference definitions-218"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: url"|>]},
	"TestID"->"Link reference definitions-203"
	]

VerificationTest[
	ImportMarkdown["# [Foo]\n[foo]: /url\n> bar\n"],
	{MarkdownElement[<|"Element" -> "Heading", "Level" -> 1, "Data" -> "[Foo]"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "bar"|>]},
	"TestID"->"Link reference definitions-214"
	]

VerificationTest[
	ImportMarkdown["[foo]: /foo-url \"foo\"\n[bar]: /bar-url\n  \"bar\"\n[baz]: /baz-url\n\n[foo],\n[bar],\n[baz]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /foo-url \"foo\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /bar-url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  \"bar\""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /baz-url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo],"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar],"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]"|>]},
	"TestID"->"Link reference definitions-217"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Link reference definitions-207"
	]

VerificationTest[
	ImportMarkdown["[\nfoo\n]: /url\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Link reference definitions-208"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\\bar\\*baz \"foo\\\"bar\\baz\"\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo]: /url\\bar\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "baz \"foo\\\"bar\\baz\""}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-202"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\nbar\n===\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-215"
	]

VerificationTest[
	ImportMarkdown["```\n[foo]: /url\n```\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "CodeFence", "Data" -> ""|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-212"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\n===\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-216"
	]

VerificationTest[
	ImportMarkdown["[foo]:\n/url\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]:"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "/url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-198"
	]

VerificationTest[
	ImportMarkdown["[FOO]: /url\n\n[Foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[FOO]: /url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo]"|>]},
	"TestID"->"Link reference definitions-205"
	]

VerificationTest[
	ImportMarkdown["   [foo]: \n      /url  \n           'the title'  \n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   [foo]: "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  /url  "|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       'the title'  "|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-193"
	]

VerificationTest[
	ImportMarkdown["    [foo]: /url \"title\"\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "[foo]: /url \"title\""|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-211"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url \"title\"\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-192"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url '\ntitle\nline1\nline2\n'\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url '"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "title"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "line1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "line2"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "'"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-196"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url\n\"title\" ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "\"title\" ok"|>]},
	"TestID"->"Link reference definitions-210"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url \"title\" ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\" ok"|>]},
	"TestID"->"Link reference definitions-209"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url 'title\n\nwith blank line'\n\n[foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url 'title"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with blank line'"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>]},
	"TestID"->"Link reference definitions-197"
	]

VerificationTest[
	ImportMarkdown["[A\[CapitalGamma]\[CapitalOmega]]: /\[CurlyPhi]\[Omicron]\[Upsilon]\n\n[\[Alpha]\[Gamma]\[Omega]]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[A\[CapitalGamma]\[CapitalOmega]]: /\[CurlyPhi]\[Omicron]\[Upsilon]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[\[Alpha]\[Gamma]\[Omega]]"|>]},
	"TestID"->"Link reference definitions-206"
	]

EndTestSection[]