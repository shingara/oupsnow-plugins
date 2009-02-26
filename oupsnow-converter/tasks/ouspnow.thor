$: << File.join("doc")
require 'rubygems'
require 'rdoc/rdoc'
require 'fileutils'
require 'erb'

module OupsNow

  class Converter < Thor

    desc 'convert_from_redmine', 'convert from Redmine'
    def convert_from_redmine
      require 'merb-core'
      ::Merb.start_environment(
        :environment => ENV['MERB_ENV'] || 'development')
      ::Merb::Orms::DataMapper.setup_connections
      require File.join(File.dirname(__FILE__), '..', 'redmine.rb')
      RedmineConverter.convert
    end
  end
end
