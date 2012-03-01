
bash "update apt" do
  user "root"
  code "apt-get update"
end

%w(git-core).each do |p|
  package p
end

%w(libssl-dev libreadline-dev libxml2 libxml2-dev libxslt1-dev).each do |p|
  package p
end

bash "install rvm" do
  code "sudo bash -s stable < <(curl -sk https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )"
  not_if { File.exists? "/usr/local/rvm" } 
end

bash "set ruby version" do
  user "root"
  code "source '/usr/local/rvm/scripts/rvm';rvm install 1.9.2;rvm --default use 1.9.2"
  not_if "rvm list | grep '1.9.2' "
end

bash "add vagrant user to rvm group" do
  user "root"
  code "/usr/sbin/usermod -a -G rvm vagrant"
end

