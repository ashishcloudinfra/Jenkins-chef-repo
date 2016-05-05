#require 'foodcritic'
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
	  #directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
	  Dir.foreach(directory) do |file|
	  	unless file == '.' || file == '..'
	    	system "cd #{directory}#{file} && berks install"
		end
	  end
	end

	def berks_upload(directory)
	  #directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
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
	  #directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
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

	def kitchen_install(directory)
	  #directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
	  Dir.foreach(directory) do |file|
	  	unless file == '.' || file == '..'
	  		Dir.chdir("#{directory}#{file}")
	  		puts "(in #{Dir.pwd})"
	  		Kitchen.logger = Kitchen.default_file_logger
		    Kitchen::Config.new.instances.each do |instance|
		    instance.create()
		    #  system "pwd"
		  end
		end
	 end
end

