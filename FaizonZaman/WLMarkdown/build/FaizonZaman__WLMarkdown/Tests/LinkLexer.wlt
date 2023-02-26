BeginTestSection["LinkLexer"]
(* -------------------------------------------------------------------------- *)
(*                           CommonMark Lexer Tests                           *)
(* -------------------------------------------------------------------------- *)

(* ------------------------------- Hyperlinks ------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Private`LinkLexer[
		{ MarkdownToken[ <| "Token" -> "Line", "Data" -> "Here is [a labeled link](https://www.example.com)" |>] },
		MarkdownRules["CommonMark"]["LinkRules"]
		],
	{ MarkdownToken[<|"Token" -> "Line", "Data" -> { "Here is ", MarkdownToken[<|"Token" -> "HyperLink", "Data" -> {"a labeled link", "https://www.example.com"}|>] }|>] },
	"TestID" -> "LinkLexer-CommonMark-LabelURL"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Private`LinkLexer[{ MarkdownToken[ <| "Token" -> "Line", "Data" -> "Here is a link <https://www.example.com>" |>] }, MarkdownRules["CommonMark"]["LinkRules"]],
	{ MarkdownToken[<|"Token" -> "Line", "Data" -> {"Here is a link ", MarkdownToken[<|"Token" -> "Hyperlink", "Data" -> "https://www.example.com"|>]}|>] },
	"TestID" -> "LinkLexer-CommonMark-URL"
]

(* ---------------------------- FootnoteReference --------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Private`LinkLexer[{ MarkdownToken[<| "Token" -> "Line", "Data" -> "There's more information about [this][1] in the footer" |>] }, MarkdownRules["CommonMark"]["LinkRules"]],
	{ MarkdownToken[<|"Token" -> "Line", "Data" -> {"There's more information about ", MarkdownToken[<|"Token" -> "FootnoteReference", "Data" -> {"this", "1"}|>], " in the footer"}|>] },
	"TestID" -> "LinkLexer-CommonMark-FootnoteReference"
]

(* --------------------------------- Images --------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Private`LinkLexer[{MarkdownToken[ <| "Token" -> "Line", "Data" -> "Here is ![a random image from picsum](https://picsum.photos/200)"|>]}, MarkdownRules["CommonMark"]["LinkRules"]],
	{ MarkdownToken[<|"Token" -> "Line", "Data" -> {"Here is ", MarkdownToken[<|"Token" -> "Image", "Data" -> {"a random image from picsum", "https://picsum.photos/200"}|>]}|>] },
	"TestID" -> "LinkLexer-CommonMark-Image"
]
EndTestSection[]
