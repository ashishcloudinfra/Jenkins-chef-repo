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
	def berks_update(directory)
	  #directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
	  Dir.foreach(directory) do |file|
	  	unless file == '.' || file == '..'
	  		unless File.exist?("#{directory}#{file}/Berksfile.lock")
	    	  system "cd #{directory}#{file} && berks update"
	    	end
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
end

