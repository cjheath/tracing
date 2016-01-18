# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tracing/version'

Gem::Specification.new do |spec|
  spec.name	     = "tracing"
  spec.version       = Tracing::VERSION
  spec.authors       = ["Clifford Heath"]
  spec.email         = ["clifford.heath@gmail.com"]
  spec.date = "2015-10-02"

  spec.summary = "A nested tracing API for user defined trace classes"
  spec.description   = %q{
Enable tracing by setting the TRACE environment variable to a list of the
names of trace classes you want to investigate. The enabled tracing is
generated in a nested format, with significant support for exceptions and
debugging.
}
  spec.homepage      = "https://github.com/cjheath/tracing"
  spec.license       = "MIT"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.add_development_dependency "bundler", ">= 1.10", "~> 1.10.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"

  spec.add_runtime_dependency(%q<ruby-debug>, ["~> 0"]) if RUBY_VERSION < "1.9"
  spec.add_runtime_dependency(%q<debugger>, ["~> 1"]) if RUBY_VERSION =~ /^1\.9/ or RUBY_VERSION =~ /^2\.0/
  spec.add_runtime_dependency(%q<byebug>, ["~> 1"]) if RUBY_VERSION =~ /^2\.1/
  # spec.add_development_dependency(%q<pry>, ["~> 0"]) # rbx, jruby
end

