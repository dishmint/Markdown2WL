# **Markdown2WL**

The goal of this repo is to establish Markdown Import and Export Converters as well as a standalone Markdown parser.

The current parser provides reasonable coverage of markdown syntax. A demo notebook is included in the Parser directory. Feel free to add issues for subpar/unsatisfcatory parsing, or where the Symoblic structure could use improvement. 

A package to Render the parse list is coming, as well as Import / Export converters so you can import Markdown files as Symbolic Markdown, or as a Notebook!

---
Installation:
1. Download the zip and extract it on your machine
2. Open Mathematica
3. File > Install > From File..
4. Select the `MarkdownParse.wl` file
3. File > Install > From File..
4. Select the `MarkdownParserTests.wl` file
5. Open the `MarkdownParserDemo.nb`

Demo Notebook Explainer:

* The `MarkdownElements` section displays the current Symbolic MarkdownElements supported
* The `MarkdownParse Example` section runs the parser on the included `test.md` file
* The `TestParser` section runs a suite of VerifcationTests
* The `Markdown Graphs` section shows an `ExpressionGraph` of the `test.md` file
