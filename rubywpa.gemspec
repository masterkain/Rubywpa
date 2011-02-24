# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rubywpa/version"

Gem::Specification.new do |s|
  s.name        = "rubywpa"
  s.version     = Rubywpa::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Claudio Poli"]
  s.email       = ["masterkain@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Find out if your WiFi is subsceptible to standard passwords}
  s.description = %q{SSID-to-WPA verifier for supported networks}

  s.rubyforge_project = "rubywpa"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
