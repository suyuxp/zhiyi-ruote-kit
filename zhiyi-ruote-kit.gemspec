# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zhiyi/ruote/kit/version'

Gem::Specification.new do |spec|
  spec.name          = "zhiyi-ruote-kit"
  spec.version       = Zhiyi::Ruote::Kit::VERSION
  spec.authors       = ["suyuxp"]
  spec.email         = ["suyu@zhiyisoft.com"]
  spec.description   = %q{简化项目中的Ruote工作流引擎的使用，一些配套的基础设施}
  spec.summary       = %q{Ruote配套}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruote"
  spec.add_dependency "ruote-redis"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
