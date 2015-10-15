## 2.1. Prerequisites

Riven comes with some dependencies, which you have to statisfy before you can start to use it. But no panic it's not
that hard.

First of all you'll need [wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf/) in order to generate PDFs, since
that's the PDF generator backend of Riven. And you should use the QT patched version of `wkhtmltopdf` to get all the
features of riven. You may also use the version without patched qt, but that will disable the following features of
riven: Page numbers, table of contents and covers.

All right, Let's go ...

- If you got Arch Linux, you can just install the packages `wkhtmltopdf-static`and `icu48` from the AUR and you're done.
  Pretty easy, isn't it?

- If you got another Linux Distribution (like Ubuntu) or OSX you have to compile `wkhtmltopdf` from the sources. See
  http://natepinchot.com/2014/01/31/building-static-wkhtmltopdf/ for details. This may take some time: On my i7 it takes
  about 20 minutes.

- Otherwise, you can download `wkhtmltopdf` from the [official website](http://wkhtmltopdf.org/downloads.html).

I know, that part is somewhat uncomfortable and this will change in the future. Either wkhtmltopdf will be automatically
installed with the gem or riven comes with a Docker container. However, the installation will be easier in the future.

After wkhtmltopdf is compiled, make sure you can execute the `wkhtmltopdf` command in your shell:

```bash
$ wkhtmltopdf -V
```

If it works, everything is nice and you may proceed with the next step. If not, please make sure, `wkhtmltopdf` is
correctly installed and the executable is within your `PATH`.

In the second step, we need ruby. I recommend you to use [RVM](https://rvm.io) to install Ruby. It's pretty simple:

```bash
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
$ rvm install 2.2.3
$ rvm --default use 2.2.3
```

After that you should be able to use ruby:

```bash
$ ruby -v
```

If so, we're ready to install Riven in the next chapter!
