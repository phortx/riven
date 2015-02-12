# Riven

! Still under development, please stay tuned :) !

Converts GitHub Flavored Markdown to awesome looking PDFs! Featuring:

- Syntax Highlighting
- Custom CSS
- Covers
- Table of Contents


## Prerequisites

You need `wkhtmltopdf` in order to generate PDFs, since that's the PDF generator backend for riven:

- If you got a Linux Distribution or OSX and your package mangement offers `wkhtmltopdf` in a newer version than `0.9.9.1`, then install it via your package manager.

- If you there's no newer version, you should use the `wkhtmltopdf-binary` gem: `gem install wkhtmltopdf-binary`

After that, make sure you can execute the `wkhtmltopdf` command in your shell:

```bash
$ wkhtmltopdf -v
```

If it works, everything is nice and you may proceed with the next step. If not, please make sure, `wkhtmltopdf` is correctly installed and the executable is within your `PATH`.


## Installation

Simple as usual:

```bash
$ gem install riven
```


## Usage

Riven is designed to create documents out of a bunch of markdown files. So it may take a single markdown file or a directory with some markdown files inside. Consider that the files are merged in alphabetical order if you provide a folder. Just take a look at the following examples.


### Single file to PDF

This will take your `example.md` and generate a `example.pdf` in the same directory:

```bash
$ riven example.md
```


### Multiple files

This will take your `example-1.md` and `example-2.md` and generate a `awesome.pdf` in the same directory:

```bash
$ riven -o awesome.pdf example-1.md example-2.pdf
```


### A directory

This will take your `documentation` directory with all it's files and generate a `doc.pdf` in the same directory:

```bash
$ ls
documentation/

$ ls documentation/
chapter-1-preface.md
chapter-2-general.md
chapter-3-admin-gui.md
chapter-4-commandline-interface.md
chapter-5-api.md

$ riven -o doc.pdf documentation/

$ ls
doc.pdf
documentation/
```


## Additional Features

### Custom CSS

You may give riven an additional CSS file with the `-s` param:

```bash
$ riven -s doc.css -o doc.pdf documentation/
```


### Cover

You may give riven a cover MD file via the `-c` param, which will be prepended and not provided with a page number.

```bash
$ riven -c documentation/cover.md -o doc.pdf documentation/
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

For an automatic generated table of contents after the cover, just add the `-t` param:

```bash
$ riven -t -c documentation/cover.md -o doc.pdf documentation/
```