echo -e "\e[32m installing golang server \e[0m"
yum install golang -y
echo -e "\e[32m installing golang server \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[32m downloading new app contant ,dependencies and building software to dispatch \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
unzip dispatch.zip
go mod init dispatch
go get
go build
echo -e "\e[32m creating dispatch service file \e[0m"
cp /root/repo-shell/dispatch.service /etc/systemd/system/dispatch.service
echo -e "\e[32m enabling and starting the dispatch service \e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl restart dispatch