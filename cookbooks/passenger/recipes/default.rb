#%w(libcurl4-openssl-dev libpq5 libpq-dev libapr1-dev libaprutil1-dev apache2-prefork-dev).each do |p|
#  package p
#end

#bash "install passenger" do
#  code "gem install passenger; passenger-install-apache2-module -a"
#end

package "libapache2-mod-passenger"

bash "enable passenger modules" do
  user "root"
  code "/usr/sbin/a2enmod passenger"
end

template "passenger.conf" do
  path "/etc/apache2/mods-available/passenger.conf"
  source "passenger.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "passenger.load" do
  path "/etc/apache2/mods-available/passenger.load"
  source "passwenger.load.erb"
  owner "root"
  group "root"
  mode 0644
end
