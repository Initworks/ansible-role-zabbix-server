#!/bin/bash
timescaledb-tune --quiet --yes
sudo -u postgres psql -c "create role {{dbuser}} with login password '{{dbpass}}';"
sudo -u postgres createdb -O {{dbname}} {{dbname}}
zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql {{dbname}}
echo "CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;" | sudo -u postgres psql {{dbname}}
cat /usr/share/doc/zabbix-server-pgsql*/timescaledb.sql | sudo -u zabbix psql {{dbname}}
touch /iw/setup
