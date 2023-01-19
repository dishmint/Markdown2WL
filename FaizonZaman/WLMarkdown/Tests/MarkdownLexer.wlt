BeginTestSection["MarkdownLexer"]
(* -------------------------------------------------------------------------- *)
(*                                 CommonMark                                 *)
(* -------------------------------------------------------------------------- *)
(* EmptyLine *)
VerificationTest[
	MarkdownLexer["", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "EmptyLine" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-EmptyLine"
]
(* HorizontalLine *)
VerificationTest[
	MarkdownLexer["---", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "HorizontalLine" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-HorizontalLine"
]
(* CodeFence *)
VerificationTest[
	MarkdownLexer["```", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-CodeFence"
]
VerificationTest[
	MarkdownLexer["```lang", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "lang" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-CodeFence-Language"
]
(* UnorderedListItem *)
VerificationTest[
	MarkdownLexer["* A level zero bullet", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-UnorderedListItem-Level0"
]
VerificationTest[
	MarkdownLexer["  * A level one bullet", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-UnorderedListItem-Spaces-Level1"
]
VerificationTest[
	MarkdownLexer["	* A level one bullet", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-UnorderedListItem-Tabs-Level1"
]
(* OrderedListItem *)
VerificationTest[
	MarkdownLexer["1. A level zero bullet", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "A level zero bullet" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-OrderedListItem-Level0"
]
VerificationTest[
	MarkdownLexer["  1.1 A level one bullet", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-OrderedListItem-Spaces-Level1"
]
VerificationTest[
	MarkdownLexer["	1.1 A level one bullet", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "A level one bullet" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-OrderedListItem-Tabs-Level1"
]
(* Quote *)
VerificationTest[
	MarkdownLexer["> Quote me!", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "Quote", "Data" -> "Quote me!" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-Quote"
]
(* BlockQuote *)
VerificationTest[
	MarkdownLexer["    Here lies your blockquote!", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "BlockQuote", "Data" -> "Here lies your blockquote!" |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-BlockQuote"
]
(* Line *)
VerificationTest[
	MarkdownLexer["This is a line.", TokenRules["CommonMark"]],
	Splice[{MarkdownToken[<| "Token" -> "Line", "Data" -> "This is a line." |>]}],
	"TestID" -> "MarkdownLexer-CommonMark-Line"
]
EndTestSection[]
