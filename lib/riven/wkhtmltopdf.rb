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

      public def generate_pdf(html_file, output_file, options)
        params = [
          '--page-size A4',
          '--margin-bottom 10mm',
          '--margin-top 10mm',
          '--margin-left 20mm',
          '--margin-right 20mm',
          '--footer-left "[section]"',
          '--footer-right "[page] / [toPage]"',
          '--footer-font-size 7',
          '--footer-spacing 4'
        ]

        if options[:toc]
          xsl = File.read(File.expand_path(File.dirname(__FILE__)) + '/../../toc.xsl')
          xsl.gsub! '[[toc_headline]]', options[:toc_headline]
          xsl_file_name = '_tmp_toc.xsl'
          File.open(xsl_file_name, 'w') { |file| file.write(xsl) }

          params << 'toc'
          params << "--xsl-style-sheet \"#{xsl_file_name}\""
        end

        output = `wkhtmltopdf #{params.join(' ')} #{html_file.file_name} #{output_file} 2>&1`

        File.delete xsl_file_name
      end
    end
  end
end