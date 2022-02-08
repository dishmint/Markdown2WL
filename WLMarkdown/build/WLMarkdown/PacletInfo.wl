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
                      {"Headings", "Headings.wlt"},
                      {"Emphasis", "Emphasis.wlt"},
                      {"Blocks", "Blocks.wlt"},
                      {"TeX", "TeX.wlt"},
                      {"Lists", "Lists.wlt"},
                      {"Links", "Links.wlt"}
                  }
                },
                {
                    "Documentation",
                    "Language" -> "English"
                }
            }
    |>
]
