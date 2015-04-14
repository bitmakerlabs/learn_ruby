# This Rakefile has all the right settings to run the tests inside each lab
require 'rake/testtask'

task :default => :test
Rake::TestTask.new do |t|
  project = Rake.application.original_dir
  t.libs << project
  t.pattern = "#{project}/test_*.rb"
  t.warning = true
  t.verbose = true
end
