name              'openresty'
maintainer        'Panagiotis Papadomitsos'
maintainer_email  'pj@ezgr.net'
license           'Apache 2.0'
description       'Installs and configures the OpenResty NGINX bundle'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md')).chomp
version           IO.read(File.join(File.dirname(__FILE__), 'VERSION')).chomp rescue '0.1.0'
chef_version      '>= 11.0' if respond_to?(:chef_version)
issues_url        'https://github.com/priestjim/chef-openresty/issues' if respond_to?(:issues_url)
source_url        'https://github.com/priestjim/chef-openresty' if respond_to?(:source_url)

recipe 'openresty', 'Installs the OpenResty NGINX bundle and sets up configuration with Debian apache style sites-enabled/sites-available'

%w{ ubuntu debian centos redhat amazon scientific oracle fedora suse opensuseleap }.each do |os|
  supports os
end

depends 'build-essential'
depends 'logrotate', '~> 2.0'
depends 'ohai', '~> 5.2.0'
depends 'yum'
depends 'apt'
depends 'git'
depends 'postgresql'
depends 'jemalloc'
depends 'systemd'
