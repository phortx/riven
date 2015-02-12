module Riven
  #
  # Represents a MD File
  #

  class MarkupFile
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
  end
end