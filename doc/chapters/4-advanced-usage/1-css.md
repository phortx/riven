## 4.1. Style your PDF

Riven allows you to style your PDF via CSS rules. This feature makes it possible to change colors, fonts, margins and
many more.

However please consider that this is a PDF, so the capabilities of the layouting via CSS is limited. Not every CSS rule
you know will work.

In order to use a CSS file, you have to create a `style.css` for example and pass it to the `-s` param of riven:

```bash
$ riven -s style.css documentation.md
```

Some hints:

- Every text paragraph is wrapped into a `<p>` tag
- The headlines will be transformed to `<h1>`, `<h2>`, `<h3>` ... tags, where `#` is `<h1>`, `##` is `<h2>` and so on
- Quotes (`>`) are transformed to a `<blockquote>` tag
- Bold text is transformed to a `<strong>` tag
- `<hr>` tags are used for horizontal lines (`-----`)
- Unordered lists are transformed to `<ul>` and `<li>` tags and ordered lists are transformed to `<ol>` and `<li>` tags.
  Nested lists are `<ul>` tags within a `<li>` tag
- Inline fixed width text (backticks) is transformed to `<code>` tags
- Multiline code blocks are transformed into `<pre>` tags

To style the cover page, you can use the `.cover-page` CSS class. The following example will change the h1 color on the
cover page to red:

```css
.cover-page h1 {
  color: red;
}
```
