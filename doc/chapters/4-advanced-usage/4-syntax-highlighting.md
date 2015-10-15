## 4.4. Syntax highlighting

Riven comes with syntax highlighting for code blocks:

```markdown
` ``ruby
  def foo
    puts 'bar'
  end
` ``
```

(Ignore the whitespace between the backticks)

This code sample will produce the following field in the PDF:

```ruby
  def foo
    puts 'bar'
  end
```

The syntax highlighting is powered by [coderay](https://github.com/rubychan/coderay) and Riven is using a [github theme](https://github.com/pie4dan/CodeRay-GitHub-Theme).
