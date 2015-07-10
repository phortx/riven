require 'coderay'

module Riven
  module Markup

    # Class that contains data for a code block

    class CodeBlock
      attr_reader :id, :language, :code

      public def initialize(id, language, code)
        @id, @language, @code = id, language, code
      end

      # Returns the code with syntax highlightning
      # @return [String]

      public def highlighted
        if @language
          CodeRay.scan(@code, @language).div(tab_width: 4, css: :class)
        else
          CodeRay.scan(@code, :text).div(tab_width: 4, css: :class)
        end
      end
    end
  end
end
