## 1.4. The config file

If you take a look at the Riven help (`riven -h`), you'll see that riven supports a bunch of command line options. It
can be a bit painful to remember all those parameters in order to regenerate your PDF from time to time. So it's
recommended to setup a config file for riven where you can set all your settings instead of passing them to the `riven`
command. This can you save you a lot of time.

A Riven config file is a simple YAML file, like you may know from Rails or Symfony. But they're really easy to
understand, so no panic if you never heard of it before.

An example riven.yml looks like that:

```yml
pdf_output_file: example.pdf
cover_file: cover.md
css_file: style.css
generate_toc: true
toc_headline: 'Contents'
dump_html: false
dump_cover_html: false
verbose: false
files:
  - index.md
```

You may provide as many files as you want under the `files` section. Each file gets one line. For example:

```yml
files:
  - index.md
  - chapter-1.md
  - chapter-2.md
  - chapter-3.md
```

Riven searches for a `riven.yml` in the current directory. But if you config file is located in another directory, you
should pass it via the `-C` param. However if you structure your document like this:

```bash
$ ls -1

chapters/
cover.md
index.md
riven.yml
style.css
```

it will be pretty easy to generate your PDF, since you just have to call `riven` without any params:

```bash
$ riven
```

It will use the `riven.yml` from the current directory and load all settings from it.

You're also allowed to mix up command line parameters and the config file. For example you can override the stylesheet:

```bash
$ riven -s another_style.css
```

The command line params will override the settings from the `riven.yml`.