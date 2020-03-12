# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: :test

desc 'Tests'
task :test do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task['spec'].execute
end
