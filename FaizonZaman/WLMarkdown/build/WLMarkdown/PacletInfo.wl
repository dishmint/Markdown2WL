PacletObject[
    <|
        "Name" -> "WLMarkdown",
        "Version" -> "0.0.1",
        "WolframVersion" -> "12.3+",
        "Description" ->"Parse markdown files into symbolic markdown",
        "Extensions" ->
            {
                {
                    "Kernel",
                    "Root" -> "Kernel",
                    "Context" -> "WLMarkdown`"
                },
                {
                    "Resource",
                    "Root" -> "Tests",
                    "Resources" -> {
                      {"Tokenizer", "Tokenizer.wlt"}
                  }
                },
                {
                    "Documentation",
                    "Language" -> "English"
                }
            }
    |>
]
