require 'optparse'
require 'riven'
require 'riven/config'
require 'riven/markup_file'

module Riven
  #
  # Utility class to parse the options and files passed to the riven command
  #

  class OptParser
    class << self
      #
      # Sets the files field of the Config object
      #

      public def get_files(config)
        file_names = ARGV

        if file_names.size === 1 && File.directory?(file_names[0])
          config.dir_given = file_names.first
          file_names = Dir["#{file_names[0]}/*.md"].sort
        elsif file_names.size > 0
          config.files = file_names.map { |file| Riven::MarkupFile.new(file) }
        end
      end


      #
      # Parses the options and the config file if any and returns the Config object
      #

      public def get_config
        config = Riven::Config.new

        opt_parser = OptionParser.new do |opts|
          opts.banner = 'Usage: riven [OPTIONS] Markdown Files'
          opts.separator ''
          opts.separator 'Options'

          opts.on('-C FILE', '--config=FILE', 'Path to the riven config file') do |config_file|
            current_config = config
            config = Riven::Config.parse(config_file)
            config.merge(current_config)
          end

          opts.on('-o FILE', '--output=FILE', 'File name of the output PDF file') do |pdf_output_file|
            config.pdf_output_file = pdf_output_file
          end

          opts.on('-s FILE', '--css=FILE', 'Path to the custom CSS file') do |css_file|
            config.css_file = css_file
          end

          opts.on('-c FILE', '--cover=FILE', 'Path to the cover MD file') do |cover_file|
            config.cover_file = cover_file
          end

          opts.on('-t HEADLINE', '--toc=HEADLINE', 'Enabled the table of contents auto generation') do |headline|
            config.generate_toc = true
            config.toc_headline = headline
          end

          opts.on('-d', '--dump-html', 'Dumps the main HTML file to STDOUT') do
            config.dump_html = true
          end

          opts.on('-D', '--dump-cover-html', 'Dumps the cover HTML file to STDOUT') do
            config.dump_cover_html = true
          end

          opts.on('-v', '--verbose', 'Print the output of wkhtmltopdf to STDOUT. Don\'t combine with -d') do
            config.verbose = true
          end

          opts.on('-V', '--version', 'Displays the version') do
            require 'riven/version'
            puts Riven::VERSION.to_s
            exit
          end
        end

        opt_parser.parse!


        # Load default config if necessary

        default_config_file = 'riven.yml'

        if config.config_file == nil && File.exist?(default_config_file)
          current_config = config
          config = Riven::Config.parse(default_config_file)
          config.merge(current_config)
        end


        # Determine which files should be used
        get_files(config)

        # Print current config in verbose mode
        config.print if config.verbose

        config
      end
    end
  end
end
