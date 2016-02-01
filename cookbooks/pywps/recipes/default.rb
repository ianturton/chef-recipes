#
# Cookbook Name:: pywps
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'
include_recipe 'apache2::mod_python'
include_recipe 'gdal'
include_recipe 'grass'
include_recipe 'mapserver'
include_recipe 'R'

python_runtime 'pywps' do
    version '2.7'
    options pip_version: true
end

package 'python-lxml'

python_package 'shapely' 

url = 'https://github.com/geopython/PyWPS/archive/pywps-3.2.2.tar.gz'

pywps_name = ::File.basename("#{url}")
pywps_local_path = ::File.join("/usr/local",::File.basename(pywps_name,".tar.gz"))
pywps_local_name = ::File.join(Chef::Config[:file_cache_path],::File.basename(pywps_name))
pywps_tmp = ::File.join(Chef::Config[:file_cache_path],"pywps")

remote_file "#{pywps_local_name}" do
  source "#{url}"
  action :create_if_missing
  notifies :run, 'execute[install pywps]', :immediately
end

execute 'install pywps' do
    
    unpack = <<-EOF
      mkdir -p "#{pywps_local_path}"
      tar xf "#{pywps_local_name}" -C "#{pywps_local_path}" --strip-components=1 --no-same-owner
      cd "#{pywps_local_path}"
      python setup.py install
    EOF
    command unpack
end

template '/etc/pywps.cfg' do
  source 'pywps_config.erb'
  mode '0664'
end

execute 'deploy' do
  command "cp /usr/local/bin/wps.py /usr/lib/cgi-bin/wps.py"
end

template '/usr/lib/cgi-bin/wps-local.py' do
  source 'wrapper.erb'
  mode '0755'
end

