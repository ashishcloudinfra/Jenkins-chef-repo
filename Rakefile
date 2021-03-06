# require 'foodcritic'
require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'kitchen'

namespace :docs do
  desc "This task for berks install"
    task :do_berks_install do
      dir = ENV['DIR']
    berks_install(dir)
    end

  desc "This task for berks upload"
    task :do_berks_upload do
      dir = ENV['DIR']
    berks_upload(dir)
    end

  def berks_install(directory)
    # directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
    Dir.foreach(directory) do |file|
      unless file == '.' || file == '..'
        system "cd #{directory}#{file} && berks install"
    end
    end
  end

  def berks_upload(directory)
    # directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
    Dir.foreach(directory) do |file|
      unless file == '.' || file == '..'
        system "cd #{directory}#{file} && berks upload"
    end
    end
  end

  desc "This task for bundle install"
    task :do_bundle_install do
      dir = ENV['DIR']
    bundle_install(dir)
    end

  def bundle_install(directory)
    # directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
    Dir.foreach(directory) do |file|
      unless file == '.' || file == '..'
        puts "Name of cookbook is #{file}"
        system "cd #{directory}#{file} && bundle install"
    end
    end
  end

  desc 'Run Test Kitchen'
    task :do_kitchen_install do
      dir = ENV['DIR']
          kitchen_install(dir)
    end

  desc 'Run Rubocop'
    task :do_rubocop_run do
      dir = ENV['DIR']
          rubocop_command(dir)
    end

  desc 'Run Foodcritic'
    task :do_foodcritic_run do
      dir = ENV['DIR']
        foodcritic_command(dir)
    end

  def kitchen_install(directory)
    Dir.foreach(directory) do |file|
      unless file == '.' || file == '..'
        Dir.chdir("#{directory}#{file}")
        puts "(in #{Dir.pwd})"
        system ("bundle install")
        Kitchen.logger = Kitchen.default_file_logger
        Kitchen::Config.new.instances.each(&:converge)
      end
    end
   end

  def rubocop_command(directory)
    Dir.foreach(directory) do |file|
      unless file == '.' || file == '..'
        Dir.chdir("#{directory}#{file}")
        sh 'rubocop .'
      end
    end
   end

   def foodcritic_command(directory)
     Dir.foreach(directory) do |file|
       unless file == '.' || file == '..'
         Dir.chdir("#{directory}#{file}")
         sh 'foodcritic .'
        end
     end
   end
   desc "Run Foodcritic lint checks"
    FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
      t.options = { :fail_tags => ["any"] }
    end

  desc "Run RuboCop style and lint checks"
     RuboCop::RakeTask.new(:rubocop) do |t|
       t.options = ["-D"]
     end
end
