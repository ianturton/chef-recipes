#
# Cookbook Name:: postgis
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#add repo if needed 

apt_repository "ubuntuGIS" do
  uri "http://ppa.launchpad.net/ubuntugis/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "314DF160"
end

# install package

package 'postgis' 

include_recipe "database::postgresql"

service 'postgresql' do
  supports :restart => true
  action :nothing
  subscribes :reload, "template[#{node['postgresql']['dir']}/postgresql.conf]", :immediately
  subscribes :reload, "template[#{node['postgresql']['dir']}/pg_hba.conf]", :immediately
end

template "#{node['postgresql']['dir']}/postgresql.conf" do
  source 'postgresql.conf.erb'
  owner "postgres"
  group "postgres"
  mode 00600
end

template "#{node['postgresql']['dir']}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "postgres"
  group "postgres"
  mode 00600
end

service 'postgresql' do
  action :restart
end

execute "create_postgis_template" do
  user "postgres"
  command "createdb -E UTF8 #{node['postgis']['template_name']} -T template0"
  not_if "psql -qAt --list | grep '^#{node['postgis']['template_name']}\|'", user: "postgres"
  action :run
end

bash "assign-postgres-password" do
  user 'postgres'
  code <<-EOH
  echo "ALTER ROLE postgres ENCRYPTED PASSWORD \'#{node['postgresql']['password']['postgres']}\';" | psql -p #{node['postgresql']['config']['port']}
  EOH
  action :run
  not_if "ls #{node['postgresql']['config']['data_directory']}/recovery.conf"
  only_if { node['postgresql']['assign_postgres_password'] }
end
postgresql_database 'postgres' do
  connection(
    :host      => '127.0.0.1',
    :port      => node['postgresql']['config']['port'],
    :username  => 'postgres',
    :password  => node['postgresql']['password']['postgres']
  )
  action :create
end
