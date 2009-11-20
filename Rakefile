require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the godlike plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "godlike"
    gemspec.summary = "Feel godly after your tests"
    gemspec.description = "Announcers can be motivating"
    gemspec.email = "Adman1965@gmail.com"
    gemspec.homepage = "http://github.com/Adman65/godlike"
    gemspec.authors = ["Adam Hawkins"]
    Jeweler::GemcutterTasks.new
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end