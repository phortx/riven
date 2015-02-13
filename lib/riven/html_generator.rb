require 'riven/html_file'

module Riven
  class HTMLGenerator
    attr_accessor :html, :html_file

    public def initialize
      @html_file = Riven::HTMLFile.new('_riven_tmp_file.html')

      @html = '<b>hello world!</b>' # TODO generate html from markdown files
      @html_file.write(@html)
    end

    public def close!
      @html_file.delete!
    end
  end
end