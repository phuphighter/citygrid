require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "citygrid"
    gem.summary = %Q{Ruby wrapper for the CityGrid API V2}
    gem.description = %Q{Ruby wrapper for the CityGrid API V2}
    gem.email = "johnnyn@gmail.com, jspooner@gmail.com"
    gem.homepage = "https://github.com/jspooner/citygrid"
    gem.authors = ["Johnny Khai Nguyen, Jonathan Spooner"]
    
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
