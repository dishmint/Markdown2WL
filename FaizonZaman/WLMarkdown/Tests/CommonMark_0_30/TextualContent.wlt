BeginTestSection["TextualContent"]
(* ----------------------------- Textual Content ---------------------------- *)
(* ------------ https://spec.commonmark.org/0.30/#textual-content ----------- *)

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

EndTestSection[]