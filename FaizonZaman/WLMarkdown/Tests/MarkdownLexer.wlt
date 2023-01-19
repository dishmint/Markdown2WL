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
