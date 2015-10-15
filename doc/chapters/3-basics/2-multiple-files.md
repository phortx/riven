## 3.2. Many at once

Now we know how to convert a single file into a PDF document. But usually we have more then one file. For example one
file for each chapter. Riven may take a bunch of markdown files and compile them into a single PDF file.

In order to use that feature, we need some more markdown files:

`chapter-1.md`:

```markdown
# Chapter 1

Hello World!
```


`chapter-2.md`:

```markdown
# Chapter 2

Another example
```

`chapter-3.md`:

```markdown
# Chapter 3

Last but not least
```

Now you can merge all these files into a single PDF with the following command:

```bash
$ riven -o awesome.pdf chapter-1.md chapter-2.md chapter-3.md
```

You'll get a single PDF file, just as in chapter 3.1., which contains all three chapters and the regarding content. The
`-o` param determines the name of the generated PDF file.


Riven is also able to guess the PDF file name if all markdown files are located in one directory. So let's create
a directory called `awesome` and put our three markdown files into it. Now you should have a file structure like this:

```bash
$ ls -1
awesome/

$ ls -1 awesome/
chapter-1.md
chapter-2.md
chapter-3.md
```

The following command will generate exactly the same PDF file as the command we used before, but you don't have to
provide a PDF file name. Riven will take the directory name as the PDF file name.

```bash
$ riven awesome/
```

You'll receive a `awesome.pdf` file like before.

Consider that Riven will merge the markdown files of the directory in alphabetical order.
