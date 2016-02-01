# copy over and unpack the other data sets
#
#
#



cookbook_file 'data.tgz' do
    source 'data.tgz'
end

bash 'unpack' do
  code "tar -C #{node[:data][:dest]} -xf data.tgz" 
end
