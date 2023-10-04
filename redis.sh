yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
Yum module list
yum module enable redis:remi-6.2 -y
echo -e "\e[32m installing the redis\e[0m"
yum install redis -y
echo -e "\e[32m changing the listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
echo -e "\e[32m enabling and restarting the redis\e[0m"
systemctl enable redis
systemctl restart redis