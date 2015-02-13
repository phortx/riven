lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'riven/version'

Gem::Specification.new do |spec|
  spec.name          = 'riven'

  spec.version       = Riven::VERSION
  spec.date          = Time.now.strftime('%Y-%m-%d')

  spec.summary       = 'Converts Markdown to PDF'
  spec.description   = 'Converts GitHub Flavored Markdown to awesome looking PDFs! Featuring: ' +
                       'Syntax Highlighting, Custom CSS, Covers, Table of Contents and more'

  spec.authors       = ['Benjamin Kammerl']
  spec.email         = 'benny@itws.de'
  spec.homepage      = 'https://github.com/phortx/riven'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']


  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.4'


  spec.add_dependency 'redcarpet', '~> 3.2.2'
  spec.add_dependency 'coderay', '~> 1.1.0'
end