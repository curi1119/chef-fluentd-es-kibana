#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'app' do
  password '$1$T1dHwm3i$jjTRduag8DXXbdLkYlPyl/'
  comment 'app user'
  group 'sudo'
  home '/home/app'
  shell '/bin/bash'
  supports manage_home: true
  action :create
end

# group 'admin' do
#   append true
#   members 'app'
#   action :modify
# end

directory "/home/app/.ssh/" do
  owner 'app'
  group 'app'
  mode 0755
end

[
 '/home/app/.bash_profile',
 '/home/app/.emacs',
 '/home/app/.bashrc'
].each do |file|
  cookbook_file file do
    owner 'app'
    group 'app'
    mode '0664'
  end
end

cookbook_file '/home/app/.ssh/authorized_keys' do
  source 'ssh/authorized_keys'
  mode '0600'
  owner 'app'
  group 'app'
end
# cookbook_file '/home/app/.ssh/id_rsa' do
#   source 'ssh/id_rsa'
#   mode '0600'
#   owner 'app'
#   group 'app'
# end
# cookbook_file '/home/app/.ssh/id_rsa.pub' do
#   source 'ssh/id_rsa.pub'
#   mode '0644'
#   owner 'app'
#   group 'app'
# end
# cookbook_file '/home/app/.ssh/config' do
#   source 'ssh/config'
#   mode '0644'
#   owner 'app'
#   group 'app'
# end
# cookbook_file '/home/app/.ssh/known_hosts' do
#   source 'ssh/known_hosts'
#   mode '0644'
#   owner 'app'
#   group 'app'
# end
