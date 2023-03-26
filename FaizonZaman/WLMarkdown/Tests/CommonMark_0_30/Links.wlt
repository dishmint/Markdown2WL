BeginTestSection["Links"]
(* ---------------------------------- Links --------------------------------- *)
(* ----------------- https://spec.commonmark.org/0.30/#links ---------------- *)

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

EndTestSection[]