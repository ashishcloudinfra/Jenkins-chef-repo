# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ashishbilawne"
client_key               "#{current_dir}/ashishbilawne.pem"
validation_client_name   "ashishbdev-validator"
validation_key           "#{current_dir}/ashishbdev-validator.pem"
chef_server_url          "https://api.chef.io/organizations/ashishbdev"
cookbook_path            ["#{current_dir}/../cookbooks"]
