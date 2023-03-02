BeginTestSection["DelimiterLexer"]
(* -------------------------------------------------------------------------- *)
(*                           CommonMark Lexer Tests                           *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------- CodeBlock ------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[
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
        MarkdownRules["CommonMark"]["DelimiterRules"]
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
	"TestID" -> "DelimiterLexer-CommonMark-CodeBlock1"
]
VerificationTest[
    FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[
        {
            MarkdownToken[<|"Token" -> "EmptyLine"|>],
            MarkdownToken[
                <|
                    "Token" -> "CodeBlock",
                    "Data" -> {
                        MarkdownToken[<|"Token" -> "CodeFence", "Data" -> "Mathematica"|>],
                        MarkdownToken[<|"Token" -> "Line", "Data" -> "f[0] = 1"|>],
                        MarkdownToken[<|"Token" -> "Line", "Data" -> "f[1] = 1"|>],
                        MarkdownToken[<|"Token" -> "Line", "Data" -> "f[n_Integer] := f[n] = f[n - 1] + f[n - 2]"|>],
                        MarkdownToken[<|"Token" -> "CodeFence", "Data" -> ""|>]
                        }
                    |>
                ],
            MarkdownToken[<|"Token" -> "EmptyLine"|>]
            },
            MarkdownRules["CommonMark"]["DelimiterRules"]
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
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "f[n_Integer] := f[n] = f[n - 1] + f[n - 2]" |>],
                    MarkdownToken[<| "Token" -> "CodeFence", "Data" -> ""|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "DelimiterLexer-CommonMark-CodeBlock2"
]
(* ---------------------------------- Table --------------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[
        { 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "Table",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "Line", "Data" -> "A | _Cool_ | Table "|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> ":-: | :-- | --: "|>],
                    {
                        MarkdownToken[<| "Token" -> "Line", "Data" -> "**1** | 2 | 3"|>],
                        MarkdownToken[<| "Token" -> "Line", "Data" -> "A | **_B_** | C"|>]
                        }
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["DelimiterRules"]
        ],
	{ 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "Table",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "Line", "Data" -> {"A | ", MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "_"|>], "Cool", MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "_"|>], " | Table "}|>],
                    MarkdownToken[<| "Token" -> "Line", "Data" -> ":-: | :-- | --: "|>],
                    {
                        MarkdownToken[<| "Token" -> "Line", "Data" -> {MarkdownToken[<|"Token"->"Delimiter", "Data"->"**"|>], "1", MarkdownToken[<|"Token"->"Delimiter", "Data"->"**"|>], " | 2 | 3"}|>],
                        MarkdownToken[<| "Token" -> "Line", "Data" -> {"A | ",MarkdownToken[<|"Token"->"Delimiter", "Data"->"**"|>], MarkdownToken[<|"Token"->"Delimiter", "Data"->"_"|>], "B", MarkdownToken[<|"Token"->"Delimiter", "Data"->"_"|>], MarkdownToken[<|"Token"->"Delimiter", "Data"->"**"|>], " | C"} |>]
                    }
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "DelimiterLexer-CommonMark-Table"
]
(* TODO: Add tests for non-matches *)
(* ------------------------------ UnorderedList ----------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[
	{ 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "UnorderedList",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Top of the _first_ list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> "Top of the **second** list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["DelimiterRules"]
        ],
	{ 
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "UnorderedList",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> {"Top of the ", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "_"|>], "first", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "_"|>], " list"}|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 0, "Data" -> {"Top of the ", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "**"|>], "second", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "**"|>], " list"}|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "UnorderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "DelimiterLexer-CommonMark-UnorderedList"
]
(* ------------------------------- OrderedList ------------------------------ *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[
                <|
                    "Token" -> "OrderedList",
                    "Data" -> {
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Top of the _first_ list"|>],
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Top of the **second** list"|>],
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                        MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>]
                    }
                |>
            ],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["DelimiterRules"]
        ],
	{
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "OrderedList",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> {"Top of the ", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "_"|>], "first", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "_"|>], " list"}|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Undeneath the top of the list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 0, "Data" -> {"Top of the ", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "**"|>], "second", MarkdownToken[<|"Token"->"Delimiter", "Data" -> "**"|>], " list"}|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>],
                    MarkdownToken[<| "Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Underneath the top of the second list"|>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "DelimiterLexer-CommonMark-OrderedList"
]

(* ---------------------------- Nested Delimiters --------------------------- *)
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "_This text is **important**_"|>],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["DelimiterRules"]
        ],
	{
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "Line",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "_" |>],
                    "This text is ",
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "**" |>],
                    "important",
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "**" |>],
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "_" |>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "DelimiterLexer-CommonMark-NestedDelimiter1"
]
VerificationTest[
	FaizonZaman`WLMarkdown`Lexer`Private`DelimiterLexer[
        {
            MarkdownToken[<| "Token" -> "EmptyLine"|>],
            MarkdownToken[<| "Token" -> "Line", "Data" -> "_This text is **really** important_"|>],
            MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
        MarkdownRules["CommonMark"]["DelimiterRules"]
        ],
	{
        MarkdownToken[<| "Token" -> "EmptyLine"|>],
        MarkdownToken[
            <|
                "Token" -> "Line",
                "Data" -> {
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "_" |>],
                    "This text is ",
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "**" |>],
                    "really",
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "**" |>],
                    " important",
                    MarkdownToken[<| "Token" -> "Delimiter", "Data" -> "_" |>]
                    }
                |> 
            ],
        MarkdownToken[<| "Token" -> "EmptyLine"|>]
        },
	"TestID" -> "DelimiterLexer-CommonMark-NestedDelimiter2"
]
EndTestSection[]