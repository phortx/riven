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

      if File.directory?(@path)
        raise "Mixing files and directories is not allowed, sorry"
      end
    end


    class << self
      public def read_all(markup_files, except = [])
        markup = ''

        markup_files = [markup_files] unless markup_files.respond_to?(:each)
        except = [except] unless except.respond_to?(:each)

        markup_files.each do |file|
          markup << "\n\n" + File.read(file.path) unless exclude?(except, file)
        end

        return markup
      end

      public def read_cover(cover_file)
        cover_markup =  "\n////[COVERSTART]////\n"
        cover_markup << Riven::MarkupFile.read_all(cover_file)
        cover_markup << "\n////[COVEREND]////\n"
      end

      private def exclude?(except, file)
        except.select { |f| !f.empty? && f.path === file.path }.any?
      end
    end
  end
end