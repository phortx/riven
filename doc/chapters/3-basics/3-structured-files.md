## 3.3. Structure your files

In the two previous chapters you learned how to convert a single file or a bunch of files into a PDF. In this chapter
you'll learn a nice mixed way how to structure bigger documents with many markdown files without the need to pass all
those files to the riven command or to ensure the alphabetical order is the order you want.

The magical feature of Riven which allows us to bring a clean tidiness in your files, is called *include directive*.
It's a markdown syntax which is not part of the original markdown language, but a feature of the Riven Extended
Markdown - or REM. REM is a superset of the GitHub Flavored Markdown introduced by Riven in order to provide some
additional features. The include directive allows you to define another markdown file. Riven will merge the content of
that markdown file into the outer markdown file by replacing the include directive.

The include syntax looks like that:

`_<<[ file ]`

where `file` is the path to another markdown file.

**Here's an example:**

`a.md`:

```markdown
Hello World!

_<<[ b.md ]

Bye World!
```

`b.md`:

```markdown
This content is **included**!
```

If you call

```bash
$ riven -o a.pdf a.md
```

Riven will merge the two files like that:

```markdown
Hello World!

This content is **included**!

Bye World!
```

This feature allows you to organize your document over many markdown files and subdirectories. Take a look at
https://github.com/phortx/riven/tree/master/doc to see a good example for the usage of includes and how to structure
a document.
