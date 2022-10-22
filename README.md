# serx-update
```
wget https://github.com/devyplk/serx-update/raw/main/serx-update.sh; chmod 777 serx-update.sh; ./serx-update.sh
```

#Tutorial 

Walkthrough and commands:

First, log in to Linode and get a server set up running Ubuntu 20.04 LTS


Check to see if you have any updates by running
```
sudo apt install && sudo apt upgrade -y
```

Next we need to install Docker by running
```
sudo apt install docker.io -y
```
If this command doesn't work, use the commands below
```
curl -fsSL https://get.docker.com -o get-docker.sh
```
```
sudo sh get-docker.sh
```

Next let's install docker-compose
```
sudo apt install docker-compose -y
```

Now we can move to the directory where we want to install Searx
```
cd /usr/local
```

Then install Searx using git
```
git clone https://github.com/searxng/searxng-docker.git
```

Verify that it copied correctly in to your current directory


Now change in to the new directory

Use the ll command to view the hidden files and make sure the .env file is there 


If you are using a public server you can adjust the content of the .env file

Now use nano to edit the file if you are using a public server and want to use a custom hostname or if you want to add an email so it can make you an SSL certificate. 

**If you do not have a custom hostname, put in your IP address in the "SEARX_HOSTNAME" field and leave the "LETSENCRYPT_EMAIL" commented out**

```
nano .env
```

Once you are done exit the file using Ctrl+X hit "Y" and then "Enter"


Run this command to generate a super secret key
```
sed -i "s|ultrasecretkey|$(openssl rand -hex 32) |g" searxng/settings.yml
```

Now to start SearX run this command
```
sudo docker-compose up -d
```

You should see the output below

Once you see this output, you are good to start up Searx!
```
sudo docker-compose up -d
```
Now throw your IP address in to your browser's address bar and you should be able to access your Searx search engine!

Then if you want to tear down your instance, you can either turn off the server or tear it down using this docker command.
```
sudo docker-compose down
```
