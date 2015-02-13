module Riven
  class HTMLFile
    attr_accessor :file_name

    public def initialize(file_name)
      @file_name = file_name
    end

    public def write(content)
      File.open(@file_name, 'w') { |file| file.write(content) }
    end

    public def delete!
      File.delete @file_name
    end
  end
end