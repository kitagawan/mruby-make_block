MRuby::Gem::Specification.new('mruby-make_block') do |spec|
  spec.license = 'MIT'
  spec.author  = 'Tetsuya'
  spec.summary = 'self-make-block'
  spec.add_dependency('mruby-generate-address', :github => 'kitagawan/mruby-generate-address')
  spec.add_dependency('mruby-sleep', :github => 'matsumoto-r/mruby-sleep')
end