# Author:: Ashish Cloud (<joshua@opscode.com>)
# Author:: Ashish Infra (<codysandwith@gmail.com>)
# Cookbook Name:: tomcat-all
# Recipe:: set_tomcat_home
#
# Copyright 2013, Opscode, Inc.
#
ruby_block 'set-env-tomcat-home' do
  block do
    ENV['TOMCAT_HOME'] = node['tomcat-all']['tomcat_home']
  end
  not_if { ENV['TOMCAT_HOME'] == node['tomcat-all']['tomcat_home'] }
end

directory '/etc/profile.d' do
  mode 00755
end

file '/etc/profile.d/tomcat.sh' do
  content "export TOMCAT_HOME=#{node['tomcat-all']['tomcat_home']}"
  mode 00755
end

ruby_block 'Set TOMCAT_HOME in /etc/environment' do
  block do
    file = Chef::Util::FileEdit.new('/etc/environment')
    file.insert_line_if_no_match(/^TOMCAT_HOME=/, "JAVA_HOME=#{node['tomcat-all']['tomcat_home']}")
    file.search_file_replace_line(/^TOMCAT_HOME=/, "JAVA_HOME=#{node['tomcat-all']['tomcat_home']}")
    file.write_file
    only_if { node['tomcat-all']['set_etc_environment'] }
  end
end
