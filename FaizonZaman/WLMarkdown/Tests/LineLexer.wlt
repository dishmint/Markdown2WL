BeginTestSection["LineLexer"]
(* -------------------------------------------------------------------------- *)
(*                           CommonMark Lexer Tests                           *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------- EmptyLine ------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{ MarkdownToken[<| "Token" -> "EmptyLine" |>] }],
	"TestID" -> "LineLexer-CommonMark-EmptyLine"
]
(* ----------------------------- ThematicBreak ----------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["---", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{ MarkdownToken[<| "Token" -> "ThematicBreak" |>] }],
	"TestID" -> "LineLexer-CommonMark-ThematicBreak"
]
(* -------------------------------- CodeFence ------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["```", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "" |>]}],
	"TestID" -> "LineLexer-CommonMark-CodeFence"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["```Mathematica", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "Mathematica" |>]}],
	"TestID" -> "LineLexer-CommonMark-CodeFence-Language"
]
(* ---------------------------- UnorderedListItem --------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["* A level zero bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-UnorderedListItem-Level0"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["  * A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-UnorderedListItem-Spaces-Level1"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["	* A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-UnorderedListItem-Tabs-Level1"
]
(* ----------------------------- OrderedListItem ---------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["1. A level zero bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-OrderedListItem-Level0"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["  1.1 A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-OrderedListItem-Spaces-Level1"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["	1.1 A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-OrderedListItem-Tabs-Level1"
]
(* ---------------------------------- Quote --------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["> Quote me!", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "QuoteLine", "Data" -> "Quote me!" |>]}],
	"TestID" -> "LineLexer-CommonMark-QuoteLine"
]
(* ------------------------------- CodeLine ------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["    Here lies your blockquote!", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeLine", "Data" -> "Here lies your blockquote!" |>]}],
	"TestID" -> "LineLexer-CommonMark-CodeLine"
]
(* ---------------------------------- Line ---------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["This is a line.", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "Line", "Data" -> "This is a line." |>]}],
	"TestID" -> "LineLexer-CommonMark-Line"
]
(* -------------------------------- ListInput ------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer[
		{"# Example Markdown Title", "", "This is a sample paragraph", "", "### Example Markdown Section", "", "_This line is emphasized_"},
		MarkdownRules["CommonMark"]["LineRules"]
		],
	{
		MarkdownToken[<|"Token" -> "Heading", "Level" -> 1, "Data" -> "Example Markdown Title"|>],
		MarkdownToken[<|"Token" -> "EmptyLine"|>],
		MarkdownToken[<|"Token" -> "Line", "Data" -> "This is a sample paragraph"|>],
		MarkdownToken[<|"Token" -> "EmptyLine"|>],
		MarkdownToken[<|"Token" -> "Heading", "Level" -> 3, "Data" -> "Example Markdown Section"|>],
		MarkdownToken[<|"Token" -> "EmptyLine"|>],
		MarkdownToken[<| "Token" -> "Line", "Data" -> "_This line is emphasized_"|>]
		},
	"TestID" -> "LineLexer-CommonMark-ListInput"
]
EndTestSection[]
