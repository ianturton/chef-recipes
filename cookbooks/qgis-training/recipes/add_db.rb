# Install the training data into PostGIS
#
#

include_recipe "database::postgresql"

cookbook_file 'trainingDB.backup' do
  source 'trainingDB.backup'
end

postgresql_connection_info = {:host => "127.0.0.1",
                              :port => node['postgresql']['config']['port'],
                              :username => 'postgres',
                              :password => node['postgresql']['password']['postgres']
                            }

pgis_connection_info = {:host => "127.0.0.1",
        :port => node['postgresql']['config']['port'],
        :username => 'pgis',
        :password => node['postgresql']['password']['pgis']
       }

postgresql_database 'training' do
  connection postgresql_connection_info
  sql "CREATE ROLE pgis LOGIN SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION PASSWORD '#{node['postgresql']['password']['pgis']}';"
  action :query
  not_if "echo '\\dg'| psql -p #{node['postgresql']['config']['port']} -U postgres training| grep -c pgis"
end

postgresql_database 'training' do
  connection postgresql_connection_info
  action :create
end
postgresql_database 'training' do
  connection postgresql_connection_info
  sql 'CREATE EXTENSION postgis;'
  action :query
  not_if "echo '\\dx'| psql -p #{node['postgresql']['config']['port']} -U postgres training| grep -c postgis"
end


bash 'load' do
  code "pg_restore -C -d training trainingDB.backup -O -p #{node[:postgresql][:config][:port]} -U postgres"
  not_if "echo '\\dn'| psql -p #{node['postgresql']['config']['port']} -U postgres training| grep -c crime"
  ignore_failure true
end

# grant all privileges on all tables in foo db
postgresql_database_user 'pgis' do
  connection postgresql_connection_info
  database_name 'training'
  privileges [:all]
  action :grant
end
