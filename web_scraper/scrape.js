/*
  Scrape module and student names from learn.gold web page
 */

// Dependencies
const request = require('request');
const cheerio = require('cheerio');
const fs = require('fs');
const mysql = require('mysql');

// Requesting to the website (for testing use a downloaded copy of the page)
fs.readFile('participants.html','utf8', (error, html) => {
    // If the file loaded OK
    if(!error) {
        console.log("Page loaded OK");

        // Load the page content into Cheerio
        const $ = cheerio.load(html);
        
        // Get the main page heading so we know the module number
        const siteHeading = $('h1') ;
        let moduleName = siteHeading.html();
        console.log(siteHeading.html());

        // Get the table with the id "participants"
        const participants = $('#participants');
        
        // Get each student name
        let students = [];
        const output1 = participants.find('tbody > tr > th > a').each((i,el) => {
            text = $(el).text();
            students.push(text);
        })
        console.log(students);

        // Insert the data into the database
        insertData(moduleName, students);

        console.log("Done");
    }
    else {
        console.log(error);
    }
});

// Function to insert the data into the database
function insertData(moduleName, students) {

        // Define the database connection
        const db = mysql.createConnection ({
            host: 'localhost',
            user: 'goldchatapp',
            password: 'newcross',
            database: 'goldchat'
        });

        // Connect to the database
        db.connect((err) => {
            if (err) {
                throw err;
            }
            console.log('Connected to database');

            let moduleId;

            // Insert module name
            let sql = "INSERT INTO modules (module_name) VALUES(?)";
            db.query(sql, [moduleName], (err, result) => {
                if (err) {
                    throw err;
                }
                moduleId = result.insertId;
                console.log("Module name inserted " + result.insertId);

                // Insert students
                for (let i=0; i<students.length; i++) {
                    let sql = "INSERT INTO students (student_name) VALUES(?)";
                    db.query(sql, [students[i]], (err, result) => {
                        if (err) {
                            throw err;
                        }
                        let studentId = result.insertId;
                        console.log("Student name inserted " + result.insertId);

                        // Insert module_students
                        let sql = "INSERT INTO module_students (module_id, student_id) VALUES(?,?)";
                        db.query(sql, [moduleId, studentId], (err, result) => {
                            if (err) {
                                throw err;
                            }

                            // Inserted module_students
                            console.log("Module_student inserted " + moduleId + ", " + studentId);
                        }) 
                    })                
                }
            })

            console.log("Done inserting data");
        });
}