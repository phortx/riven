require 'rubygems'
require 'riven/html_file'
require 'riven/markup/code'
require 'redcarpet'

module Riven
  class HTMLGenerator
    attr_accessor :html, :html_file

    public def initialize(tmp_file, markup, config)
      @html_file = Riven::HTMLFile.new(tmp_file)

      @markup = markup
      @config = config

      @html = generate_html
      @html_file.write(@html)
    end

    public def generate_html
      css = File.read(File.expand_path(File.dirname(__FILE__)) + '/../../css/style.css')

      if @config.css_file != nil
        css << "\n\n"
        css << File.read(@config.css_file)
      end

      html =  '<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
      html << '<style type="text/css">' + css + '</style></head><body>'
      html << markup_to_html(@markup)
      html << '</body></html>'
    end

    public def markup_to_html(markup)
      code = Riven::Markup::Code.new

      markup = MarkupFile.remove_escape_sequences(markup)
      markup = code.extract(markup)

      opts = {
        no_intra_emphasis: true,
        tables: true,
        underline: true,
        highlight: true,
        with_toc_data: true,
        lax_spacing: true,
        xhtml: true,
        fenced_code_blocks: true
      }

      redcarpet_markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, opts)
      html = redcarpet_markdown.render(markup)

      html = code.process(html)

      html.gsub! '////[COVERSTART]////', '<div class="cover-page">'
      html.gsub! '////[COVEREND]////',   '</div>'

      return html
    end

    public def close!
      @html_file.delete!
    end
  end
end
