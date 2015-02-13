module Riven
  class Wkhtmltopdf
    class << self
      public def check_installation
        `wkhtmltopdf -V > /dev/null 2>&1`

        unless $?.exitstatus == 0
          puts "Seems like wkhtmltopdf is not correctly installed or set up"
          exit
        end
      end

      public def generate_pdf(html_file, output_file)
        output = `wkhtmltopdf #{html_file.file_name} #{output_file} 2>&1`
      end
    end
  end
end