Gem::Specification.new do |s|
  s.name = 'polyrex-builder'
  s.version = '0.1.0'
  s.summary = 'Builds a Polyrex structure from an array of Hash objects representing summary records.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/polyrex-builder.rb']
  s.add_runtime_dependency('rexle', '~> 1.4', '>=1.4.3')
  s.add_runtime_dependency('rexle-builder', '~> 0.3', '>=0.3.7')
  s.signing_key = '../privatekeys/polyrex-builder.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/polyrex-builder'
end
