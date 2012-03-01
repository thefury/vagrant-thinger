
# postgres
PG=''
REPO=''
GID=209
REPO='deb http://backports.debian.org/debian-backports squeeze-backports main'


group "postgres" do
  gid GID
end

user "postgres" do
  shell '/bin/bash'
  comment 'PostgreSQL Server'
  home '/var/lib/pgsql/9.0'
  gid 'postgres'
  system true
  uid GID
  supports :manage_home => false
end

# TODO convert to file or template
bash "append postgres to sources" do
        user "root"
        code "echo '#{REPO}' >> /etc/apt/sources.list.d/backports.list"
end

bash "update apt" do
        user "root"
        code "apt-get update"
end

bash "install postgresql" do
        user "root"
        code "apt-get -y -t squeeze-backports install postgresql-9.0"
end

bash "start postgresql service" do
        user "root"
        code <<-eof
        update-rc.d postgresql defaults
        service postgresql restart
        eof
end
