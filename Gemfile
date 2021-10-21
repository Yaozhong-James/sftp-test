# frozen_string_literal: true

LOOKER_JRUBY_VERSION = File.read(File.join(File.dirname(__FILE__), '.ruby-version')).split('-').last.chomp
ruby "#{RUBY_VERSION}", engine: 'jruby', engine_version: LOOKER_JRUBY_VERSION
source "https://rubygems.org"

platforms :jruby do

  gem 'net-sftp', '2.1.2'
  gem 'net-ssh', '4.1.0'
  gem 'jruby-openssl', git: 'https://github.com/jruby/jruby-openssl.git', tag: 'v0.10.3'
end
