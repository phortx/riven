## 4.2. Automatic Table of Contents

For an automatic generated table of contents after the cover page, you can add the `-t` param and pass a headline for
the table of contents:

```bash
$ riven -t "Contents" -c documentation/cover.md documentation/
```

Riven will generate a table of contents for all headlines. The user can click on the entries to jump directly to the
regarding headline.
