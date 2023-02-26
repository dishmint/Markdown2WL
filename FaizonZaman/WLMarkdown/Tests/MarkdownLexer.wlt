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
(* -------------------------------- CodeBlock ------------------------------- *)
VerificationTest[
	MarkdownLexer[
		{
			"",
			"```Mathematica",
			"f[0] = 1",
			"f[1] = 1",
			"f[n_Integer] := f[n-1] + f[n-2]",
			"```",
			""
			},
		MarkdownRules["CommonMark"]
		],
	{
		MarkdownToken[<|"Token" -> "EmptyLine"|>],
		MarkdownToken[
			<|
				"Token" -> "CodeBlock",
				"Data" -> {
					MarkdownToken[<|"Token" -> "CodeFence", "Data" -> "Mathematica"|>],
					MarkdownToken[<|"Token" -> "Line", "Data" -> "f[0] = 1"|>],
					MarkdownToken[<|"Token" -> "Line", "Data" -> "f[1] = 1"|>],
					MarkdownToken[<|"Token" -> "Line", "Data" -> "f[n_Integer] := f[n-1] + f[n-2]"|>],
					MarkdownToken[<|"Token" -> "CodeFence", "Data" -> ""|>]
					}
				|>
			],
		MarkdownToken[<|"Token" -> "EmptyLine"|>]
 		},
	"TestID" -> "MarkdownLexer-CommonMark-CodeBlock"
]
VerificationTest[
	MarkdownLexer[
		{
			"```Mathematica",
			"f[0] = 1",
			"f[1] = 1",
			"f[n_Integer] := f[n-1] + f[n-2]",
			"```"
			},
		MarkdownRules["CommonMark"]
		],
	{
		MarkdownToken[<|"Token" -> "CodeFence", "Data" -> "Mathematica"|>],
		MarkdownToken[<|"Token" -> "Line", "Data" -> "f[0] = 1"|>],
		MarkdownToken[<|"Token" -> "Line", "Data" -> "f[1] = 1"|>],
		MarkdownToken[<|"Token" -> "Line", "Data" -> {"f[n", MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "_"|>], "Integer] := f[n-1] + f[n-2]"}|>], MarkdownToken[<|"Token" -> "CodeFence", "Data" -> ""|>]
		},
	"TestID" -> "MarkdownLexer-CommonMark-CodeBlock-MalFormed"
]
(* ---------------------------------- Table --------------------------------- *)
VerificationTest[
	MarkdownLexer[
		{
			"",
			"A | Simple | Table ",
			":-- | :-: | --: ",
			"1 | 2 | 3 ",
			"4 | 5 | 6 ",
			""
			},
		MarkdownRules["CommonMark"]
		],
	{
		MarkdownToken[<|"Token" -> "EmptyLine"|>],
		MarkdownToken[
			<|
				"Token" -> "Table",
				"Data" -> {
					MarkdownToken[<|"Token" -> "Line", "Data" -> "A | Simple | Table "|>],
					MarkdownToken[<|"Token" -> "Line", "Data" -> ":-- | :-: | --: "|>],
					{
						MarkdownToken[<|"Token" -> "Line", "Data" -> "1 | 2 | 3 "|>],
						MarkdownToken[<|"Token" -> "Line", "Data" -> "4 | 5 | 6 "|>]
						}
					}
				|>
			],
		MarkdownToken[<|"Token" -> "EmptyLine"|>]
 		},
	"TestID" -> "MarkdownLexer-CommonMark-Table"
]
VerificationTest[
	MarkdownLexer[
		{
			"A | Simple | Table ",
			":-- | :-: | --: ",
			"1 | 2 | 3 ",
			"4 | 5 | 6 "
			},
		MarkdownRules["CommonMark"]
		],
	{
		MarkdownToken[<|"Token" -> "Line", "Data" -> "A | Simple | Table "|>],
		MarkdownToken[<|"Token" -> "Line", "Data" -> ":-- | :-: | --: "|>],
		MarkdownToken[<|"Token" -> "Line", "Data" -> "1 | 2 | 3 "|>],
		MarkdownToken[<|"Token" -> "Line", "Data" -> "4 | 5 | 6 "|>]
		},
	"TestID" -> "MarkdownLexer-CommonMark-Table-MalFormed"
]
(* ---------------------------------- Lists --------------------------------- *)
VerificationTest[
	MarkdownLexer[
		{
			"",
			"* A list",
			"	* an item in a list",
			""
			},
		MarkdownRules["CommonMark"]
		],
	{
		MarkdownToken[<|"Token" -> "EmptyLine"|>],
		MarkdownToken[
			<|
				"Token" -> "UnorderedList",
				"Data" -> {
					MarkdownToken[<|"Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "A list"|>],
					MarkdownToken[<|"Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "an item in a list" |>]
					}
				|>
			],
		MarkdownToken[<|"Token" -> "EmptyLine"|>]
 		},
	"TestID" -> "MarkdownLexer-CommonMark-UnorderedList"
]
VerificationTest[
	MarkdownLexer[
		{
			"",
			"1. A list",
			"	1.1 an item in a list",
			""
			},
		MarkdownRules["CommonMark"]
		],
	{
		MarkdownToken[<|"Token" -> "EmptyLine"|>],
		MarkdownToken[
			<|
				"Token" -> "OrderedList",
				"Data" -> {
					MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "A list"|>],
					MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "an item in a list" |>]
					}
				|>
			],
		MarkdownToken[<|"Token" -> "EmptyLine"|>]
 		},
	"TestID" -> "MarkdownLexer-CommonMark-OrderedList"
]
EndTestSection[]
