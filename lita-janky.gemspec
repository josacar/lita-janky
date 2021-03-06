Gem::Specification.new do |spec|
  spec.name          = 'lita-janky'
  spec.version       = '0.0.1'
  spec.authors       = ['Jose Luis Salas']
  spec.email         = ['josacar@gmail.com']
  spec.description   = "Lita handler for GitHub's Janky"
  spec.summary       = "Lita handler for GitHub's Janky"
  spec.homepage      = 'https://github.com/josacar/lita-janky'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.3'
  spec.add_runtime_dependency 'faraday', '>= 0.8.7'

  spec.add_development_dependency 'bundler', '>= 2.2.10'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
end
