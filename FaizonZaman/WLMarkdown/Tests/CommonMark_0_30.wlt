BeginTestSection["CommonMark_0_30"]

(* -------------------------------------------------------------------------- *)
(*     CommonMark v0.30 Tests "https://spec.commonmark.org/0.30/spec.json"    *)
(* -------------------------------------------------------------------------- *)


(* ----------------------- Link reference definitions ----------------------- *)
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


(* ---------------------------------- Links --------------------------------- *)
VerificationTest[
	ImportMarkdown["[]()\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[]()"|>]},
	"TestID"->"Links-486"
	]

VerificationTest[
	ImportMarkdown["[a](<b)c>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b"}|>], "c>)"}|>]},
	"TestID"->"Links-491"
	]

VerificationTest[
	ImportMarkdown["[a](<b)c\n[a](<b)c>\n[a](<b>c)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b"}|>], "c"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b"}|>], "c>"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"a", "<b>c"}|>]}|>]},
	"TestID"->"Links-493"
	]

VerificationTest[
	ImportMarkdown["[[bar [foo]\n\n[foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[[bar [foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Links-559"
	]

VerificationTest[
	ImportMarkdown["[bar][foo\\!]\n\n[foo!]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"bar", "foo\\!"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo!]: /url"|>]},
	"TestID"->"Links-544"
	]

VerificationTest[
	ImportMarkdown["[bar\\\\]: /uri\n\n[bar\\\\]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[bar\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>], ": /uri"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[bar\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\]"|>]}|>]},
	"TestID"->"Links-549"
	]

VerificationTest[
	ImportMarkdown["[foo <bar attr=\"](baz)\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo <bar attr=\"", "baz"}|>], "\">"}|>]},
	"TestID"->"Links-523"
	]

VerificationTest[
	ImportMarkdown["[foo <bar attr=\"][ref]\">\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo <bar attr=\"", "ref"}|>], "\">"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-535"
	]

VerificationTest[
	ImportMarkdown["[foo]\n[bar]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-542"
	]

VerificationTest[
	ImportMarkdown["[foo] [bar]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo] [bar]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-541"
	]

VerificationTest[
	ImportMarkdown["[foo][bar]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-526"
	]

VerificationTest[
	ImportMarkdown["[foo][BaR]\n\n[bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "BaR"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url \"title\""|>]},
	"TestID"->"Links-538"
	]

VerificationTest[
	ImportMarkdown["*foo [bar* baz]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo [bar"|>], " baz]"}|>]},
	"TestID"->"Links-522"
	]

VerificationTest[
	ImportMarkdown["[foo *bar](baz*)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo *bar", "baz*"}|>]}|>]},
	"TestID"->"Links-521"
	]

VerificationTest[
	ImportMarkdown["[foo][bar][baz]\n\n[baz]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>], "[baz]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /url"|>]},
	"TestID"->"Links-568"
	]

VerificationTest[
	ImportMarkdown["[foo][bar][baz]\n\n[baz]: /url1\n[bar]: /url2\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>], "[baz]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /url1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url2"|>]},
	"TestID"->"Links-569"
	]

VerificationTest[
	ImportMarkdown["[foo][bar][baz]\n\n[baz]: /url1\n[foo]: /url2\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>], "[baz]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[baz]: /url1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url2"|>]},
	"TestID"->"Links-570"
	]

VerificationTest[
	ImportMarkdown["[foo *bar [baz][ref]*][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo *bar [baz", "ref"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "][ref]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-532"
	]

VerificationTest[
	ImportMarkdown["[foo *[bar [baz](/uri)](/uri)*](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo *[bar [baz", "/uri"}|>], "](/uri)", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "](/uri)"}|>]},
	"TestID"->"Links-518"
	]

VerificationTest[
	ImportMarkdown["[[*foo* bar]]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Links-558"
	]

VerificationTest[
	ImportMarkdown["[*foo* bar][]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar][]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Links-553"
	]

VerificationTest[
	ImportMarkdown["[*foo* bar]\n\n[*foo* bar]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[", MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], " bar]: /url \"title\""}|>]},
	"TestID"->"Links-557"
	]

VerificationTest[
	ImportMarkdown["[foo] bar\n\n[foo]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo] bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url"|>]},
	"TestID"->"Links-561"
	]

VerificationTest[
	ImportMarkdown["[foo][bar]\n\n[foo]: /url1\n[bar]: /url2\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "bar"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[bar]: /url2"|>]},
	"TestID"->"Links-564"
	]

VerificationTest[
	ImportMarkdown["[foo *bar][ref]*\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo *bar", "ref"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-534"
	]

VerificationTest[
	ImportMarkdown["[foo [bar](/uri)][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo [bar", "/uri"}|>], "][ref]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-531"
	]

VerificationTest[
	ImportMarkdown["[foo [bar](/uri)](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo [bar", "/uri"}|>], "](/uri)"}|>]},
	"TestID"->"Links-517"
	]

VerificationTest[
	ImportMarkdown["[Foo\n  bar]: /url\n\n[Baz][Foo bar]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar]: /url"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"Baz", "Foo bar"}|>]}|>]},
	"TestID"->"Links-540"
	]

VerificationTest[
	ImportMarkdown["[[[foo]]]\n\n[[[foo]]]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[[[foo]]]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[[[foo]]]: /url"|>]},
	"TestID"->"Links-547"
	]

VerificationTest[
	ImportMarkdown["[foo]()\n\n[foo]: /url1\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]()"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>]},
	"TestID"->"Links-566"
	]

VerificationTest[
	ImportMarkdown["[foo][]\n\n[foo]: /url1\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>]},
	"TestID"->"Links-565"
	]

VerificationTest[
	ImportMarkdown["\\[foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "foo]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-562"
	]

VerificationTest[
	ImportMarkdown["[foo] \n[]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo] "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-555"
	]

VerificationTest[
	ImportMarkdown["[foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-552"
	]

VerificationTest[
	ImportMarkdown["[Foo][]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo][]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-554"
	]

VerificationTest[
	ImportMarkdown["[foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-556"
	]

VerificationTest[
	ImportMarkdown["[Foo]\n\n[foo]: /url \"title\"\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[Foo]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url \"title\""|>]},
	"TestID"->"Links-560"
	]

VerificationTest[
	ImportMarkdown["[foo<http://example.com/?search=][ref]>\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo<http://example.com/?search=", "ref"}|>], ">"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-537"
	]

VerificationTest[
	ImportMarkdown["[foo<http://example.com/?search=](uri)>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo<http://example.com/?search=", "uri"}|>], ">"}|>]},
	"TestID"->"Links-525"
	]

VerificationTest[
	ImportMarkdown["[foo](not a link)\n\n[foo]: /url1\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo", "not a link"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>]},
	"TestID"->"Links-567"
	]

VerificationTest[
	ImportMarkdown["[foo][ref[bar]]\n\n[ref[bar]]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "ref[bar"}|>], "]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref[bar]]: /uri"|>]},
	"TestID"->"Links-546"
	]

VerificationTest[
	ImportMarkdown["*[foo*][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo*", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-533"
	]

VerificationTest[
	ImportMarkdown["[foo`][ref]`\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo`", "ref"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-536"
	]

VerificationTest[
	ImportMarkdown["[foo][ref\\[]\n\n[ref\\[]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "ref\\["}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"[ref", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "\\["|>], "]: /uri"}|>]},
	"TestID"->"Links-548"
	]

VerificationTest[
	ImportMarkdown["[foo][ref[]\n\n[ref[]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"foo", "ref["}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref[]: /uri"|>]},
	"TestID"->"Links-545"
	]

VerificationTest[
	ImportMarkdown["*[foo*](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo*", "/uri"}|>]}|>]},
	"TestID"->"Links-520"
	]

VerificationTest[
	ImportMarkdown["[foo`](/uri)`\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"foo`", "/uri"}|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Links-524"
	]

VerificationTest[
	ImportMarkdown["![[[foo](uri1)](uri2)](uri3)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Image", "Data" -> {"[[foo", "uri1"}|>], "](uri2)](uri3)"}|>]},
	"TestID"->"Links-519"
	]

VerificationTest[
	ImportMarkdown["[foo]: /url1\n\n[foo]: /url2\n\n[bar][foo]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url1"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[foo]: /url2"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"bar", "foo"}|>]}|>]},
	"TestID"->"Links-543"
	]

VerificationTest[
	ImportMarkdown["[foo*]: /url\n\n*[foo*]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"[foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "]: /url"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "[foo"|>], "]"}|>]},
	"TestID"->"Links-563"
	]

VerificationTest[
	ImportMarkdown["[link]()\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link]()"|>]},
	"TestID"->"Links-484"
	]

VerificationTest[
	ImportMarkdown["[link](<>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "<>"}|>]}|>]},
	"TestID"->"Links-485"
	]

VerificationTest[
	ImportMarkdown["[link \\[bar][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"link \\[bar", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-528"
	]

VerificationTest[
	ImportMarkdown["[link \\[bar](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link \\[bar", "/uri"}|>]}|>]},
	"TestID"->"Links-514"
	]

VerificationTest[
	ImportMarkdown["[link] bar](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link] bar", "/uri"}|>]}|>]},
	"TestID"->"Links-512"
	]

VerificationTest[
	ImportMarkdown["[link [bar](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link [bar", "/uri"}|>]}|>]},
	"TestID"->"Links-513"
	]

VerificationTest[
	ImportMarkdown["[link](\\(foo\\))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "\\(foo\\"}|>], ")"}|>]},
	"TestID"->"Links-494"
	]

VerificationTest[
	ImportMarkdown["[link](<foo\\>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "<foo\\>"}|>]}|>]},
	"TestID"->"Links-492"
	]

VerificationTest[
	ImportMarkdown["[link](foo\\)\\:)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo\\"}|>], "\\:)"}|>]},
	"TestID"->"Links-499"
	]

VerificationTest[
	ImportMarkdown["[link](foo%20b&auml;)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo%20b&auml;"}|>]}|>]},
	"TestID"->"Links-502"
	]

VerificationTest[
	ImportMarkdown["[link](<foo(and(bar)>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "<foo(and(bar"}|>], ">)"}|>]},
	"TestID"->"Links-498"
	]

VerificationTest[
	ImportMarkdown["[link](foo\\(and\\(bar\\))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo\\(and\\(bar\\"}|>], ")"}|>]},
	"TestID"->"Links-497"
	]

VerificationTest[
	ImportMarkdown["[link](foo(and(bar))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo(and(bar"}|>], ")"}|>]},
	"TestID"->"Links-496"
	]

VerificationTest[
	ImportMarkdown["[link](foo(and(bar)))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo(and(bar"}|>], "))"}|>]},
	"TestID"->"Links-495"
	]

VerificationTest[
	ImportMarkdown["[link](<foo\nbar>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link](<foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar>)"|>]},
	"TestID"->"Links-490"
	]

VerificationTest[
	ImportMarkdown["[link](foo\\bar)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "foo\\bar"}|>]}|>]},
	"TestID"->"Links-501"
	]

VerificationTest[
	ImportMarkdown["[link](foo\nbar)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link](foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar)"|>]},
	"TestID"->"Links-489"
	]

VerificationTest[
	ImportMarkdown["[link *foo **bar** `#`*][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"link *foo **bar** `#`*", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-529"
	]

VerificationTest[
	ImportMarkdown["[link [foo [bar]]][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "FootnoteReference", "Data" -> {"link [foo [bar]]", "ref"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-527"
	]

VerificationTest[
	ImportMarkdown["[link *foo **bar** `#`*](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link *foo **bar** `#`*", "/uri"}|>]}|>]},
	"TestID"->"Links-515"
	]

VerificationTest[
	ImportMarkdown["[link [foo [bar]]](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link [foo [bar]]", "/uri"}|>]}|>]},
	"TestID"->"Links-511"
	]

VerificationTest[
	ImportMarkdown["[link](#fragment)\n\n[link](http://example.com#fragment)\n\n[link](http://example.com?foo=3#frag)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "#fragment"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "http://example.com#fragment"}|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "http://example.com?foo=3#frag"}|>]}|>]},
	"TestID"->"Links-500"
	]

VerificationTest[
	ImportMarkdown["[link](</my uri>)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "</my uri>"}|>]}|>]},
	"TestID"->"Links-488"
	]

VerificationTest[
	ImportMarkdown["[link](/my uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/my uri"}|>]}|>]},
	"TestID"->"Links-487"
	]

VerificationTest[
	ImportMarkdown["[link](\"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "\"title\""}|>]}|>]},
	"TestID"->"Links-503"
	]

VerificationTest[
	ImportMarkdown["[link] (/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link] (/uri)"|>]},
	"TestID"->"Links-510"
	]

VerificationTest[
	ImportMarkdown["[link](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/uri"}|>]}|>]},
	"TestID"->"Links-482"
	]

VerificationTest[
	ImportMarkdown["[link](   /uri\n  \"title\"  )\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[link](   /uri"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  \"title\"  )"|>]},
	"TestID"->"Links-509"
	]

VerificationTest[
	ImportMarkdown["[link](/uri \"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/uri \"title\""}|>]}|>]},
	"TestID"->"Links-481"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title\""}|>]}|>]},
	"TestID"->"Links-506"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title \"and\" title\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title \"and\" title\""}|>]}|>]},
	"TestID"->"Links-507"
	]

VerificationTest[
	ImportMarkdown["[link](/url 'title \"and\" title')\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url 'title \"and\" title'"}|>]}|>]},
	"TestID"->"Links-508"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title\")\n[link](/url 'title')\n[link](/url (title))\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title\""}|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url 'title'"}|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url (title"}|>], ")"}|>]},
	"TestID"->"Links-504"
	]

VerificationTest[
	ImportMarkdown["[link](/url \"title \\\"&quot;\")\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"link", "/url \"title \\\"&quot;\""}|>]}|>]},
	"TestID"->"Links-505"
	]

VerificationTest[
	ImportMarkdown["[![moon](moon.jpg)][ref]\n\n[ref]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"![moon", "moon.jpg"}|>], "][ref]"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[ref]: /uri"|>]},
	"TestID"->"Links-530"
	]

VerificationTest[
	ImportMarkdown["[![moon](moon.jpg)](/uri)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"![moon", "moon.jpg"}|>], "](/uri)"}|>]},
	"TestID"->"Links-516"
	]

VerificationTest[
	ImportMarkdown["[\:1e9e]\n\n[SS]: /url\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[\:1e9e]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[SS]: /url"|>]},
	"TestID"->"Links-539"
	]

VerificationTest[
	ImportMarkdown["[](./target.md)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[](./target.md)"|>]},
	"TestID"->"Links-483"
	]

VerificationTest[
	ImportMarkdown["[\n ]\n\n[\n ]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " ]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "["|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " ]: /uri"|>]},
	"TestID"->"Links-551"
	]

VerificationTest[
	ImportMarkdown["[]\n\n[]: /uri\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "[]"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "[]: /uri"|>]},
	"TestID"->"Links-550"
	]


(* ------------------------------- List Items ------------------------------- *)
VerificationTest[
	ImportMarkdown["*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"List items-284"
	]

VerificationTest[
	ImportMarkdown["003. ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "003. ok"|>]},
	"TestID"->"List items-268"
	]

VerificationTest[
	ImportMarkdown["0. ok\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "ok"|>]},
	"TestID"->"List items-267"
	]

VerificationTest[
	ImportMarkdown["  10.  foo\n\n           bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  10.  foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       bar"|>]},
	"TestID"->"List items-271"
	]

VerificationTest[
	ImportMarkdown["10) foo\n    - bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "10) foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "bar"|>]},
	"TestID"->"List items-296"
	]

VerificationTest[
	ImportMarkdown["10) foo\n   - bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "10) foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-297"
	]

VerificationTest[
	ImportMarkdown["1234567890. not ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "1234567890. not ok"|>]},
	"TestID"->"List items-266"
	]

VerificationTest[
	ImportMarkdown["123456789. ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "123456789. ok"|>]},
	"TestID"->"List items-265"
	]

VerificationTest[
	ImportMarkdown["1. - 2. foo\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "- 2. foo"|>]},
	"TestID"->"List items-299"
	]

VerificationTest[
	ImportMarkdown["  1.  A paragraph\n    with two lines.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "with two lines."|>]},
	"TestID"->"List items-291"
	]

VerificationTest[
	ImportMarkdown["    1.  A paragraph\n        with two lines.\n\n            indented code\n\n        > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 2, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "        indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    > A block quote."|>]},
	"TestID"->"List items-289"
	]

VerificationTest[
	ImportMarkdown["   1.  A paragraph\n       with two lines.\n\n           indented code\n\n       > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   1.  A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "       indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   > A block quote."|>]},
	"TestID"->"List items-288"
	]

VerificationTest[
	ImportMarkdown["  1.  A paragraph\n      with two lines.\n\n          indented code\n\n      > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "      indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  > A block quote."|>]},
	"TestID"->"List items-287"
	]

VerificationTest[
	ImportMarkdown["  1.  A paragraph\nwith two lines.\n\n          indented code\n\n      > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "      indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  > A block quote."|>]},
	"TestID"->"List items-290"
	]

VerificationTest[
	ImportMarkdown[" 1.  A paragraph\n     with two lines.\n\n         indented code\n\n     > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> " 1.  A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "     indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " > A block quote."|>]},
	"TestID"->"List items-286"
	]

VerificationTest[
	ImportMarkdown["1.  A paragraph\n    with two lines.\n\n        indented code\n\n    > A block quote.\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " A paragraph"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "    indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> A block quote."|>]},
	"TestID"->"List items-254"
	]

VerificationTest[
	ImportMarkdown["> 1. > Blockquote\n> continued here.\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "1. > Blockquote"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "continued here."|>]},
	"TestID"->"List items-293"
	]

VerificationTest[
	ImportMarkdown["> 1. > Blockquote\ncontinued here.\n"],
	{MarkdownElement[<|"Element" -> "Quote", "Data" -> "1. > Blockquote"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "continued here."|>]},
	"TestID"->"List items-292"
	]

VerificationTest[
	ImportMarkdown["1. foo\n2.\n3. bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "2."|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-283"
	]

VerificationTest[
	ImportMarkdown["1.  foo\n\n    ```\n    bar\n    ```\n\n    baz\n\n    > bam\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "> bam"|>]},
	"TestID"->"List items-263"
	]

VerificationTest[
	ImportMarkdown["1.      indented code\n\n   paragraph\n\n       more code\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "     indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   more code"|>]},
	"TestID"->"List items-274"
	]

VerificationTest[
	ImportMarkdown["1.     indented code\n\n   paragraph\n\n       more code\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "    indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "   more code"|>]},
	"TestID"->"List items-273"
	]

VerificationTest[
	ImportMarkdown["-1. not ok\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-1. not ok"|>]},
	"TestID"->"List items-269"
	]

VerificationTest[
	ImportMarkdown["   > > 1.  one\n>>\n>>     two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   > > 1.  one"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>     two"|>]},
	"TestID"->"List items-259"
	]

VerificationTest[
	ImportMarkdown["A paragraph\nwith two lines.\n\n    indented code\n\n> A block quote.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "A paragraph"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "with two lines."|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Quote", "Data" -> "A block quote."|>]},
	"TestID"->"List items-253"
	]

VerificationTest[
	ImportMarkdown["-   \n  foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>]},
	"TestID"->"List items-279"
	]

VerificationTest[
	ImportMarkdown["-\n\n  foo\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>]},
	"TestID"->"List items-280"
	]

VerificationTest[
	ImportMarkdown["- - foo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- foo"|>]},
	"TestID"->"List items-298"
	]

VerificationTest[
	ImportMarkdown["-    foo\n\n  bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>]},
	"TestID"->"List items-276"
	]

VerificationTest[
	ImportMarkdown["-  foo\n\n   bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> " foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   bar"|>]},
	"TestID"->"List items-277"
	]

VerificationTest[
	ImportMarkdown["   foo\n\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"List items-275"
	]

VerificationTest[
	ImportMarkdown["- foo\n-   \n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  "|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-282"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n      bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bar"|>]},
	"TestID"->"List items-270"
	]

VerificationTest[
	ImportMarkdown["- foo\n-\n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"List items-281"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n\n  bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>]},
	"TestID"->"List items-262"
	]

VerificationTest[
	ImportMarkdown["-\n  foo\n-\n  ```\n  bar\n  ```\n-\n      baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "-"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  baz"|>]},
	"TestID"->"List items-278"
	]

VerificationTest[
	ImportMarkdown["- # Foo\n- Bar\n  ---\n  baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "# Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  ---"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz"|>]},
	"TestID"->"List items-300"
	]

VerificationTest[
	ImportMarkdown["- Foo\n\n      bar\n\n\n      baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  baz"|>]},
	"TestID"->"List items-264"
	]

VerificationTest[
	ImportMarkdown["- foo\n  - bar\n    - baz\n      - boo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 3, "Data" -> "boo"|>]},
	"TestID"->"List items-294"
	]

VerificationTest[
	ImportMarkdown["- foo\n - bar\n  - baz\n   - boo\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "boo"|>]},
	"TestID"->"List items-295"
	]

VerificationTest[
	ImportMarkdown["foo\n*\n\nfoo\n1.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "1."|>]},
	"TestID"->"List items-285"
	]

VerificationTest[
	ImportMarkdown["    indented code\n\nparagraph\n\n    more code\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "indented code"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "paragraph"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "more code"|>]},
	"TestID"->"List items-272"
	]

VerificationTest[
	ImportMarkdown["-one\n\n2.two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "-one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "2.two"|>]},
	"TestID"->"List items-261"
	]

VerificationTest[
	ImportMarkdown[" -    one\n\n      two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  two"|>]},
	"TestID"->"List items-258"
	]

VerificationTest[
	ImportMarkdown[" -    one\n\n     two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "   one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> " two"|>]},
	"TestID"->"List items-257"
	]

VerificationTest[
	ImportMarkdown[">>- one\n>>\n  >  > two\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> ">>- one"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> ">>"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  >  > two"|>]},
	"TestID"->"List items-260"
	]

VerificationTest[
	ImportMarkdown["- one\n\n  two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  two"|>]},
	"TestID"->"List items-256"
	]

VerificationTest[
	ImportMarkdown["- one\n\n two\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "one"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " two"|>]},
	"TestID"->"List items-255"
	]

VerificationTest[
	ImportMarkdown["1. a\n\n  2. b\n\n    3. c\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedList", "Data" -> {MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "b"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 2, "Data" -> "c"|>]},
	"TestID"->"Lists-313"
	]

VerificationTest[
	ImportMarkdown["1. a\n\n  2. b\n\n   3. c\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "OrderedList", "Data" -> {MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "b"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   3. c"|>]},
	"TestID"->"Lists-311"
	]

VerificationTest[
	ImportMarkdown["1. foo\n2. bar\n3) baz\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "3) baz"|>]},
	"TestID"->"Lists-302"
	]

VerificationTest[
	ImportMarkdown["1. ```\n   foo\n   ```\n\n   bar\n"],
	{MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "   bar"|>]},
	"TestID"->"Lists-324"
	]

VerificationTest[
	ImportMarkdown["- a\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>]},
	"TestID"->"Lists-322"
	]

VerificationTest[
	ImportMarkdown["- a\n  - b\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>]},
	"TestID"->"Lists-323"
	]

VerificationTest[
	ImportMarkdown["- a\n- ```\n  b\n\n\n  ```\n- c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-318"
	]

VerificationTest[
	ImportMarkdown["* a\n  > b\n  >\n* c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  > b"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  >"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-320"
	]

VerificationTest[
	ImportMarkdown["- a\n- b\n\n- c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-314"
	]

VerificationTest[
	ImportMarkdown["- a\n  > b\n  ```\n  c\n  ```\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  > b"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  c"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "```"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-321"
	]

VerificationTest[
	ImportMarkdown["- a\n  - b\n\n    c\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-319"
	]

VerificationTest[
	ImportMarkdown["- a\n- b\n\n  c\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-316"
	]

VerificationTest[
	ImportMarkdown["- a\n - b\n  - c\n   - d\n    - e\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "e"|>]},
	"TestID"->"Lists-312"
	]

VerificationTest[
	ImportMarkdown["- a\n  - b\n  - c\n\n- d\n  - e\n  - f\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "e"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "f"|>]},
	"TestID"->"Lists-326"
	]

VerificationTest[
	ImportMarkdown["- a\n - b\n  - c\n   - d\n  - e\n - f\n- g\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "c"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "e"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "f"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "g"|>]},
	"TestID"->"Lists-310"
	]

VerificationTest[
	ImportMarkdown["- a\n- b\n\n  [ref]: /url\n- d\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "b"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  [ref]: /url"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "d"|>]},
	"TestID"->"Lists-317"
	]

VerificationTest[
	ImportMarkdown["* a\n*\n\n* c\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "c"|>]},
	"TestID"->"Lists-315"
	]

VerificationTest[
	ImportMarkdown["* foo\n  * bar\n\n  baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "  baz"|>]},
	"TestID"->"Lists-325"
	]

VerificationTest[
	ImportMarkdown["- foo\n\n- bar\n\n\n- baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedList", "Data" -> {MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>]},
	"TestID"->"Lists-306"
	]

VerificationTest[
	ImportMarkdown["- foo\n- bar\n+ baz\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "+ baz"|>]},
	"TestID"->"Lists-301"
	]

VerificationTest[
	ImportMarkdown["Foo\n- bar\n- baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>]},
	"TestID"->"Lists-303"
	]

VerificationTest[
	ImportMarkdown["- foo\n  - bar\n    - baz\n\n\n      bim\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 1, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 2, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "  bim"|>]},
	"TestID"->"Lists-307"
	]

VerificationTest[
	ImportMarkdown["- foo\n- bar\n\n<!-- -->\n\n- baz\n- bim\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "baz"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bim"|>]},
	"TestID"->"Lists-308"
	]

VerificationTest[
	ImportMarkdown["-   foo\n\n    notcode\n\n-   foo\n\n<!-- -->\n\n    code\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  foo"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "notcode"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "UnorderedList", "Data" -> {MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "  foo"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- --"|>]}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "code"|>]},
	"TestID"->"Lists-309"
	]

VerificationTest[
	ImportMarkdown["The number of windows in my house is\n14.  The number of doors is 6.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "The number of windows in my house is"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "14.  The number of doors is 6."|>]},
	"TestID"->"Lists-304"
	]

VerificationTest[
	ImportMarkdown["The number of windows in my house is\n1.  The number of doors is 6.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "The number of windows in my house is"|>], MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> " The number of doors is 6."|>]},
	"TestID"->"Lists-305"
	]


(* ------------------------------- Paragraphs ------------------------------- *)
VerificationTest[
	ImportMarkdown["    aaa\nbbb\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-225"
	]

VerificationTest[
	ImportMarkdown["   aaa\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "   aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-224"
	]

VerificationTest[
	ImportMarkdown["  aaa\n bbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "  aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " bbb"|>]},
	"TestID"->"Paragraphs-222"
	]

VerificationTest[
	ImportMarkdown["aaa     \nbbb     \n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa     "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb     "|>]},
	"TestID"->"Paragraphs-226"
	]

VerificationTest[
	ImportMarkdown["aaa\n\n\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-221"
	]

VerificationTest[
	ImportMarkdown["aaa\n\nbbb\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>]},
	"TestID"->"Paragraphs-219"
	]

VerificationTest[
	ImportMarkdown["aaa\n             bbb\n                                       ccc\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "         bbb"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> "                                   ccc"|>]},
	"TestID"->"Paragraphs-223"
	]

VerificationTest[
	ImportMarkdown["aaa\nbbb\n\nccc\nddd\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "aaa"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bbb"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "ccc"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "ddd"|>]},
	"TestID"->"Paragraphs-220"
	]


(* ------------------------------- Precedence ------------------------------- *)
VerificationTest[
	ImportMarkdown["- `one\n- two`\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], "one"}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {"two", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>]}|>]},
	"TestID"->"Precedence-42"
	]


(* -------------------------------- Raw HTML -------------------------------- *)
VerificationTest[
	ImportMarkdown["<33> <__>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "33"|>], " ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "__"|>]}|>]},
	"TestID"->"Raw HTML-617"
	]

VerificationTest[
	ImportMarkdown["<a/><b2/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a/"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "b2/"|>]}|>]},
	"TestID"->"Raw HTML-613"
	]

VerificationTest[
	ImportMarkdown["<a  /><b2\ndata=\"foo\" >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a  /"|>], "<b2"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "data=\"foo\" >"|>]},
	"TestID"->"Raw HTML-614"
	]

VerificationTest[
	ImportMarkdown["<a><bab><c2c>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bab"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "c2c"|>]}|>]},
	"TestID"->"Raw HTML-612"
	]

VerificationTest[
	ImportMarkdown["</a></foo >\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/foo "|>]}|>]},
	"TestID"->"Raw HTML-622"
	]

VerificationTest[
	ImportMarkdown["<a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a foo=\"bar\" bam = 'baz <em"|>], "\"", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/em"|>], "'"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "boolean zoop:33=zoop:33 />"}|>]},
	"TestID"->"Raw HTML-615"
	]

VerificationTest[
	ImportMarkdown["< a><\nfoo><bar/ >\n<foo bar=baz\nbim!bop />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> " a"|>], "<"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo>", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "bar/ "|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "<foo bar=baz"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bim!bop />"|>]},
	"TestID"->"Raw HTML-620"
	]

VerificationTest[
	ImportMarkdown["<a href=\"\\\"\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"\\\"\""|>]}|>]},
	"TestID"->"Raw HTML-632"
	]

VerificationTest[
	ImportMarkdown["<a href='bar'title=title>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href='bar'title=title"|>]}|>]},
	"TestID"->"Raw HTML-621"
	]

VerificationTest[
	ImportMarkdown["</a href=\"foo\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "/a href=\"foo\""|>]}|>]},
	"TestID"->"Raw HTML-623"
	]

VerificationTest[
	ImportMarkdown["<a h*#ref=\"hi\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a h*#ref=\"hi\""|>]}|>]},
	"TestID"->"Raw HTML-618"
	]

VerificationTest[
	ImportMarkdown["<a href=\"hi'> <a href=hi'>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"hi'"|>], " ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=hi'"|>]}|>]},
	"TestID"->"Raw HTML-619"
	]

VerificationTest[
	ImportMarkdown["foo <a href=\"\\*\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"\\*\""|>]}|>]},
	"TestID"->"Raw HTML-631"
	]

VerificationTest[
	ImportMarkdown["foo <a href=\"&ouml;\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"&ouml;\""|>]}|>]},
	"TestID"->"Raw HTML-630"
	]

VerificationTest[
	ImportMarkdown["foo <![CDATA[>&<]]>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "![CDATA["|>], "&", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "]]"|>]}|>]},
	"TestID"->"Raw HTML-629"
	]

VerificationTest[
	ImportMarkdown["foo <!ELEMENT br EMPTY>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!ELEMENT br EMPTY"|>]}|>]},
	"TestID"->"Raw HTML-628"
	]

VerificationTest[
	ImportMarkdown["foo <!--> foo -->\n\nfoo <!-- foo--->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!--"|>], " foo -->"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- foo---"|>]}|>]},
	"TestID"->"Raw HTML-626"
	]

VerificationTest[
	ImportMarkdown["foo <!-- not a comment -- two hyphens -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "!-- not a comment -- two hyphens --"|>]}|>]},
	"TestID"->"Raw HTML-625"
	]

VerificationTest[
	ImportMarkdown["foo <?php echo $a; ?>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "?php echo $a; ?"|>]}|>]},
	"TestID"->"Raw HTML-627"
	]

VerificationTest[
	ImportMarkdown["Foo <responsive-image src=\"foo.jpg\" />\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"Foo ", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "responsive-image src=\"foo.jpg\" /"|>]}|>]},
	"TestID"->"Raw HTML-616"
	]

VerificationTest[
	ImportMarkdown["foo <!-- this is a\ncomment - with hyphen -->\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo <!-- this is a"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "comment - with hyphen -->"|>]},
	"TestID"->"Raw HTML-624"
	]


(* ----------------------------- Setext headings ---------------------------- *)
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


(* ---------------------------- Soft line breaks ---------------------------- *)
VerificationTest[
	ImportMarkdown["foo \n baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo "|>], MarkdownElement[<|"Element" -> "Line", "Data" -> " baz"|>]},
	"TestID"->"Soft line breaks-649"
	]

VerificationTest[
	ImportMarkdown["foo\nbaz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "baz"|>]},
	"TestID"->"Soft line breaks-648"
	]


(* ----------------------------- Textual Content ---------------------------- *)
VerificationTest[
	ImportMarkdown["Foo \[Chi]\[Rho]\:1fc6\[Nu]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo \[Chi]\[Rho]\:1fc6\[Nu]"|>]},
	"TestID"->"Textual content-651"
	]

VerificationTest[
	ImportMarkdown["hello $.;'there\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"hello ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "$"|>], ".;'there"}|>]},
	"TestID"->"Textual content-650"
	]

VerificationTest[
	ImportMarkdown["Multiple     spaces\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Multiple     spaces"|>]},
	"TestID"->"Textual content-652"
	]

(* ----------------------------- Thematic Breaks ---------------------------- *)
VerificationTest[
	ImportMarkdown["+++\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "+++"|>]},
	"TestID"->"Thematic breaks-44"
	]

VerificationTest[
	ImportMarkdown["===\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>]},
	"TestID"->"Thematic breaks-45"
	]

VerificationTest[
	ImportMarkdown[" *-*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "*", "Data" -> "-"|>]}|>]},
	"TestID"->"Thematic breaks-56"
	]

VerificationTest[
	ImportMarkdown[" - - -\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- -"|>]},
	"TestID"->"Thematic breaks-51"
	]

VerificationTest[
	ImportMarkdown["    ***\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-48"
	]

VerificationTest[
	ImportMarkdown["--\n**\n__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "--"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Thematic breaks-46"
	]

VerificationTest[
	ImportMarkdown["***\n---\n___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Thematic breaks-43"
	]

VerificationTest[
	ImportMarkdown["- - - -    \n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- - -    "|>]},
	"TestID"->"Thematic breaks-54"
	]

VerificationTest[
	ImportMarkdown[" ***\n  ***\n   ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-47"
	]

VerificationTest[
	ImportMarkdown[" **  * ** * ** * **\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Thematic breaks-52"
	]

VerificationTest[
	ImportMarkdown["-     -      -      -\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "    -      -      -"|>]},
	"TestID"->"Thematic breaks-53"
	]

VerificationTest[
	ImportMarkdown["_____________________________________\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_____________________________________"|>]}|>]},
	"TestID"->"Thematic breaks-50"
	]

VerificationTest[
	ImportMarkdown["_ _ _ _ a\n\na------\n\n---a---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> " "|>], " ", MarkdownElement[<|"Element" -> "_", "Data" -> " "|>], " a"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "a------"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "---a---"|>]},
	"TestID"->"Thematic breaks-55"
	]

VerificationTest[
	ImportMarkdown["- Foo\n- * * *\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Thematic breaks-61"
	]

VerificationTest[
	ImportMarkdown["Foo\n    ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-49"
	]

VerificationTest[
	ImportMarkdown["* Foo\n* * *\n* Bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Bar"|>]},
	"TestID"->"Thematic breaks-60"
	]

VerificationTest[
	ImportMarkdown["- foo\n***\n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-57"
	]

VerificationTest[
	ImportMarkdown["Foo\n***\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-58"
	]

VerificationTest[
	ImportMarkdown["Foo\n---\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-59"
	]

EndTestSection[]
