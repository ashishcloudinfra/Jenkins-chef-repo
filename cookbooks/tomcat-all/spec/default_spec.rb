require 'chefspec'
ChefSpec::Coverage.start!
require 'chefspec/berkshelf'

describe 'tomcat-all::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'creates a group with the default action' do
    expect(chef_run).to create_group('tomcat')
  end


 it 'creates a user with group' do
    expect(chef_run).to create_user('tomcat').with(group: 'tomcat')
  end

   it 'creates a template with /etc/logrotate.d/tomcat' do
    expect(chef_run).to create_template('/etc/logrotate.d/tomcat').with(
      user:   'tomcat',
      group:  'tomcat',
    )
  end


   it "creates a template with /opt/tomcat/conf/server.xml" do
    expect(chef_run).to create_template("/opt/tomcat/conf/server.xml").with(
      user:   'tomcat',
      group:  'tomcat',
    )
  end

   it "creates a template with /opt/tomcat/bin/setenv.sh" do
    expect(chef_run).to create_template("/opt/tomcat/bin/setenv.sh").with(
      user:   'tomcat',
      group:  'tomcat',
    )
  end



  it "creates a template with /etc/init.d/tomcat7" do
    expect(chef_run).to create_template("/etc/init.d/tomcat7").with(
      user:   'tomcat',
      group:  'tomcat',
    )
  end
  
  it "enables a tomcat7" do
    expect(chef_run).to enable_service("tomcat7")
  end

end
