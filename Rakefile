# frozen_string_literal: true

require 'rspec/core/rake_task'

task default: :test

desc 'Tests'
task :test do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/*_spec.rb'
  end
  Rake::Task['spec'].execute
end
