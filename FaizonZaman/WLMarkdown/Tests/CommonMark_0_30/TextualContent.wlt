BeginTestSection["TextualContent"]
(* ----------------------------- Textual Content ---------------------------- *)
(* ------------ https://spec.commonmark.org/0.30/#textual-content ----------- *)

TestCreate[
	ImportMarkdown["Foo \[Chi]\[Rho]\:1fc6\[Nu]\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Foo \[Chi]\[Rho]\:1fc6\[Nu]"|>]},
	"TestID"->"Textual content-651"
	]

TestCreate[
	ImportMarkdown["hello $.;'there\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> {"hello ", MarkdownElement[<|"Element" -> "Delimiter", "Data" -> "$"|>], ".;'there"}|>]},
	"TestID"->"Textual content-650"
	]

TestCreate[
	ImportMarkdown["Multiple     spaces\n"],
	{MarkdownElement[<|"Element" -> "Line", "Data" -> "Multiple     spaces"|>]},
	"TestID"->"Textual content-652"
	]

EndTestSection[]