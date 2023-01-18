# CommonMark Example Document

This document contains examples for testing [CommonMark.30][1]. Consider it a slimmed-down version of the spec page.

## Blocks

Write Paragraphs like so. A paragraph is the basic block of Markdown. A paragraph is what text will turn into when there is no reason it should become anything else.

Blank lines separate paragraphs. Markdown supports _italic_ and **bold** formatting.

Lines can have nested styling as well, like _a **bold** in an italic_.

## Lists

### Ordered list

1. Item 1
2. Item 2
   1. Item 2.1
3. Item 3
   1. Item 3.1
4. Item Ⅳ

_Note: the fourth item uses the Unicode character for [Roman numeral four][2]._

### Unordered list

* An item
* Another item
  * A sub item
* Yet another item
* And there's more...
  * A sub item with spaces

## Paragraph modifiers

### Code block

    Code blocks are useful for people who look at code or for clarity of plain text content. As you can see, it uses a fixed-width font.

```Mathematica
f[0] = 1
f[1] = 1
f[n_Integer] := f[n - 1] + f[n - 2]
```

```
Generic fenced code block
With Text In It
```

You can also make `inline code` to add insert code block formatting anywhere.

### Quote

> Here is a quote. What this is should be self explanatory. Quotes are automatically indented when they are used.

## Headings

Markdown supports six levels of headings; corresponding with the six levels of HTML headings. You've probably noticed them already in the page. Each level down uses one more hash character.

### Headings _can_ also contain **formatting**

### They can even contain `inline code`

Of course, demonstrating what headings look like messes up the structure of the page.

I don't recommend using more than three or four levels of headings here, because, when you're smallest heading isn't too small, and you're largest heading isn't too big, and you want each size up to look noticeably larger and more important, there aren't any other sizes to choose from.

####### hello

## LaTex

LaTex is also supported:

* inline

\(a^2 + b^2 = c^2\)

$a^2 + b^2 = c^2$

* presented

\[a^n + b^n = c^n\]
\[ a^n + b^n = c^n \]

$$a^2 + b^2 = c^2$$
$$ a^2 + b^2 = c^2 $$

## URLs

Add hyperlinks in the following ways:

* A named link to [MarkItDown][3]. The easiest way to do these is to select what you want to make a link and hit `Ctrl+L`.
* Another named link to [MarkItDown](http://www.markitdown.net/)
* Sometimes you want the URL : <http://www.markitdown.net/>.

## Horizontal rule

A horizontal rule is a dividing line drawn across the page, useful for separating blocks of text.

---

## Tables

Markdown | Less | Pretty
--- | --- | ---
_Still_ | `renders` | **nicely**
1 | 2 | 3

A | Second | Table
:--- | :---: | ---:
_Just_ | `for` | **testing**
4 | 5 | 6

## Images

Markdown can also contain images.
![Streetview of Palm Trees by Brandon Erlinger-Ford](https://images.unsplash.com/photo-1564889998041-0dacc0706a0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80)

## Last

There's actually a lot more to Markdown than this. See the official [introduction][4] and [syntax][5] for more information. Be aware that this document is not using the official implementation, and there may be subtle differences in rendering on other platforms.

  [1]: https://spec.commonmark.org/0.30/
  [2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
  [3]: http://www.markitdown.net/
  [4]: http://daringfireball.net/projects/markdown/basics
  [5]: http://daringfireball.net/projects/markdown/syntax
