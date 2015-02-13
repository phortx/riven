module Riven
  #
  # Represents a MD File
  #

  class MarkupFile
    attr_accessor :path


    #
    # Constructor
    # Also checks if the file exists. If not, an exception will be thrown.
    #

    public def initialize(path)
      @path = File.expand_path(path)

      unless File.exists?(@path)
        raise "File '#{path}' doesn't exist"
      end
    end


    class << self
      public def read_all(markup_files)
        markup = ''

        markup_files.each do |file|
          markup << "\n" + File.read(file.path)
        end

        return markup
      end
    end
  end
end