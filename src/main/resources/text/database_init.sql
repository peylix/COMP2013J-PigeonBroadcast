CREATE DATABASE pigeon_broadcast;
CREATE TABLE User
(
    userId       INT PRIMARY KEY AUTO_INCREMENT,
    password     VARCHAR(16)                          NOT NULL,
    userName     VARCHAR(16)                          NOT NULL,
    profilePhoto VARCHAR(255),
    email        VARCHAR(255)                         NOT NULL,
    identity     ENUM ('admin', 'teacher', 'student') NOT NULL
);
CREATE TABLE Course
(
    courseId    INT PRIMARY KEY AUTO_INCREMENT,
    courseName  VARCHAR(255) NOT NULL,
    description TEXT         NOT NULL,
    teacherId   INT,
    FOREIGN KEY (teacherId) REFERENCES User (userId)
);
CREATE TABLE Organization
(
    orgID       INT PRIMARY KEY AUTO_INCREMENT,
    orgName     VARCHAR(255) NOT NULL,
    description TEXT         NOT NULL,
    adminId     INT,
    FOREIGN KEY (adminId) REFERENCES User (userId)
);
CREATE TABLE OrganizationMembers
(
    orgID  INT,
    userID INT,
    PRIMARY KEY (orgID, userID),
    FOREIGN KEY (orgID) REFERENCES Organization (orgID),
    FOREIGN KEY (userID) REFERENCES User (userId)
);
CREATE TABLE Notification
(
    noteId      INT PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(255)                                          NOT NULL,
    content     TEXT                                                  NOT NULL,
    type        ENUM ('school', 'course', 'organization', 'personal') NOT NULL,
    releaseDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    publisherId INT,
    FOREIGN KEY (publisherId) REFERENCES User (userId)
);
CREATE TABLE SchoolMembers
(
    memberId  INT PRIMARY KEY,
    lastName  VARCHAR(255),
    firstName VARCHAR(255),
    identity  ENUM ('admin', 'teacher', 'student') NOT NULL
);
