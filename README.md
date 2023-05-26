# COMP2013J-Group02

## How to run this project? (SIGNIFICANT!)
First, you need to put your Mysql account and password in resources/text/database_info.txt.
For example: 

root
123456

Then, add a configuration for Tomcat Serve - Local, choose Tomcat 9.0.X (other versions may have problems)
and add "COMP2013J_Group02_war_exploded" as deployment.

Now, you can run the project normally. It will automatically create a database called "pigeon_broadcast" and 
related tables if you don't have (The first time you run it, you usually don't).

## Again!!!
It's important to enter your authorized account and password in resources/text/database_info.txt!