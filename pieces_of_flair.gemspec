# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pieces_of_flair/version'

Gem::Specification.new do |spec|
  spec.name          = 'pieces_of_flair'
  spec.version       = PiecesOfFlair::VERSION
  spec.authors       = ['Tres Wong-Godfrey']
  spec.email         = ['tres@clean.io']

  spec.summary       = %q{pieces of flair will grab some ascii art }
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/tres/pieces_of_flair'
  

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib', 'db']

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'sqlite3'

end
