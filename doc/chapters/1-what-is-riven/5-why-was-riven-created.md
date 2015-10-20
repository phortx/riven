## 1.4. Why was Riven created?

I've two hobbies. Ok I got more hobbies, but only two of them are relevant for Riven.

One is programming. I code a lot. Additionally it's my job so I code even more. And a good programmer documents
his software. In my company we're working on a high innovative CMS with a very versatile framework which allows us to
implement nearly every kind of project. We had to document that framework in some way for the other developers who
would use it and implement the customer projects based on the CMS. One requirement to the documentation was portability.
It should be readable on the PC, on Tablets and it should be printable. As we started to write the documentation, we
used OpenOffice and saved it as a ODT file which is basically a ZIP-File with some XML within. In order words: We had a
big binary file in our git repository. It doesn't took a long time until we had merge conflicts due the fact that up to
three people have been working on the document at the same time. And merging a big binary blob doesn't make fun. So I
wanted to switch to another tool chain to write the documentation. The obvious suggest was HTML of course. But to write
HTML is much work, we didn't want to do that. We know HTML, since we're web developers, but we wanted a solution which
would be more lean and allows a faster workflow without much testing. Of course we could have used our CMS, but we
wanted to have the documentation in our git repository. However we wanted to use plain text to write your documentation
and we wanted a PDF as a result. Unfortunately there wasn't any good comparable tool that time.

My second hobby is Pen and Paper. Dungeons and Dragons, you know (Cthulu, Aborea and Pathfinder to be exact). And I was
writing a campaign. I was writing that campaign in markdown, because I love my editor and I wanted to use git to manage
everything since GitLab renders markdown nicely. Now I needed a build chain to produce a PDF in order to have one
document which can be printed or sent via mail.

For these both use cases I hacked the initial proof of concept version of a md2pdf ruby script, which worked pretty
well. But I wanted some additional features like styling of the PDF via CSS, a cover page, syntax highlighting and some
other stuff. So the script started to grow to a bigger project. After some time I've renamed it to riven, since, well, it
sounds cool. And yes it's reference to the Myst series.

In order to keep even big documents structured and clear, riven 1.1.0 introduced the *include* syntax, which allows
a better split up of the content over many files, subdirectories and allows an easier refactoring of the chapters.

Riven solved both use cases very well. I'm using riven to write both large Pen and Paper campaings and some small
documents. Either quick or within weeks of hard work. Both cases produce a nice PDF. Today the CMS framework
documentation of my company includes over 200 PDF pages generated out of 9500 lines of markdown, which are changed on a
weekly basis and Riven does a nice job.
