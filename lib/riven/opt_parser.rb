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

      public def files
        file_names = ARGV

        if file_names.size === 1 && File.directory?(file_names[0])
          file_names = Dir["#{file_names[0]}/*.md"].sort
        end

        file_names.map { |file| Riven::MarkupFile.new(file) }
      end


      #
      # Parses the options and returns a map with the options and their values.
      #

      public def options
        options = {
          output_file: '',
          cover_file: '',
          css_file: '',
          toc: false,
          dump_html: false
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

          opts.on("-d", "--dump-html", "Dumps the HTML file to STDOUT") do
            options[:dump_html] = true
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