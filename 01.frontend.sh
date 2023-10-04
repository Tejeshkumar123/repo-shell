echo -e "\e[32m INSTALLING NGINX SERVICE\e[0m"
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[32m REMOVING DEFAULT NGINX CONTENT\e[0m"
cd /usr/share/nginx/html
rm -rf *
echo -e  "\e[32m DOWNLOADING NEW CONTENT TO NGINX\e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log
unzip frontend.zip &>>/tmp/roboshop.log
rm -rf frontend.zip
echo -e  "\e[32mCONFIGURING REVERSE PROXY SERVER\e[0m"
cp /root/repo-shell/roboshop.conf  /etc/nginx/default.d/roboshop.conf
echo -e "\e[32m ENABLEING AND RESTARTING NGINX\e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx