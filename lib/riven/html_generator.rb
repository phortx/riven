require 'rubygems'
require 'riven/html_file'
require 'github/markup'

module Riven
  class HTMLGenerator
    attr_accessor :html, :html_file

    public def initialize(markup)
      @html_file = Riven::HTMLFile.new('_riven_tmp_file.html')

      @markup = markup

      @html = generate_html
      @html_file.write(@html)
    end

    public def generate_html
      css = File.read(File.expand_path(File.dirname(__FILE__)) + '/../../css/style.css')

      html =  '<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
      html << '<style type="text/css">' + css + '</style></head><body>'
      html << GitHub::Markup.render('nil.md', @markup)
      html << '</body></html>'
    end

    public def close!
      @html_file.delete!
    end
  end
end