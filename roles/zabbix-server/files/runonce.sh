timescaledb-tune --quiet --yes
sudo -u postgres createuser zabbix
sudo -u postgres createdb -O zabbix zabbix
zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix
echo "CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;" | sudo -u postgres psql zabbix
cat /usr/share/doc/zabbix-server-pgsql*/timescaledb.sql | sudo -u zabbix psql zabbix
touch /iw/setup
