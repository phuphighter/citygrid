require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "citygrid"
    gem.summary = %Q{Ruby wrapper for the CityGrid API}
    gem.description = %Q{Ruby wrapper for the CityGrid API}
    gem.email = "johnnyn@gmail.com"
    gem.homepage = "http://github.com/phuphighter/citygrid"
    gem.authors = ["Johnny Khai Nguyen"]
    
    gem.add_dependency('httparty', '>= 0.5.0')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the citygrid plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the citygrid plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Citygrid'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
