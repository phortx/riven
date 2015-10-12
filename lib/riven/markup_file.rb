module Riven
  #
  # Represents a MD File
  #

  class MarkupFile
    attr_reader :path, :dirname, :markup


    #
    # Constructor
    # Also checks if the file exists. If not, an exception will be thrown.
    #

    public def initialize(path)
      @path = File.expand_path(path)
      @dirname = Pathname.new(path).dirname

      unless File.exists?(@path)
        raise "File '#{path}' doesn't exist"
      end

      if File.directory?(@path)
        raise "Mixing files and directories is not allowed, sorry"
      end

      puts "Loading file: " + path
      @markup = "\n" + File.read(@path)
      resolve_includes
    end

    #
    # Recursive replace all includes with their respective file content
    #
    
    public def resolve_includes
      loop do
        non_found = true

        @markup.gsub!(/<<\[\s*([^\]\s]+)\s*\]/) do |inc|
          non_found = false
          MarkupFile.new(@dirname + $1).markup
        end

        break if non_found
      end
    end


    class << self
      public def read_all(markup_files, except = [])
        markup = ''

        markup_files = [markup_files] unless markup_files.respond_to?(:each)
        except = [except] unless except.respond_to?(:each)

        markup_files.each do |file|
          unless exclude?(except, file)
            markup << "\n" + file.markup
          end
        end

        return markup
      end

      public def read_cover(cover_file)
        cover_markup =  "\n////[COVERSTART]////\n"
        cover_markup << Riven::MarkupFile.read_all(cover_file)
        cover_markup << "\n////[COVEREND]////\n"
      end

      private def exclude?(except, file)
        except.select { |f| f != '' && f.path === file.path }.any?
      end
    end
  end
end
