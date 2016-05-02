namespace :docs do
	desc "This task for berks install"
	  task :do_berks_install do
	  berks_install
	end

	desc "This task for berks upload"
	  task :do_berks_upload do
	  berks_upload
	end

	def berks_install
	  directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
	  Dir.foreach(directory) do |file|
	  	unless file == '.' || file == '..'
	    	system "cd #{directory}#{file} && berks install"
		end
	  end
	end

	def berks_upload
	  directory = 'C:/Users/Bilawne/chef-delta-repo/chef-test-repo/cookbooks/'
	  Dir.foreach(directory) do |file|
	  	unless file == '.' || file == '..'
	    	system "cd #{directory}#{file} && berks upload"
		end
	  end
	end
end

