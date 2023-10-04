echo -e  "\e[32mDOWNLOADING MONGODB REPO\e[0m"
cp /root/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org -y
echo -e  "\e[32mCHANGING THE LISTEN ADDRESS\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo -e "\e[32m ENABLEING AND RESTARTING MONGODB SERVICE\e[0m"
systemctl enable mongod
systemctl restart mongod
