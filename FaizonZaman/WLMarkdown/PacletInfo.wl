(* ::Package:: *)

PacletObject[
  <|
    "Name" -> "FaizonZaman/WLMarkdown",
    "Description" -> "Parse markdown files into symbolic markdown",
    "Creator" -> "Faizon Zaman",
    "License" -> "MIT",
    "PublisherID" -> "FaizonZaman",
    "Version" -> "0.0.1",
    "WolframVersion" -> "13.0+",
    "Extensions" -> {
      {
        "Kernel",
        "Root" -> "Kernel",
        "Context" -> "FaizonZaman`WLMarkdown`"
      },
      {
        "Resource",
        "Root" -> "Tests",
        "Resources" -> {
          {"LineLexer", "LineLexer.wlt"},
          {"LinkLexer", "LinkLexer.wlt"},
          {"BlockLexer", "BlockLexer.wlt"},
          (* {"DelimiterLexer", "DelimiterLexer.wlt"}, *)
          {"MarkdownLexer", "MarkdownLexer.wlt"}
          }
      },
      {
        "Resource",
        "Root" -> "Examples",
        "Resources" -> {{"CommonMark", "CommonMark.md"}}
      },
      {"Documentation", "Language" -> "English"}
    }
  |>
]
