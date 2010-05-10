Gem::Specification.new do |s|
  s.name             = "tweet_utils"
  s.version          = "0.1"
  s.platform         = Gem::Platform::RUBY

  s.summary          = "utilities for processing twitter data"
  s.description      = "various utilities handling twitter api results"

  s.author           = "Mat Kelcey"
  s.homepage         = "http://github.com/matpalm/tweet_utils"
  s.email            = "matthew.kelcey@gmail.com"

  s.required_ruby_version = ">= 1.8.7"
  s.files            = Dir["lib/**/*"]
  s.require_path     = "lib"
  s.has_rdoc         = false
end