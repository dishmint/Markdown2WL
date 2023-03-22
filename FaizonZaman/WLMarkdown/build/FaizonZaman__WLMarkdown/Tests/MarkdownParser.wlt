BeginTestSection["MarkdownParser"]
(* -------------------------------------------------------------------------- *)
(*                            MarkdownParser Tests                            *)
(* -------------------------------------------------------------------------- *)

(* TODO: MarkdownParser Tests  *)
(* TODO: DelimiterParser Tests *)

VerificationTest[
    MarkdownParser[MarkdownToken[<| "Token" -> "EmptyLine"|>], TokenToElementRules["CommonMark"]],
    {MarkdownElement[ <| "Element" -> "EmptyLine" |>]},
    "TestID" -> "MarkdownParser-EmtpyLineTest1"
]

VerificationTest[
    MarkdownParser[MarkdownToken[<| "Token" -> "HorizontalLine"|>], TokenToElementRules["CommonMark"]],
    {MarkdownElement[ <| "Element" -> "HorizontalLine" |>]},
    "TestID" -> "MarkdownParser-HorizontalLineTest1"
]

VerificationTest[
    MarkdownParser[MarkdownToken[<| "Token" -> "Line", "Data" -> "This is a sample paragraph"|>], TokenToElementRules["CommonMark"]],
    { MarkdownElement[<| "Element" -> "Line", "Data" -> "This is a sample paragraph"|>] },
    "TestID" -> "MarkdownParser-LineTest1"
]

VerificationTest[
    MarkdownParser[
        MarkdownToken[
            <|
                "Token" -> "OrderedList",
                "Data" -> {
                    MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item 1"|>],
                    MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item 2"|>],
                    MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Item 2.1"|>],
                    MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item 3"|>],
                    MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 1, "Data" -> "Item 3.1"|>],
                    MarkdownToken[<|"Token" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item Ⅳ"|>]
                    }
                |>
            ],
        TokenToElementRules["CommonMark"]
        ],
    {
        MarkdownElement[
            <|
                "Element" -> "OrderedList",
                "Data" -> {
                    MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item 1"|>],
                    MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item 2"|>],
                    MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "Item 2.1"|>],
                    MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item 3"|>],
                    MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 1, "Data" -> "Item 3.1"|>],
                    MarkdownElement[<|"Element" -> "OrderedListItem", "Level" -> 0, "Data" -> "Item Ⅳ"|>]
                    }
                |>
            ]
        },
        "TestID" -> "MarkdownParser-BlockTest1"
    ]

VerificationTest[
    MarkdownParser[
        {
            MarkdownToken[
                <|
                    "Token" -> "Line",
                    "Data" -> { 
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "_"|>], 
                        "This line is emphasized",
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "_"|>]
                       }
                    |>
                ]
            },
            TokenToElementRules["CommonMark"]
        ],
    {
        MarkdownElement[
            <|
                "Element" -> "Line",
                "Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "This line is emphasized"|>]}
                |>
            ]
        },
    "TestID" -> "MarkdownParser-DelimiterTest1"
]

VerificationTest[
    MarkdownParser[
        {
            MarkdownToken[
                <|
                    "Token" -> "Line",
                    "Data" -> {
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "**"|>], 
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "_"|>], 
                        "this",
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "_"|>],
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "**"|>],
                        " line ",
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "**"|>],
                        "has",
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "**"|>],
                        " ",
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "_"|>],
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "**"|>],
                        "multiple styles",
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "**"|>],
                        MarkdownToken[<|"Token" -> "Delimiter", "Data" -> "_"|>]
                        }
                    |>
                ]
            },
            TokenToElementRules["CommonMark"]
        ],
    {
        MarkdownElement[
            <|
                "Element" -> "Line",
                "Data" -> {
                    MarkdownElement[ <| "Element" -> "**","Data" -> {MarkdownElement[<|"Element" -> "_", "Data" -> "this"|>]} |> ],
                    " line ",
                    MarkdownElement[<|"Element" -> "**", "Data" -> "has"|>],
                    " ",
                    MarkdownElement[<|"Element" -> "_", "Data" -> {MarkdownElement[<|"Element" -> "**", "Data" -> "multiple styles"|>]}|>]
                    }
                |>
            ]
        },
    "TestID" -> "MarkdownParser-DelimiterTest2"
]
EndTestSection[]