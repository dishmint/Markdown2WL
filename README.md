# **Markdown2WL** [WIP]

The goal of this repo is to establish Markdown Import and Export Converters as well as a standalone Markdown parser.

The parser is not complete, but can offer a symbolic expression of markdown. A demo notebook is included in the Parser directory. Feedback is welcome!

---
Installation:
1. Download the zip and extract it on your machine
2. Open Mathematica
3. File > Install > From File..
4. Select the `MarkdownParse.wl` file
3. File > Install > From File..
4. Select the `MarkdownParserTests.wl` file
5. Open the `MarkdownParserDemo.nb`

What's in the demo notebook:

* The `MarkdownElements` section displays the current Symbolic MarkdownElements supported
* The `MarkdownParse Example` section runs the parser on the included `test.md` file
* The `TestParser` section runs a suite of VerifcationTests
* The `Markdown Graphs` section shows an `ExpressionGraph` of the `test.md` file


---
Future

- [ ] Deploy as a paclet
- [ ] Implement Import and Export converter
- [ ] Official common mark support
- [ ] Baskin Robins of Markdown
- [ ] Custom Stylesheets
