module Riven
  class Config
    attr_accessor \
      :pdf_output_file,
      :cover_file,
      :css_file,
      :generate_toc,
      :toc_headline,
      :dump_html,
      :dump_cover_html,
      :verbose,
      :dir_given,
      :config_file,
      :files


    #
    # Constructor with the default values
    #
    public def initialize
      @pdf_output_file = nil
      @cover_file = nil
      @css_file = nil
      @generate_toc = false
      @toc_headline = 'Contents'
      @dump_html = false
      @dump_cover_html = false
      @verbose = false
      @dir_given = false
      @config_file = nil
      @files = []
    end


    #
    # Overrides the value in the current config if the value of the other config is not the default value
    #
    public def merge(another_config)
      @pdf_output_file = another_config.pdf_output_file if another_config.pdf_output_file != nil
      @cover_file = another_config.cover_file           if another_config.cover_file != nil
      @css_file = another_config.css_file               if another_config.css_file != nil
      @generate_toc = another_config.generate_toc       if another_config.generate_toc != false
      @toc_headline = another_config.toc_headline       if another_config.toc_headline != 'Contents'
      @dump_html = another_config.dump_html             if another_config.dump_html != false
      @dump_cover_html = another_config.dump_cover_html if another_config.dump_cover_html != false
      @verbose = another_config.verbose                 if another_config.verbose != false
      @dir_given = another_config.dir_given             if another_config.dir_given != false
      @config_file = another_config.config_file         if another_config.config_file != nil
      @files = another_config.files                     if another_config.files != []
    end


    #
    # Prints the current config
    #
    public def print
      puts
      puts "Using config file #{config_file}" if config_file != nil
      puts
      puts 'Riven configuration:'
      puts "    - pdf_output_file: #{@pdf_output_file}"
      puts "    - cover_file:      #{@cover_file.path}"
      puts "    - css_file:        #{@css_file}"
      puts "    - generate_toc:    #{@generate_toc}"
      puts "    - toc_headline:    #{@toc_headline}"
      puts "    - dump_html:       #{@dump_html}"
      puts "    - dump_cover_html: #{@dump_cover_html}"
      puts "    - verbose:         #{@verbose}"
      puts "    - dir_given:       #{@dir_given}"
      puts "    - config_file:     #{@config_file}"

      puts '    - files:'

      @files.each do |file|
        puts "        - #{file.path}"
      end

      puts
    end


    #
    # Setter for @css_file
    #
    public def css_file=(file)
      @css_file = File.expand_path(file)
    end


    #
    # Setter for @cover_file
    #
    public def cover_file=(file)
      @cover_file = Riven::MarkupFile.new(file)
    end


    #
    # Setter for @files
    #
    public def files=(files)
      @files = files.map { |file| Riven::MarkupFile.new(file) }
    end


    #
    # Parses a riven config yml file and constructs a Config object
    #
    def self.parse(config_file)
      require 'yaml'
      config = Riven::Config.new
      config.config_file = config_file
      parsed = YAML::load(File.open(File.expand_path(config.config_file)))

      parsed.each do |key, value|
        config.send(:"#{key}=", value)
      end

      config
    end
  end
end