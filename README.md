# PigeonBroadcast

This is the assignment for *COMP2013J Databases and Information Systems*. 

## Intro

**PigeonBroadcast** is a user-friendly internal messaging system designed for college environments. It streamlines communication by providing a single platform for faculty, administrative staff, and students to send and receive messages. This efficient solution eliminates the need to join multiple WeChat groups or sift through numerous emails, ensuring that important information is easily accessible and never missed. The system is composed of two user-centric modules: 
1. **Epistles**: for the faculty and other staff to post messages,
2. **Feathers**: for individual students and student organization managers to post messages.

For detailed information, please read: [Info System Report](Info_System_Report.pdf).

## How to run this project? (SIGNIFICANT!)
First, you need to put your MySQL username and password in `resources/text/database_info.txt`.
For example: 

```text
root
123456
```

Then, add a configuration for `Tomcat Server - Local`, choose Tomcat 9.0.X (PigeonBroadcast may have problems with other versions) 
and add "COMP2013J_Group02_war_exploded" artifact to "deployment" section.

Now, the project will run as expected. If it's your first execution and the "pigeon_broadcast" database along with its associated tables do not exist, they will be automatically generated.

### Again!!!
It's important to enter the username and password of your database management system in `resources/text/database_info.txt`!
