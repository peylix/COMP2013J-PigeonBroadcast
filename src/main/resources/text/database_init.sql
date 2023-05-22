CREATE DATABASE pigeon_broadcast;
CREATE TABLE User
(
    userID       INT PRIMARY KEY AUTO_INCREMENT,
    password     VARCHAR(16)                          NOT NULL,
    userName     VARCHAR(16)                          NOT NULL,
    profilePhoto VARCHAR(255) DEFAULT 'images/Pigeon.png',
    email        VARCHAR(255)                         NOT NULL,
    identity     ENUM ('admin', 'teacher', 'student') NOT NULL
);

CREATE TABLE Course
(
    courseID    INT PRIMARY KEY AUTO_INCREMENT,
    courseName  VARCHAR(255) NOT NULL,
    description TEXT         NOT NULL,
    teacherID   INT,
    FOREIGN KEY (teacherID) REFERENCES User (userID)
);
CREATE TABLE Organization
(
    orgID       INT PRIMARY KEY AUTO_INCREMENT,
    orgName     VARCHAR(255) NOT NULL,
    description TEXT         NOT NULL,
    adminID     INT,
    FOREIGN KEY (adminID) REFERENCES User (userID)
);
CREATE TABLE OrganizationMembers
(
    orgID  INT,
    userID INT,
    PRIMARY KEY (orgID, userID),
    FOREIGN KEY (orgID) REFERENCES Organization (orgID),
    FOREIGN KEY (userID) REFERENCES User (userID)
);
CREATE TABLE Notification
(
    noteID      INT PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(255)                                          NOT NULL,
    content     TEXT                                                  NOT NULL,
    type        ENUM ('school', 'course', 'organization', 'personal') NOT NULL,
    releaseDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    publisherID INT,
    FOREIGN KEY (publisherID) REFERENCES User (userID)
);
CREATE TABLE SchoolMembers
(
    memberID  INT PRIMARY KEY,
    lastName  VARCHAR(255),
    firstName VARCHAR(255),
    identity  ENUM ('admin', 'teacher', 'student') NOT NULL
);

