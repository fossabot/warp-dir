# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'warp/dir/version'

Gem::Specification.new do |s|
  s.name          = 'warp-dir'
  s.license       = 'MIT'
  s.authors       = ['Konstantin Gredeskoul']
  s.email         = ['kig@reinvent.one']
  s.version       = Warp::Dir::VERSION
  s.summary       = %q{Warp-Dir (aka 'wd') replaces 'cd' and lets you instantly move between saved "warp points" and regular folders.}
  s.description   = %q{Warp-Dir is compatible (and inspired by) the popular 'wd' tool available as a ZSH module. This one is written in ruby and so it should work in any shell. Credits for the original zsh-only tool go to (https://github.com/mfaerevaag/wd).}
  s.homepage      = 'https://github.com/kigster/warp-dir'
  s.files         = `git ls-files`.split($\).reject{ |f| f.match(%r{^(doc|spec)/}) }

  s.executables   << 'warp-dir'
  s.bindir        = 'exe'

  s.post_install_message = ::Warp::Dir::INSTALL_NOTICE
  s.require_paths = %w(lib)

  s.required_ruby_version     = '>= 2.0.0'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_runtime_dependency('slop', '~> 4.2')

  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.5'
  s.add_development_dependency 'bundler', '~> 1.11'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.4'
end
