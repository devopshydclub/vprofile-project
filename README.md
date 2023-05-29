# Prerequisites
#
- JDK 1.8 or later
- Maven 3 or later
- MySQL 5.6 or later
- AWS account
- Domain Name (Route53 or GoDaddy)

# Pricing
You may be charged for the domain name. But most of the service used is comes under free-tier

# Technologies 
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL
# Database
Here,we used Mysql DB 
MSQL DB Installation Steps for Linux ubuntu 14.04:
- $ sudo apt-get update
- $ sudo apt-get install mysql-server

Then look for the file :
- /src/main/resources/accountsdb
- accountsdb.sql file is a mysql dump file.we have to import this dump to mysql db server
- > mysql -u <us**
Step 1**er_name> -p accounts < accountsdb.sql

# Let's Start
## Project Name
### Lift & Shift

## **Step 1**
### **Create Security Group for the Load balancer**
- Add HTTP and HTTPS inbound rules.

To create Security group follow the below steps;
Go to AWS management console and search EC2

<img width="535" alt="image" src="https://github.com/Fawazcp/aws-project/assets/111639918/ff037940-cf11-41f8-be33-5cd2dc17d587">

Select the default VPC and add HTTP and HTTPS inbound rule then click on create.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/f02a637f-6a81-4f78-a2a5-7f89c6561aac)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/979ac687-6022-4aed-babf-16e8e167554d)

**Next we need to create another security group for the TomCat instance**

- Add inbound rule Port 8080 allow from the load balancer security group

![image](https://github.com/Fawazcp/aws-project/assets/111639918/1aa41380-9e43-4ce6-bc35-80167cb385ec)

- Drag and dropdown to select the security group we created for load balancer.
-	Under outbound rule leave as default and click on create security group

**Create one more security group for backend services (RabbitMQ,memcahed and Mysql)**

![image](https://github.com/Fawazcp/aws-project/assets/111639918/42606a58-82c3-4383-baca-83a49361e193)

- Here we need to add 3 inbound rules for MySQL (3306), RabbitMq (5672) and memcached (11211) allow traffic from the tomcat server SG
- Select the load balancer security group for this as well.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/074763fb-24c2-47c4-bc36-cbade1500846)

**Click on create security group and open the security group again. Because we want to add one more inbound rule All traffic from the same security group**

![image](https://github.com/Fawazcp/aws-project/assets/111639918/59162da6-7ea4-43a2-a042-dcba80adf702)

Click on the hyperlink of the security group it will open the security group again
Click on Edit inbound rules

![image](https://github.com/Fawazcp/aws-project/assets/111639918/c0afb95c-b912-4896-9336-b4ebd6c4f9fa)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/b569be8d-ab1b-4ff2-9fe4-66818e02614a)

- add new inbound rule All traffic and select the same security group ID then click on save.

## Step 2
### Create key pair

**In the EC2 console under Network & security click on Key pairs and again click on  create key pairs.**

![image](https://github.com/Fawazcp/aws-project/assets/111639918/8e0222bf-4841-4fed-a6f9-5cd7b15fb304)

- You can choose .ppk extension if you want to connect the instance using putty otherwise select .pem

![image](https://github.com/Fawazcp/aws-project/assets/111639918/7c67be33-ee1a-430c-a242-5411ffc5b741)

## Step 3
### Create EC2 Instances

Before creating the EC2 instance we need to clone GitHub repo for this project source code.
To clone the github repo enter the below command in you GitBash terminal

```
git clone https://github.com/devopshydclub/vprofile-project.git
```

- Switch branch to aws-LiftAndShift (here is our userdata scripts saved for this project)
To switch branch enter the below command

```
git checkout aws-LiftAndShift
```
![image](https://github.com/Fawazcp/aws-project/assets/111639918/7812a3df-f0db-485c-b765-58f4621a532b)

If you want to see the userdata then Open each and every files using vscode or sublime editor and go through with the scripts

**Task 1**

Launch MySql instance with user-data script
- Name the instance as db-server 
- Select the AMI as CentOS
- Select the key pair we created
-  Under security group select the backend security group
- Add user-data


Go to EC2 console and click on launch instance

![image](https://github.com/Fawazcp/aws-project/assets/111639918/76711a5a-5625-4a80-93da-8d6fa0af26f7)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/cc00a4d0-98ef-451c-bf11-a5ce4f71243e)

Click on Browse more AMIs  AWS marketplace AMI search for CentOS 7 and select the AMI as you see below;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/48e35b68-6e6e-44c6-bf15-3a41292dc76d)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/a72f6015-28ab-456c-a0b1-fb681717018c)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/eebbf325-6a80-4f15-95fd-13dfcaf7b93a)

-	Select the key pair we created.
Under security group click on existing security group and select the backend sg

![image](https://github.com/Fawazcp/aws-project/assets/111639918/7876eeb4-a90e-4173-b08f-7067e2989a97)

Expand advanced details and drop down towards user-data

![image](https://github.com/Fawazcp/aws-project/assets/111639918/a4a65fbd-bc2f-4240-9800-2870e2294638)

To get the user-data click on the link below
https://github.com/Fawazcp/aws_project_lift-shift/tree/main/MySQL

Wait for sometime to get the instance up and running because we have added the user-data to provision the mysql databse.
-	Go to security group of this instance and add port 22 (SSH) from MyIP

![image](https://github.com/Fawazcp/aws-project/assets/111639918/1dd595b7-08a7-4649-8db0-14f920eb9546)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/4c6c14eb-3f3c-441a-959d-a898efef8c4b)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/71637ab6-2d09-44f4-b812-1f67b567c708)

To login to the machine using gitbash follow the below steps;
-	Go to the file where you have downloaded the key.
-	ssh  -i Prod_key.pem centos@publicIP of the ec2 instance


![image](https://github.com/Fawazcp/aws-project/assets/111639918/7f22a772-36a8-4e12-8648-4c3412988acc)

Now we logged in to our database server in gitbash

![image](https://github.com/Fawazcp/aws-project/assets/111639918/4302b685-0f34-4f81-8a54-1647c44be19c)

Now we can see the mariadb service is active
Next we can try to login to the mysql database
To login enter the below command;

```
mysql  -u root –p
```
Enter the password as admin123

![image](https://github.com/Fawazcp/aws-project/assets/111639918/69b5ecda-c839-4290-8ca9-d299c42d2415)

And we can see the database is provisioned as we expected

Use this command to exit from the database.

```
exit;
```

**Task 2**

Provision the other backend service (memcahed)

-	Create new instance named mc-server

Follow the same steps we used for creating the Mysql server but this time add the below user-data script.

Click on the link to get the user-data
https://github.com/Fawazcp/aws_project_lift-shift/blob/main/Memcached/user-data.sh
Add this user-data and click on launch instance

![image](https://github.com/Fawazcp/aws-project/assets/111639918/033d43b2-4779-4a56-9362-80d793dd8ecb)

Wait for sometime to get the instance up and running
Meanwhile we can set our next backend server


**Task 3**

Create rabbitmq server
-	Create an instance and name it rmq-server
-	Follow the same steps as we did for last 2 ec2 instance but make sure that add the below user-data.
Click on the link to get the user-data;
https://github.com/Fawazcp/aws_project_lift-shift/blob/main/rabbitmq/user-data.sh
Add this user-data and click on launch instance.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/d572383c-7e5b-4385-a724-b6ac6e627b16)

After sometime we must have 3 backend servers are up and running (mysql, memcached and rabbitmq)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/fd7b22e6-f549-4cd1-8a49-e61db74525c4)

**Task 4**

Login to memcached and rabbitmq server.
First we can log in to memcached server.
-	Copy the public IP of mc-server and follow the below steps;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/9ff13977-757e-472c-aee8-245d39c1cae2)

The memcached service is active
-	Exit from this server and log in to rabbitmq server to verify everthing is provisioned as we expected.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/260b85b4-80a0-4413-bc80-c06ffd018ab4)

Now we have our rabbitmq is also active.

**Task 5**

Update private of backend server (database, rabbitmq and memcached) in to Route53 private DNS zones.
-	Copy the Private IP of each machines and paste it in the nodtepad or any text editor

![image](https://github.com/Fawazcp/aws-project/assets/111639918/83e1ad44-f002-4e02-a444-c82a8c081e24)

These are private IP of my all three instances. To get this IP refer the below image

![image](https://github.com/Fawazcp/aws-project/assets/111639918/a4440aea-04ad-4ca6-9ef3-a2ec707fba9f)

Select each instance individually then copy the private IP and paste It in notepad or any text editor.
-	Go to route53 and follow the below steps;


![image](https://github.com/Fawazcp/aws-project/assets/111639918/d85889a5-96e2-45d2-adcc-bda08544b739)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/fb3000af-88de-464a-8852-d7d45b9cfc75)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/15cccd49-5364-45e3-b7fb-7c2207636d6a)

Select the region where you created all the ec2 instances. I have created in us-east-1 so selected that region and the vpc I used to create the instance.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/ba16e9c2-4620-43c6-95e5-727a989e9902)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/5b508c56-ce0b-4f90-bc55-4701aaa525ce)

Once you create a hosted by default you can see 2 records has been created.
-	Create new simple routing policy record.
To create follow the below steps;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/d9431ceb-03b0-4624-b8f3-14864a02f92d)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/876fd6b9-d371-4686-97ae-af58e151ec47)

Make sure to paste the db-server private IP under value.
Do the same for other 2 instances as well

![image](https://github.com/Fawazcp/aws-project/assets/111639918/16bbcd41-e997-4e2e-a040-1cf51de6ec2e)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/eee0c22b-64da-4de1-b06a-439439651223)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/24feeba7-d76c-4bf3-a3d7-c1b553ab0adc)

Now we have domain name rather than a IP address in each instance.

**Task 6**

Launch the frontend application server (Tomcat)
-	Go to EC2 and click on launch instance and follow the below steps;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/429ffa23-3615-4ebc-a61b-cf3f5b26e2bb)

Make sure to select the same AMI you see above.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/d0d2d231-db55-4364-a868-dcba88ce3389)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/ae95124c-cd00-4fac-b359-ac92c8e9568c)

Scroll down to the bottom and add the user-data

To get the user-data click on the link below;
https://github.com/Fawazcp/aws_project_lift-shift/blob/main/Tomcat/user-data.sh

![image](https://github.com/Fawazcp/aws-project/assets/111639918/194c7421-7bf9-4cd3-96b2-e4bb91e83c71)

Add the user-data and click on launch instance
After some time we can see our application server (tomcat) is up and running .
-	Log in to the tomcat server and verify it is provisioned as we expected.
We get some error says connection timeout or something. It is because in the security group we haven’t added SSH port 22.
-	Go to security group and add inboud rule SSH from MY IP.
-	Now try again and we are able to log in.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/b5713770-ba45-4ca3-9f67-fedde54beda0)

-	Exit from the instance

## Step 4
### Build and Deploy Artifacts

**Task 1**

In order to deploy artifacts we need to install some tools
-	jdk8  (dependency for maven)
-	maven
-	awscli (we use this to upload the artifacts to the s3 bucket)
To install the above tools in windows follow the below steps
Open the windows powershell as administrator nd enter the below command to install the tools
-	choco install jdk8 –y
-	choco install maven –y
-	choco install awscli –y

![image](https://github.com/Fawazcp/aws-project/assets/111639918/13b79d06-d487-4a4f-88d6-e89ab982f7d3)

To verfiy the packages installed;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/b80ba56e-e7e6-46b7-9da2-9fe0e3bece14)

**Task 2**

Go to the repo that we cloned.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/0bdb7047-98cb-4cd1-8c34-f54b90feac2d)


<img width="472" alt="image" src="https://github.com/Fawazcp/aws-project/assets/111639918/44ae03cc-3982-42d7-867b-37053fcbd1dc">

Make the above changes as per the DNS record you created and save the file

![image](https://github.com/Fawazcp/aws-project/assets/111639918/d5adf021-ad72-4573-bbcc-8971bde069b1)

This is the one we created the record for each server that I mentioned in the application.properties file.
Now this time generate our artifact.

-	Go back to the vprofile-project directory and enter the below command.
-	mvn install 

![image](https://github.com/Fawazcp/aws-project/assets/111639918/58af0a38-bfba-47d0-bf4f-b5a77d384d07)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/d9e3481b-c04c-4e95-bee2-13e8d942251b)

Make sure pom.xml file is there and after some time we can see the artifact bulid success

![image](https://github.com/Fawazcp/aws-project/assets/111639918/2b388995-0eae-4030-aca0-f5db471c3f0c)

And now we can see a new directory named target has been created.

**Task 3**

Store the vprofile-v2.war file in to our s3 bucket.
We will upload this file to s3 bucket using aws cli. In order to login to aws cli we need to have IAM user credentials.
-	Create IAM User.
To create an IAM user follow the below steps;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/c5b863a3-58a4-45f0-b1fe-c8d839252976)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/ca01a3fe-eb58-406f-88db-3f4efd2db85e)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/ac43a79e-0658-4544-ac8e-e77004dd6be4)

Now the user has been created and we need to create an access key for this user in order to log in to the aws cli
-	Click on the user name -->Security credentials --> Create access key.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/a140f988-a6b1-4254-883a-8ba3c708a8c4)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/88c726ae-bcd9-44e2-b9e4-aeee7ab2d900)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/8b8dc9c6-539c-4161-82a7-4863020cf636)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/98afc248-68c3-46e4-a394-a9b9f892bf7c)

Make sure to download the .csv file at the same time when you create the access key otherwise you can’t download afterwards. 
Also don’t share your access key and creditials to anybody

**Task 4**

Log in to the aws cli.
Go to gitbash and follow the below steps;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/d4c5a8d2-357b-4b21-9986-19b1adf28d8b)

Copy and paste the access key and secret key 
-	Enter the region where you have created the EC2 instances.
-	Out format you can leave or enter json.
Now let’s create a new s3 bucket.  Make sure you should give unique bucket name otherwise you will get some error.
To create an s3 bucket using aws cli enter the below command.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/d19ef79a-2239-46c9-867f-73b0659d9a78)

Now we have created a new bucket in the us-east-1 region.
Next we need to copy the artifact file in to s3 bucket from the target directory.
Follow the below steps to copy the file.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/eb13a88f-892e-464b-afe8-ca690232d079)

Now we have copied the artifact to the s3 bucket.
In order to download this artifact in the Tomcat instance we need to create a role.

**Task 5**

Create role
We need to create a role for our tomcat instance in order to download the files from the s3 bucket.
Follow the steps to create a role.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/c302a3ae-a82f-4ca7-9cfb-497689b0a489)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/86e56f76-d106-40ab-ab21-d0ab227fa289)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/8c233e79-fd17-48cc-a3d1-d599d8958175)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/9c590154-c717-44cc-9131-6492640cebe5)

Once the role has been created we need to attach this role in to our app server (tomcat)
-	Go to EC2 instance and follow the below steps.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/eaa51fee-3a73-4bb9-acaf-3f6acb1896a0)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/249fe8e3-38be-4964-8bd6-99c9363c3025)

Connect the tomcat instance using gitbash
-	sudo -i 
-	apt update -y
-	apt install awscli -y
-	aws s3 ls  s3://aws-project-artifact-storage1 


![image](https://github.com/Fawazcp/aws-project/assets/111639918/3da7dab7-89c8-4e0b-87aa-ca5be614f8bb)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/382ad446-5096-420a-b30e-0550723867b7)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/0cd5ca18-73fb-49ba-8918-693d1f86284e)

We are able to access the s3 bucket from the application server (tomcat instance).
Copy the artifact file in to this ec2 instance
-	aws s3 cp s3://aws-project-artifact-storage1/aws-project.war /tmp/aws-project.war 
(copy the file from s3 to /tmp directory)
In order to delpoy this code we need to stop our application (tomcat) which is running in the server. To shutdown application enter the below command
-	systemctl stop tomcat9
-	cd /var/lib/tomcat9/webapps/
-	ls
-	rm -rf ROOT
-	cp /tmp/aws-project.war ./ROOT.war  (copying the artifact in the current directory with ROOT.war name file)
-	systemctl start tomcat9 (wait for few minutes)
-	ls

![image](https://github.com/Fawazcp/aws-project/assets/111639918/5c5ba5bd-735d-48fe-957c-f5afc6963620)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/e9026ea4-f14d-4141-9067-b15992e2abe3)

Validate  the application.properties file that everything is correct as we mentioned especially the hostname.

In order to validate our tomcat instance can connect to other instance we use a software called telnet
Telnet we are using to check the connectivity.
-	apt install telnet –y

![image](https://github.com/Fawazcp/aws-project/assets/111639918/9665333d-c1ca-4b91-85b3-4e6e854e9bb8)

As we can see the telnet is already installed in the ubuntu machine

If you are not able to connect the instance using telnet then go to backend instance security group and make sure that tomcat secuity group has been selected under source.

![image](https://github.com/Fawazcp/aws-project/assets/111639918/93fd1b74-899c-42c6-9a79-34489790ef20)

To close the telnet session use the below commad
-	cntrl+] then type ‘quit’

![image](https://github.com/Fawazcp/aws-project/assets/111639918/c87cf752-3559-468f-bfb7-2ac2b582c581)

Now we are able to connect to the backend server inside the tomcat instance

## Step 5
### Load balancer and DNS

**Task 1**

**Create target group**

To create target group follow the below steps;

![image](https://github.com/Fawazcp/aws-project/assets/111639918/5a3f546c-6073-4e9f-9eb1-15849ae5d9c7)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/191ca2bc-59c4-4ddc-97b3-590a28bf4eea)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/b1fb52e7-07f4-4aa2-a4be-5d5f91887aa2)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/e4e40619-47c3-45b8-9f60-d1d7204620c5)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/ea3f0a90-88d6-4b3a-b9b1-aacb80935596)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/768c8534-5f5c-409a-9987-62840a94f4e7)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/6a70a9c7-805a-4eda-819a-dda733b4e74e)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/6736b556-a6a3-4f30-a68a-113ffdd2240b)

![image](https://github.com/Fawazcp/aws-project/assets/111639918/4721383e-667a-4d1a-a8b3-17f600b5178f)



