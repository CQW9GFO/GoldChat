/*
 * Script for creating the database
 */

# CREATE DATABASE goldchat;

USE goldchat;

 # Create the user which the app will use to access the database
DROP USER IF EXISTS 'goldchatapp'@'localhost';
CREATE USER 'goldchatapp'@'localhost' IDENTIFIED WITH mysql_native_password BY 'newcross';
GRANT ALL PRIVILEGES ON goldchat.* TO 'goldchatapp'@'localhost';

# Remove tables if they already exist
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS module_students;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS modules;

# Create modules table
CREATE TABLE modules (
    module_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    module_name VARCHAR(100),
    PRIMARY KEY (module_id)
);

# Create students table
CREATE TABLE students (
    student_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    student_name VARCHAR(30),
    goldsmiths_id INT,
    password VARCHAR(30),
    PRIMARY KEY (student_id)
);

# Create module_students table
CREATE TABLE module_students (
    module_id INT,
    student_id INT,
    FOREIGN KEY (module_id) REFERENCES modules(module_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

# Create posts table
CREATE TABLE posts (
    post_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    title VARCHAR(50),
    content LONGTEXT,
    module_id INT,
    student_id INT,
    date_and_time DATETIME,
    PRIMARY KEY (post_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);