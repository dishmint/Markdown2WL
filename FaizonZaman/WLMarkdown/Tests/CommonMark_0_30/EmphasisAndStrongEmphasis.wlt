BeginTestSection["EmphasisAndStrongEmphasis"]
(* ---------------------- Emphasis and Strong Emphasis ---------------------- *)
(* ----- https://spec.commonmark.org/0.30/#emphasis-and-strong-emphasis ----- *)

TestCreate[
	ImportMarkdown["_\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c_\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c"|>], "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"}|>]},
	"TestID"->"Emphasis and strong emphasis-374"
	]

TestCreate[
	ImportMarkdown["\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c_\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c", MarkdownElement[<|"Element" -> "_", "Data" -> "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-361"
	]

TestCreate[
	ImportMarkdown["__\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c__\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c"|>], "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"}|>]},
	"TestID"->"Emphasis and strong emphasis-400"
	]

TestCreate[
	ImportMarkdown["\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c__\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"\:043f\:0440\:0438\:0441\:0442\:0430\:043d\:044f\:043c", MarkdownElement[<|"Element" -> "__", "Data" -> "\:0441\:0442\:0440\:0435\:043c\:044f\:0442\:0441\:044f"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-387"
	]

TestCreate[
	ImportMarkdown["5__6__78\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"5", MarkdownElement[<|"Element" -> "__", "Data" -> "6"|>], "78"}|>]},
	"TestID"->"Emphasis and strong emphasis-386"
	]

TestCreate[
	ImportMarkdown["5*6*78\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"5", MarkdownElement[<|"Element" -> "*", "Data" -> "6"|>], "78"}|>]},
	"TestID"->"Emphasis and strong emphasis-355"
	]

TestCreate[
	ImportMarkdown["5_6_78\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"5", MarkdownElement[<|"Element" -> "_", "Data" -> "6"|>], "78"}|>]},
	"TestID"->"Emphasis and strong emphasis-360"
	]

TestCreate[
	ImportMarkdown["* a *\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {"a ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-353"
	]

TestCreate[
	ImportMarkdown["*a `*`*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "a ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-477"
	]

TestCreate[
	ImportMarkdown["_a `_`_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "a ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "`"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-478"
	]

TestCreate[
	ImportMarkdown["aa_\"bb\"_cc\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"aa", MarkdownElement[<|"Element" -> "_", "Data" -> "\"bb\""|>], "cc"}|>]},
	"TestID"->"Emphasis and strong emphasis-362"
	]

TestCreate[
	ImportMarkdown["a**\"foo\"**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "**", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-379"
	]

TestCreate[
	ImportMarkdown["a__\"foo\"__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "__", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-384"
	]

TestCreate[
	ImportMarkdown["a*\"foo\"*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "*", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-352"
	]

TestCreate[
	ImportMarkdown["a_\"foo\"_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a", MarkdownElement[<|"Element" -> "_", "Data" -> "\"foo\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-358"
	]

TestCreate[
	ImportMarkdown["a * foo bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"a ", MarkdownElement[<|"Element" -> "*", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-351"
	]

TestCreate[
	ImportMarkdown["**<a href=\"**\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"**\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-475"
	]

TestCreate[
	ImportMarkdown["__<a href=\"__\">\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "a href=\"__\""|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-476"
	]

TestCreate[
	ImportMarkdown["**a<http://foo.bar/?q=**>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "a", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar/?q=**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-479"
	]

TestCreate[
	ImportMarkdown["__a<http://foo.bar/?q=__>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "a", MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "http://foo.bar/?q=__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-480"
	]

TestCreate[
	ImportMarkdown["__(bar)__.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "(bar)"|>], "."}|>]},
	"TestID"->"Emphasis and strong emphasis-402"
	]

TestCreate[
	ImportMarkdown["_(bar)_.\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "(bar)"|>], "."}|>]},
	"TestID"->"Emphasis and strong emphasis-376"
	]

TestCreate[
	ImportMarkdown["*[bar*](/url)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar*", "/url"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-472"
	]

TestCreate[
	ImportMarkdown["******foo******\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "******", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-465"
	]

TestCreate[
	ImportMarkdown["**(**foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-391"
	]

TestCreate[
	ImportMarkdown["__(__foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-397"
	]

TestCreate[
	ImportMarkdown["_____foo_____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_____", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-467"
	]

TestCreate[
	ImportMarkdown["****foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-444"
	]

TestCreate[
	ImportMarkdown["____foo_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-456"
	]

TestCreate[
	ImportMarkdown["****foo****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "****", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-463"
	]

TestCreate[
	ImportMarkdown["*(**foo**)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"(", MarkdownElement[<|"Element" -> "**", "Data" -> "foo"|>], ")"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-392"
	]

TestCreate[
	ImportMarkdown["_(__foo__)_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> {"(", MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>], ")"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-398"
	]

TestCreate[
	ImportMarkdown["____foo____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "____", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-464"
	]

TestCreate[
	ImportMarkdown["*(*foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-367"
	]

TestCreate[
	ImportMarkdown["_(_foo)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "("|>], "foo)"}|>]},
	"TestID"->"Emphasis and strong emphasis-371"
	]

TestCreate[
	ImportMarkdown["***foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-443"
	]

TestCreate[
	ImportMarkdown["___foo__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-455"
	]

TestCreate[
	ImportMarkdown["***foo***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "***", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-466"
	]

TestCreate[
	ImportMarkdown["*(*foo*)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "("|>], "foo", MarkdownElement[<|"Element" -> "*", "Data" -> ")"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-368"
	]

TestCreate[
	ImportMarkdown["_(_foo_)_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "("|>], "foo", MarkdownElement[<|"Element" -> "_", "Data" -> ")"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-372"
	]

TestCreate[
	ImportMarkdown["**foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-441"
	]

TestCreate[
	ImportMarkdown["__foo_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-453"
	]

TestCreate[
	ImportMarkdown["**foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-459"
	]

TestCreate[
	ImportMarkdown["*_foo_*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo"|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-460"
	]

TestCreate[
	ImportMarkdown["_*foo*_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-462"
	]

TestCreate[
	ImportMarkdown["__foo__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-461"
	]

TestCreate[
	ImportMarkdown["**foo***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-445"
	]

TestCreate[
	ImportMarkdown["__foo___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-457"
	]

TestCreate[
	ImportMarkdown["_foo*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-364"
	]

TestCreate[
	ImportMarkdown["*foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-442"
	]

TestCreate[
	ImportMarkdown["_foo__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-454"
	]

TestCreate[
	ImportMarkdown["*foo****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-446"
	]

TestCreate[
	ImportMarkdown["_foo____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-458"
	]

TestCreate[
	ImportMarkdown["foo ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-435"
	]

TestCreate[
	ImportMarkdown["foo *_*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-437"
	]

TestCreate[
	ImportMarkdown["foo _*_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-449"
	]

TestCreate[
	ImportMarkdown["foo ___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-447"
	]

TestCreate[
	ImportMarkdown["foo *\\**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-436"
	]

TestCreate[
	ImportMarkdown["foo _\\__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-448"
	]

TestCreate[
	ImportMarkdown["foo *****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*****"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-438"
	]

TestCreate[
	ImportMarkdown["foo **_**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-440"
	]

TestCreate[
	ImportMarkdown["foo __*__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-452"
	]

TestCreate[
	ImportMarkdown["foo _____\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_____"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-450"
	]

TestCreate[
	ImportMarkdown["foo **\\***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-439"
	]

TestCreate[
	ImportMarkdown["foo __\\___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "\\", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-451"
	]

TestCreate[
	ImportMarkdown["____foo__ bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-425"
	]

TestCreate[
	ImportMarkdown["***foo** bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-412"
	]

TestCreate[
	ImportMarkdown["***foo* bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-429"
	]

TestCreate[
	ImportMarkdown["** foo bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-378"
	]

TestCreate[
	ImportMarkdown["__\nfoo bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-383"
	]

TestCreate[
	ImportMarkdown["__ foo bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-382"
	]

TestCreate[
	ImportMarkdown["**foo **bar****\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-426"
	]

TestCreate[
	ImportMarkdown["**foo**bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-395"
	]

TestCreate[
	ImportMarkdown["__foo__bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-399"
	]

TestCreate[
	ImportMarkdown["__foo_ bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], " bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-407"
	]

TestCreate[
	ImportMarkdown["**foo *bar***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-430"
	]

TestCreate[
	ImportMarkdown["_ foo bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> " foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-357"
	]

TestCreate[
	ImportMarkdown["**foo\nbar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-422"
	]

TestCreate[
	ImportMarkdown["**foo bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-377"
	]

TestCreate[
	ImportMarkdown["__foo bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-381"
	]

TestCreate[
	ImportMarkdown["**foo bar **\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-390"
	]

TestCreate[
	ImportMarkdown["__foo bar __\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-396"
	]

TestCreate[
	ImportMarkdown["*foo **bar***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-413"
	]

TestCreate[
	ImportMarkdown["*foo**bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-411"
	]

TestCreate[
	ImportMarkdown["*foo *bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-408"
	]

TestCreate[
	ImportMarkdown["*foo**bar***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-414"
	]

TestCreate[
	ImportMarkdown["*foo*bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-369"
	]

TestCreate[
	ImportMarkdown["_foo_bar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo"|>], "bar"}|>]},
	"TestID"->"Emphasis and strong emphasis-373"
	]

TestCreate[
	ImportMarkdown["*foo\nbar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-404"
	]

TestCreate[
	ImportMarkdown["*foo bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-350"
	]

TestCreate[
	ImportMarkdown["_foo bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-356"
	]

TestCreate[
	ImportMarkdown["*foo bar\n*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo bar"}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-366"
	]

TestCreate[
	ImportMarkdown["*foo bar *\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-365"
	]

TestCreate[
	ImportMarkdown["_foo bar _\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo bar "|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-370"
	]

TestCreate[
	ImportMarkdown["foo-__(bar)__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo-", MarkdownElement[<|"Element" -> "__", "Data" -> "(bar)"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-389"
	]

TestCreate[
	ImportMarkdown["foo-_(bar)_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo-", MarkdownElement[<|"Element" -> "_", "Data" -> "(bar)"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-363"
	]

TestCreate[
	ImportMarkdown["foo**bar**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "**", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-380"
	]

TestCreate[
	ImportMarkdown["foo__bar__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "__", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-385"
	]

TestCreate[
	ImportMarkdown["foo*bar*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-354"
	]

TestCreate[
	ImportMarkdown["foo_bar_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "_", "Data" -> "bar"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-359"
	]

TestCreate[
	ImportMarkdown["__foo, __bar__, baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo, "|>], "bar", MarkdownElement[<|"Element" -> "__", "Data" -> ", baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-388"
	]

TestCreate[
	ImportMarkdown["__foo __bar__ baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo "|>], "bar", MarkdownElement[<|"Element" -> "__", "Data" -> " baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-424"
	]

TestCreate[
	ImportMarkdown["**foo **bar baz**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-470"
	]

TestCreate[
	ImportMarkdown["**foo *bar* baz**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-427"
	]

TestCreate[
	ImportMarkdown["__foo__bar__baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> "foo"|>], "bar", MarkdownElement[<|"Element" -> "__", "Data" -> "baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-401"
	]

TestCreate[
	ImportMarkdown["__foo _bar_ baz__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "__", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "_", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-423"
	]

TestCreate[
	ImportMarkdown["**foo*bar*baz**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-428"
	]

TestCreate[
	ImportMarkdown["*foo **bar** baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "**", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-409"
	]

TestCreate[
	ImportMarkdown["_foo __bar__ baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "__", "Data" -> "bar"|>], " baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-405"
	]

TestCreate[
	ImportMarkdown["*foo**bar**baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo", MarkdownElement[<|"Element" -> "**", "Data" -> "bar"|>], "baz"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-410"
	]

TestCreate[
	ImportMarkdown["*foo _bar* baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "bar"}|>], " baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-468"
	]

TestCreate[
	ImportMarkdown["_foo _bar_ baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo "|>], "bar", MarkdownElement[<|"Element" -> "_", "Data" -> " baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-406"
	]

TestCreate[
	ImportMarkdown["*foo *bar baz*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-471"
	]

TestCreate[
	ImportMarkdown["_foo_bar_baz_\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "foo"|>], "bar", MarkdownElement[<|"Element" -> "_", "Data" -> "baz"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-375"
	]

TestCreate[
	ImportMarkdown["foo******bar*********baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "******"|>], "bar", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*********"|>], "baz"}|>]},
	"TestID"->"Emphasis and strong emphasis-416"
	]

TestCreate[
	ImportMarkdown["foo***bar***baz\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"foo", MarkdownElement[<|"Element" -> "***", "Data" -> "bar"|>], "baz"}|>]},
	"TestID"->"Emphasis and strong emphasis-415"
	]

TestCreate[
	ImportMarkdown["*foo __bar *baz bim__ bam*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], "bar ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "baz bim", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], " bam", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-469"
	]

TestCreate[
	ImportMarkdown["**foo *bar **baz**\nbim* bop**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "bar "}|>], "baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"bim", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " bop", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-431"
	]

TestCreate[
	ImportMarkdown["*foo **bar *baz* bim** bop*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "bar "}|>], "baz", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " bim", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " bop", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-417"
	]

TestCreate[
	ImportMarkdown["**foo \"*bar*\" foo**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo \"", MarkdownElement[<|"Element" -> "*", "Data" -> "bar"|>], "\" foo"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-394"
	]

TestCreate[
	ImportMarkdown["**foo [*bar*](/url)**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"*bar*", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-432"
	]

TestCreate[
	ImportMarkdown["**foo [bar](/url)**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-421"
	]

TestCreate[
	ImportMarkdown["*foo [*bar*](/url)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"*bar*", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-418"
	]

TestCreate[
	ImportMarkdown["_foo [bar_](/url)\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_"|>], "foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar_", "/url"}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-473"
	]

TestCreate[
	ImportMarkdown["*foo [bar](/url)*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> {"foo ", MarkdownElement[<|"Element" -> "HyperLink", "Data" -> {"bar", "/url"}|>]}|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-403"
	]

TestCreate[
	ImportMarkdown["**Gomphocarpus (*Gomphocarpus physocarpus*, syn.\n*Asclepias physocarpa*)**\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "Gomphocarpus (", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "Gomphocarpus physocarpus", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], ", syn."}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], "Asclepias physocarpa", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], ")", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-393"
	]

TestCreate[
	ImportMarkdown["*<img src=\"foo\" title=\"*\"/>\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], MarkdownElement[<|"Element" -> "Hyperlink", "Data" -> "img src=\"foo\" title=\"*\"/"|>]}|>]},
	"TestID"->"Emphasis and strong emphasis-474"
	]

TestCreate[
	ImportMarkdown["** is not an empty emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " is not an empty emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-419"
	]

TestCreate[
	ImportMarkdown["__ is not an empty emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>], " is not an empty emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-433"
	]

TestCreate[
	ImportMarkdown["**** is not an empty strong emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "****"|>], " is not an empty strong emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-420"
	]

TestCreate[
	ImportMarkdown["____ is not an empty strong emphasis\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "____"|>], " is not an empty strong emphasis"}|>]},
	"TestID"->"Emphasis and strong emphasis-434"
	]
EndTestSection[]