## 1.4 Riven compared to ...

### 1.4.1 ... Sphinx Documentation Suite

Sphinx is an awesome tool if it comes down to documentation of software. Unfortunately it requieres you to maintain a
big python file to configure the build. Rivens goal is to provide a very simple but yet powerful way to write your book
without any programming knowledge. Additionally it's hard to modify the layout of Sphinx' PDFs. You need to know LaTeX
and write a lot of it in order to change the not so fancy default layout of the PDFs. Riven tries to give you the best
result with as few configuration as possible to provide a beautiful PDF out of the box. And if the layout doesn't fit
your requirements you can change it with simple CSS rules.


### 1.4.2 ... GitBook Toolchain

The toolchain of GitBook is a well crafted build tool to generate PDFs, ePub, mobi and HTML books out of markdown.
The downside of GitBook is the fact it requires you to call many different commands in order to build your book. Riven
tries to keep it simple: Just call the `riven` command and you'll get your PDF (and HTML, mobi, ePub etc. in the
future). Additionally it's not possible to change the layout of the PDF with the GitBook Toolchain. With Riven you may
change the layout of the PDF via simple CSS rules.
