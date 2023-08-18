BeginTestSection["LineLexer"]
(* -------------------------------------------------------------------------- *)
(*                           CommonMark Lexer Tests                           *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------- EmptyLine ------------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{ MarkdownToken[<| "Token" -> "EmptyLine" |>] }],
	"TestID" -> "LineLexer-CommonMark-EmptyLine"
]
(* ----------------------------- ThematicBreak ----------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["---", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{ MarkdownToken[<| "Token" -> "ThematicBreak" |>] }],
	"TestID" -> "LineLexer-CommonMark-ThematicBreak"
]
(* -------------------------------- CodeFence ------------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["```", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "" |>]}],
	"TestID" -> "LineLexer-CommonMark-CodeFence"
]
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["```Mathematica", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "Mathematica" |>]}],
	"TestID" -> "LineLexer-CommonMark-CodeFence-Language"
]
(* ---------------------------- UnorderedListItem --------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["* A level zero bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-UnorderedListItem-Level0"
]
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["  * A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-UnorderedListItem-Spaces-Level1"
]
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["	* A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-UnorderedListItem-Tabs-Level1"
]
(* ----------------------------- OrderedListItem ---------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["1. A level zero bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-OrderedListItem-Level0"
]
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["  1.1 A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-OrderedListItem-Spaces-Level1"
]
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["	1.1 A level one bullet", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "LineLexer-CommonMark-OrderedListItem-Tabs-Level1"
]
(* ---------------------------------- Quote --------------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["> Quote me!", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "QuoteLine", "Data" -> "Quote me!" |>]}],
	"TestID" -> "LineLexer-CommonMark-QuoteLine"
]
(* ------------------------------- CodeLine ------------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["    Here lies your blockquote!", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeLine", "Data" -> "Here lies your blockquote!" |>]}],
	"TestID" -> "LineLexer-CommonMark-CodeLine"
]
(* ---------------------------------- Line ---------------------------------- *)
TestCreate[
	FaizonZaman`WLMarkdown`Lexer`Private`LineLexer["This is a line.", MarkdownRules["CommonMark"]["LineRules"]],
	Splice[{MarkdownToken[<| "Token" -> "Line", "Data" -> "This is a line." |>]}],
	"TestID" -> "LineLexer-CommonMark-Line"
]
(* -------------------------------- ListInput ------------------------------- *)
TestCreate[
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
