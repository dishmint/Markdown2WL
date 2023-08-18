BeginTestSection["ThematicBreaks"]
(* ----------------------------- Thematic Breaks ---------------------------- *)
(* ------------ https://spec.commonmark.org/0.30/#thematic-breaks ----------- *)

TestCreate[
	ImportMarkdown["+++\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "+++"|>]},
	"TestID"->"Thematic breaks-44"
	]

TestCreate[
	ImportMarkdown["===\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "==="|>]},
	"TestID"->"Thematic breaks-45"
	]

TestCreate[
	ImportMarkdown[" *-*\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "*", "Data" -> "-"|>]}|>]},
	"TestID"->"Thematic breaks-56"
	]

TestCreate[
	ImportMarkdown[" - - -\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- -"|>]},
	"TestID"->"Thematic breaks-51"
	]

TestCreate[
	ImportMarkdown["    ***\n"],
	{MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-48"
	]

TestCreate[
	ImportMarkdown["--\n**\n__\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "--"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "__"|>]}|>]},
	"TestID"->"Thematic breaks-46"
	]

TestCreate[
	ImportMarkdown["***\n---\n___\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "___"|>]}|>]},
	"TestID"->"Thematic breaks-43"
	]

TestCreate[
	ImportMarkdown["- - - -    \n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "- - -    "|>]},
	"TestID"->"Thematic breaks-54"
	]

TestCreate[
	ImportMarkdown[" ***\n  ***\n   ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {"   ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-47"
	]

TestCreate[
	ImportMarkdown[" **  * ** * ** * **\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {" ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], "  ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "**"|>]}|>]},
	"TestID"->"Thematic breaks-52"
	]

TestCreate[
	ImportMarkdown["-     -      -      -\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "    -      -      -"|>]},
	"TestID"->"Thematic breaks-53"
	]

TestCreate[
	ImportMarkdown["_____________________________________\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "_____________________________________"|>]}|>]},
	"TestID"->"Thematic breaks-50"
	]

TestCreate[
	ImportMarkdown["_ _ _ _ a\n\na------\n\n---a---\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> " "|>], " ", MarkdownElement[<|"Element" -> "_", "Data" -> " "|>], " a"}|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "a------"|>], MarkdownElement[<|"Element" -> "EmptyLine"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "---a---"|>]},
	"TestID"->"Thematic breaks-55"
	]

TestCreate[
	ImportMarkdown["- Foo\n- * * *\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>], " ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "*"|>]}|>]},
	"TestID"->"Thematic breaks-61"
	]

TestCreate[
	ImportMarkdown["Foo\n    ***\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "BlockQuote", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>]},
	"TestID"->"Thematic breaks-49"
	]

TestCreate[
	ImportMarkdown["* Foo\n* * *\n* Bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> {MarkdownElement[<|"Element" -> "*", "Data" -> " "|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Bar"|>]},
	"TestID"->"Thematic breaks-60"
	]

TestCreate[
	ImportMarkdown["- foo\n***\n- bar\n"],
	{MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "UnorderedListItem", "Level" -> 0, "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-57"
	]

TestCreate[
	ImportMarkdown["Foo\n***\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> {MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "***"|>]}|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-58"
	]

TestCreate[
	ImportMarkdown["Foo\n---\nbar\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo"|>], MarkdownElement[<|"Element" -> "ThematicBreak"|>], MarkdownElement[<|"Element" -> "Line", "Data" -> "bar"|>]},
	"TestID"->"Thematic breaks-59"
	]

EndTestSection[]