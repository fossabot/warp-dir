task :default => [:rspec ]

task :install do
  [
    %q(chmod -R o+r .),
    %q(rm -f *.gem),
    %q(rm -rf build),
    %q(gem uninstall -a --executables warp-dir 2> /dev/null; true),
    %q(gem build warp-dir.gemspec)
  ].each do |command|
    sh command
  end
  sh <<-EOF
export gem_file=$(ls -1 *.gem | tail -1)
export gem_name=${gem_file//.gem/}
gem install $gem_file --no-wrappers --force --quiet
  EOF
  exit 0
end

require 'bundler'
require "bundler/gem_tasks"
require 'rake/clean'
require 'rspec/core/rake_task'
