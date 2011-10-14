require 'hirb'
Hirb::View.enable if defined?(Rails)
ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(Rails)
