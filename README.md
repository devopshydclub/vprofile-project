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

