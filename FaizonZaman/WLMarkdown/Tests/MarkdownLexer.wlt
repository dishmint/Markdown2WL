BeginTestSection["MarkdownLexer"]
(* -------------------------------------------------------------------------- *)
(*                           CommonMark Lexer Tests                           *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------- EmptyLine ------------------------------- *)
VerificationTest[
	MarkdownLexer["", MarkdownRules["CommonMark"]],
	{ MarkdownToken[<| "Token" -> "EmptyLine" |>] },
	"TestID" -> "MarkdownLexer-CommonMark-EmptyLine"
]
(* ----------------------------- HorizontalLine ----------------------------- *)
VerificationTest[
	MarkdownLexer["---", MarkdownRules["CommonMark"]],
	{ MarkdownToken[<| "Token" -> "HorizontalLine" |>] },
	"TestID" -> "MarkdownLexer-CommonMark-HorizontalLine"
]
(* -------------------------------- CodeFence ------------------------------- *)
VerificationTest[
	MarkdownLexer["```", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-CodeFence"
]
VerificationTest[
	MarkdownLexer["```Mathematica", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "Mathematica" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-CodeFence-Language"
]
(* ---------------------------- UnorderedListItem --------------------------- *)
VerificationTest[
	MarkdownLexer["* A level zero bullet", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-UnorderedListItem-Level0"
]
VerificationTest[
	MarkdownLexer["  * A level one bullet", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-UnorderedListItem-Spaces-Level1"
]
VerificationTest[
	MarkdownLexer["	* A level one bullet", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-UnorderedListItem-Tabs-Level1"
]
(* ----------------------------- OrderedListItem ---------------------------- *)
VerificationTest[
	MarkdownLexer["1. A level zero bullet", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-OrderedListItem-Level0"
]
VerificationTest[
	MarkdownLexer["  1.1 A level one bullet", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-OrderedListItem-Spaces-Level1"
]
VerificationTest[
	MarkdownLexer["	1.1 A level one bullet", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-OrderedListItem-Tabs-Level1"
]
(* ---------------------------------- Quote --------------------------------- *)
VerificationTest[
	MarkdownLexer["> Quote me!", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "Quote", "Data" -> "Quote me!" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-Quote"
]
(* ------------------------------- BlockQuote ------------------------------- *)
VerificationTest[
	MarkdownLexer["    Here lies your blockquote!", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "BlockQuote", "Data" -> "Here lies your blockquote!" |>]},
	"TestID" -> "MarkdownLexer-CommonMark-BlockQuote"
]
(* ---------------------------------- Line ---------------------------------- *)
VerificationTest[
	MarkdownLexer["This is a line.", MarkdownRules["CommonMark"]],
	{MarkdownToken[<| "Token" -> "Line", "Data" -> "This is a line." |>]},
	"TestID" -> "MarkdownLexer-CommonMark-Line"
]
(* TODO: Add Block tests (Table, Codeblock, List) *)
EndTestSection[]
