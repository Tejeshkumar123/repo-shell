echo -e "\e[32m downloading rabbitmq repo file\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
echo -e "\e[32m installing rabbitmq server\e[0m"
yum install rabbitmq-server -y
echo -e "\e[32m enabling and starting rabbitmq service\e[0m"
systemctl enable rabbitmq-server
systemctl restart rabbitmq-server
echo -e "\e[32m adding user and seting permissions\e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"