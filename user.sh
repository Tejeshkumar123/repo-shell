echo -e "\e[32m DOWNLOADING NODEJS REPO FILE\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[32m INSTALLING NODEJS SERVER\e[0m"
yum install nodejs -y
echo -e "\e[32m ADDING USER AND LOCATION\e[0m"
useradd roboshop
mkdir /app
cd /app
curl -O https://roboshop-artifacts.s3.amazonaws.com/user.zip
unzip user.zip
rm -rf user.zip
echo -e "\e[32m installing the dependencies\e[0m"
npm install
echo -e "\e[32m creating user service file\e[0m"
cp /root/repo-shell/user.service /etc/systemd/system/user.service
echo -e "\e[32m downloading and installing mongod schema\e[0m"
cp /root/repo-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org-shell -y
mongo --host mongodb-dev.sindhu.cloud </app/schema/user.js
echo -e "\e[32m enabling and restarting the user service\e[0m"
systemctl daemon-reload
systemctl enable user
systemctl restart user