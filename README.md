# PigeonBroadcast

This is the assignment for *COMP2013J Databases and Information Systems*. 

## Intro

**PigeonBroadcast** is a user-friendly internal messaging system designed for college environments. It streamlines communication by providing a single platform for faculty, administrative staff, and students to send and receive messages. This efficient solution eliminates the need to join multiple WeChat groups or sift through numerous emails, ensuring that important information is easily accessible and never missed. The system is composed of two user-centric modules: 
1. **Epistles**: for the faculty and other staff to post messages,
2. **Feathers**: for individual students and student organization managers to post messages.

For detailed information, please read: [Info System Report](Info_System_Report.pdf)

## How to run this project? (SIGNIFICANT!)
First, you need to put your Mysql account and password in `resources/text/database_info.txt`.
For example: 

```text
root
123456
```

Then, add a configuration for Tomcat Server - Local, choose Tomcat 9.0.X (PigeonBroadcast may have problems with other versions) 
and add "COMP2013J_Group02_war_exploded" artifact to deployment.

Now, you can run the project as expected. It will automatically create a database called "pigeon_broadcast" and 
related tables if you don't have (if it's the first time you run it, you usually don't have one).

### Again!!!
It's important to enter your authorized account and password in `resources/text/database_info.txt`!