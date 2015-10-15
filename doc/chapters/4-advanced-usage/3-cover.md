## 4.3. Cover pages

To start your PDF with a nice cover page, define a cover markdown file and pass it to the `-c` param. Riven will prepend
that file before all other files and doesn't attach a page number.

```bash
$ riven -c documentation/cover.md documentation/
```

It can be helpful to use HTML within the cover page to have more control over it's layout.
