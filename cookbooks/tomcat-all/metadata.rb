name             'tomcat-all'
maintainer       'Ashish Cloud'
maintainer_email 'ashish.cloud.infra@gmail.com'
license          'All rights reserved'
description      'Installs/Configures tomcat'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.1'

depends 'ark', '~> 0.9.0'
depends 'java', '~> 1.31.0'
depends 'apt', '~> 2.4.0'

supports 'ubuntu'
supports 'centos', '>= 6.4'
supports 'redhat', '>= 6.4'
