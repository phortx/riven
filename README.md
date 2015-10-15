# Riven

Riven converts Markdown files to PDFs! Write documentations, books, reports and documents with your editor.
Publish them as PDF! It's that simple and even more powerful.


Feature highlights:

- Riven Extended Markdown (it's GitHub Flavored Markdown but with more features!)
- Includes: Structure you work!
- Generates well readable, optimized, beautiful looking PDFs
- Style your PDF via CSS
- Define a special and nice looking cover page
- Auto generated table of contents
- Syntax Highlighting with GitHub like theme
- Page numbers
- Smart directory based file merging and output file naming


## Additional Features

### Custom CSS

You may give riven an additional CSS file with the `-s` param:

```bash
$ riven -s doc.css documentation/
```

unfortunately this CSS doesn't affect the table of contents currently, sorry for that.


### Cover

You may give riven a cover MD file via the `-c` param, which will be prepended and not provided with a page number.

```bash
$ riven -c documentation/cover.md documentation/
```


### Syntax highlighting

Syntax highlighting just works as usual:

<pre lang="no-highlight">
```ruby
  def foo
    puts 'bar'
  end
```
</pre>

The syntax highlightning is powered by [coderay](https://github.com/rubychan/coderay) and is using a [github theme](https://github.com/pie4dan/CodeRay-GitHub-Theme).


### Table of Contents

For an automatic generated table of contents after the cover, just add the `-t` param and provide a headline for the table of contents:

```bash
$ riven -t "Contents" -c documentation/cover.md documentation/
```
