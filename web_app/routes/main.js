// Route handler for forum web app

// This provides data formatting capabilities
var moment = require('moment');

module.exports = function(app, appData) {

    // Stored info
    let logged_in_student_id;

    // Handle our routes

    // Home page
    app.get('/',function(req, res){
        
        let data = Object.assign({}, appData, {logged_in_student_id:logged_in_student_id});
        res.render('index.ejs', data)
    });

    // About page
    app.get('/about',function(req, res){
        res.render('about.ejs', appData);
    });

    // Login page
    app.get('/login',function(req, res){
        res.render('login.ejs', appData);
    });

    // Logout
    app.get('/logout',function(req, res){
        logged_in_student_id = null;
        res.redirect('./');
    });

    // Logged in
    app.post('/loggedin', function(req, res) {
        // Query to find the student trying to log in
        let sqlquery = `SELECT student_id,student_name,password,goldsmiths_id 
                        FROM students 
                        WHERE student_name=?`;

        // Run the query
        db.query(sqlquery,  [req.body.username], (err, result) => {
            if (err) {
                res.redirect('./');
            }

            // Store the student id globally
            logged_in_student_id = result[0].student_id;

            // Reshow the home page (now with student logged in)
            res.redirect('./');
        });                           
    });

    // Rooms page
    app.get('/rooms',function(req, res){
        // Query to find available chat rooms (modules)
        let sqlquery = `SELECT module_id,module_name FROM modules
                        ORDER BY module_name`

        // Run the query
        db.query(sqlquery,  (err, result) => {
            if (err) {
                res.redirect('./');
            }

            // Show the page
            let data = Object.assign({}, appData, {rooms:result});
		    res.render('rooms.ejs', data);
        });   
    });

    // Chat page
    app.get('/chat/:module_id',function(req,res){       
        // Find the module name
        let sqlquery = `SELECT module_name FROM modules WHERE module_id=?`

        db.query(sqlquery,  [req.params.module_id], (err, result) => {

            let module_name = result[0].module_name;

            // Query to find chat content for the room
            let sqlquery = `SELECT post_id,title,content,posts.student_id,student_name,date_and_time FROM posts
                            JOIN students ON students.student_id=posts.student_id
                            WHERE module_id=?
                            ORDER BY date_and_time`

            // Run the query
            db.query(sqlquery,  [req.params.module_id], (err, result) => {
                if (err) {
                    res.redirect('./');
                }

                // Show the page
                let data = Object.assign({}, appData, {logged_in_student_id:logged_in_student_id, moment:moment, messages:result, module_id:req.params.module_id, module_name:module_name});
                res.render('chat.ejs', data);
            });  

        });
    });


    // Add a New Post page form handler
    app.post('/postadded', function (req,res) {
        let params = [req.body.content, req.body.module_id, logged_in_student_id, moment(Date.now()).format("YYYY-MM-DD hh:mm")]

        // Query to insert a new post
        let sqlquery = `INSERT INTO POSTS(title, content, module_id, student_id, date_and_time)
                        VALUES ('',?, ?, ?, ?);`

        // Run the query
        db.query(sqlquery, params, (err, result) => {
            if (err) {
                res.redirect('./');
            }

            // Reshow the chat room (with the new post)
            res.redirect('/chat/' + req.body.module_id);
        });    
    });

}
