require 'optparse'
require 'riven'
require 'riven/markup_file'

module Riven
  #
  # Utility class to parse the options and files passed to the riven command
  #

  class OptParser
    class << self
      #
      # Returns an array of Riven::MarkupFile for each given markdown file
      #
      # TODO handle directories
      #

      public def files
        ARGV.map { |file| Riven::MarkupFile.new(file) }
      end


      #
      # Parses the options and returns a map with the options and their values.
      #

      public def options
        options = {
          output_file: '',
          cover_file: '',
          css_file: '',
          toc: false
        }

        opt_parser = OptionParser.new do |opts|
          opts.banner = 'Usage: riven [OPTIONS] Markdown Files'
          opts.separator ''
          opts.separator 'Options'

          opts.on("-o FILE", "--output=FILE", "File name of the output PDF file") do |output_file|
            options[:output_file] = output_file
          end

          opts.on("-s FILE", "--css=FILE", "Path to the custom CSS file") do |css_file|
            options[:css_file] = css_file
          end

          opts.on("-c FILE", "--cover=FILE", "Path to the cover MD file") do |cover_file|
            options[:cover_file] = cover_file
          end

          opts.on("-t", "--toc", "Enabled the table of contents auto generation") do
            options[:toc] = true
          end

          opts.on('-V', '--version', 'Displays the version') do
            puts Riven::VERSION.to_s
            exit
          end
        end

        opt_parser.parse!

        return options
      end
    end
  end
end