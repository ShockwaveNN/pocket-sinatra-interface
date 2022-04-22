# frozen_string_literal: true

require 'simplecov'
SimpleCov.start
if ENV['CI']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../app/server.rb', __dir__

# Module for correct init of tests
module RSpecMixin
  include Rack::Test::Methods

  # @return [Sinatra::Application] this app
  def app
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }
