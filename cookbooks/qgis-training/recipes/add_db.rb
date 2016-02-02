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

postgresql_database_user 'pgis' do
  connection postgresql_connection_info
  username 'pgis'
  password 'astun'
  action :create
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

postgresql_database_user 'pgis' do
  connection postgresql_connection_info
  username 'pgis'
  database_name 'training'
  action :grant
  privileges [:all]
end

bash 'load' do
  code "pg_restore -C -d training trainingDB.backup -p #{node[:postgresql][:config][:port]} -U postgres"
  not_if "echo '\\dn'| psql -p #{node['postgresql']['config']['port']} -U postgres training| grep -c crime"
end
