require 'rake'
require 'rake/rdoctask'
require 'rake/testtask'
require 'spec/rake/spectask'
require 'fileutils'
require 'rubygems'

MERB_ENV = ENV['MERB_ENV'] if ENV['MERB_ENV']
$RAKE_ENV = true

require File.dirname(__FILE__)+'/config/boot.rb'
require MERB_FRAMEWORK_ROOT+'/tasks'
MERB_ROOT = File.dirname(__FILE__)
include FileUtils

# Get Merb plugins and dependencies
require File.dirname(__FILE__)+'/config/dependencies.rb'
Merb::Plugins.rakefiles.each {|r| require r } 

#desc "Packages up Merb."
#task :default => [:package]

desc "load merb_init.rb"
task :merb_init do
  require 'merb'
  require File.dirname(__FILE__)+'/config/merb_init.rb'
end  

task :uninstall => [:clean] do
  sh %{sudo gem uninstall #{NAME}}
end

desc 'Run unit tests'
Rake::TestTask.new('test_unit') do |t|
  t.libs << 'test'
  t.pattern = 'test/unit/*_test.rb'
  t.verbose = true
end

desc 'Run functional tests'
Rake::TestTask.new('test_functional') do |t|
  t.libs << 'test'
  t.pattern = 'test/functional/*_test.rb'
  t.verbose = true
end

desc 'Run all tests'
Rake::TestTask.new('test') do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc "Run all specs"
Spec::Rake::SpecTask.new('specs') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
end

desc "Run all model specs"
Spec::Rake::SpecTask.new('model_specs') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = Dir['spec/models/**/*_spec.rb'].sort
end

desc "Run all controller specs"
Spec::Rake::SpecTask.new('controller_specs') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = Dir['spec/controllers/**/*_spec.rb'].sort
end

desc "Run a specific spec with TASK=xxxx"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.libs = ['lib', 'server/lib' ]
  t.spec_files = ["spec/merb/#{ENV['TASK']}_spec.rb"]
end

desc "Run all specs output html"
Spec::Rake::SpecTask.new('specs_html') do |t|
  t.spec_opts = ["--format", "html"]
  t.libs = ['lib', 'server/lib' ]
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
end

desc "RCov"
Spec::Rake::SpecTask.new('rcov') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
  t.libs = ['lib', 'server/lib' ]
  t.rcov = true
end

desc 'Run all tests, specs and finish with rcov'
task :aok do
  sh %{rake rcov}
  sh %{rake spec}
end

##############################################################################
# SVN
##############################################################################

desc "Add new files to subversion"
task :svn_add do
   system "svn status | grep '^\?' | sed -e 's/? *//' | sed -e 's/ /\ /g' | xargs svn add"
end
