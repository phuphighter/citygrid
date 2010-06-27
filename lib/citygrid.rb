# Citygrid
require 'rubygems'
gem 'httparty'
require 'httparty'
require 'hashie'

directory = File.expand_path(File.dirname(__FILE__))

Hash.send :include, Hashie::HashExtensions

module Citygrid
  
  # create config/initializers/citygrid.rb
  # 
  # Citygrid.configure do |config|
  #   config.api_key = 'api_key'
  # end
  # client = Citygrid::Client.new
  #
  # or
  #
  # Citygrid.api_key = 'api_key'
  #
  # or
  #
  # Citygrid::Client.new(:api_key => 'api_key')
  
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key
  end
  
end

require File.join(directory, 'citygrid', 'client')
