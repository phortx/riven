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

      public def generate_pdf(html_file, cover_html_file, output_file, options)
        params = [
          '--page-size A4',
          '--margin-bottom 20mm',
          '--margin-top 20mm',
          '--margin-left 30mm',
          '--margin-right 30mm',
          '--footer-left "[section]"',
          '--footer-right "[page] / [toPage]"',
          '--footer-font-size 7',
          '--footer-spacing 10'
        ]

        unless options[:cover_file] === ''
          params << "cover \"#{cover_html_file.file_name}\""
        end

        if options[:toc]
          xsl = File.read(File.expand_path(File.dirname(__FILE__)) + '/../../toc.xsl')
          xsl.gsub! '[[toc_headline]]', options[:toc_headline]
          xsl_file_name = '_tmp_toc.xsl'
          File.open(xsl_file_name, 'w') { |file| file.write(xsl) }

          params << 'toc'
          params << "--xsl-style-sheet \"#{xsl_file_name}\""
        end

        output = `wkhtmltopdf #{params.join(' ')} "#{html_file.file_name}" "#{output_file}" 2>&1`

        File.delete xsl_file_name

        return output
      end
    end
  end
end