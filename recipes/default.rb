#
# Cookbook Name:: denyhosts
# Recipe:: default
#
# Copyright 2011-2013, Phil Cohen <github@phlippers.net>

package "denyhosts"

legacy_attrs = [
                "admin_email",
                "smtp_host",
                "smtp_port",
                "smtp_from",
                "secure_log",
                "lock_file",
                "purge_deny",
                "purge_threshold",
                "work_dir"
               ]

service "denyhosts" do
  supports :restart => true
  action [:enable, :start]
end

# We need to set the config attr's using values from the legacy attr's for
# backwards compatibility. This does not work as expected when overriding the
# legacy attr's since the overrides are evaluated afterwards. To get around
# this, we'll evaluate the values during the execution phase.
legacy_attrs.each do |a|
  unless node["denyhosts"]["config"][a]
    node.set["denyhosts"]["config"][a] = node["denyhosts"][a]
  end
end

# Generate config file from attribute hash
config_contents = node["denyhosts"]["config"].map{|k,v| "#{k.upcase} = #{v}"}.join("\n")
file "/etc/denyhosts.conf" do
  content config_contents
  owner  "root"
  group  "root"
  action :create
  notifies :restart, "service[denyhosts]", :immediately
end

directory node["denyhosts"]["config"]["work_dir"] do
  owner "root"
  group "root"
  mode  "0755"
  action :create
  recursive true
end

template ::File.join(node["denyhosts"]["config"]["work_dir"], "allowed-hosts") do
  source "allowed-hosts.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  action :create
  notifies :restart, "service[denyhosts]", :immediately
end
