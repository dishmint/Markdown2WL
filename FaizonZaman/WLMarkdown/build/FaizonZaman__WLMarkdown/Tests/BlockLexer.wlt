BeginTestSection["BlockLexer"]
(* -------------------------------------------------------------------------- *)
(*                           CommonMark Lexer Tests                           *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------- CodeBlock ------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`BlockLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[<| "Token" -> "CodeFence", "Data" -> ""|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "A generic code block"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "With a line or two.. "|>],
            MarkdownToken[<| "Token" -> "CodeFence", "Data" -> ""|>],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["BlockRules"]
        ],
	{ 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "CodeBlock",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "CodeFence", "Data" -> ""|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "A generic code block"|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "With a line or two.. "|>],
                    MarkdownToken[<| "Token" -> "CodeFence", "Data" -> ""|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "BlockLexer-CommonMark-CodeBlock1"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`BlockLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "Mathematica"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "f[0] = 1"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "f[1] = 1"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "f[n_] := f[n] = f[n - 1] + f[n - 2]" |>],
            MarkdownToken[<| "Token" -> "CodeFence", "Data" -> ""|>],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["BlockRules"]
        ],
	{ 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "CodeBlock",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "CodeFence", "Data" -> "Mathematica"|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "f[0] = 1"|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "f[1] = 1"|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "f[n_] := f[n] = f[n - 1] + f[n - 2]" |>],
                    MarkdownToken[<| "Token" -> "CodeFence", "Data" -> ""|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "BlockLexer-CommonMark-CodeBlock2"
]
(* ---------------------------------- Table --------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`BlockLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "A | Cool | Table "|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> ":-: | :-- | --: "|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "1 | 2 | 3"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "A | B | C"|>],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["BlockRules"]
        ],
	{ 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "Table",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "A | Cool | Table "|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> ":-: | :-- | --: "|>],
                    {
                        MarkdownToken[<| "Token" -> "Line", "Data" -> "1 | 2 | 3"|>],
                        MarkdownToken[<| "Token" -> "Line", "Data" -> "A | B | C"|>]
                    }
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "BlockLexer-CommonMark-Table"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`BlockLexer[
        {
            MarkdownToken[<| "Token" -> "Line", "Data" -> "A | Cool | Table "|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> ":-: | :-- | --: "|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "1 | 2 | 3"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "A | B | C"|>]
        },
        MarkdownRules["CommonMark"]["BlockRules"]
        ],
    {
        MarkdownToken[<| "Token" -> "Line", "Data" -> "A | Cool | Table "|>],
        MarkdownToken[<| "Token" -> "Line", "Data" -> ":-: | :-- | --: "|>],
        MarkdownToken[<| "Token" -> "Line", "Data" -> "1 | 2 | 3"|>],
        MarkdownToken[<| "Token" -> "Line", "Data" -> "A | B | C"|>]
        },
	"TestID" -> "BlockLexer-CommonMark-Table-MalFormed"
]

(* ------------------------------ UnorderedList ----------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`BlockLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Top of the first list"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Top of the second list"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
            MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["BlockRules"]
        ],
	{ 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "UnorderedList",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Top of the first list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Top of the second list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "BlockLexer-CommonMark-UnorderedList"
]
(* ------------------------------- OrderedList ------------------------------ *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`BlockLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Top of the first list"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Top of the second list"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
            MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["BlockRules"]
        ],
	{
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "OrderedList",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Top of the first list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Top of the second list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "BlockLexer-CommonMark-OrderedList"
]
EndTestSection[]