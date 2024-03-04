const express = require("express");
const mysql = require("mysql");
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const ejs = require("ejs");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();

app.use(cors());

// Create connection
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "nodemysql",
});

// Connect to MYSQL
db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err);
    process.exit(1); // Terminate the application (exit with a non-zero code)
  }
  console.log("MYSQL Connected");
});

// Middleware to parse JSON and URL-encoded data
app.use(express.json());
app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: false }));

// Create Database
app.get("/createdb", (req, res) => {
  let sql = "CREATE DATABASE nodemysql";
  db.query(sql, (err) => {
    if (err) {
      console.error(err);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    res.send("Database Created");
  });
});

// Create User Table
app.get("/createuser", (req, res) => {
  let sql =
    "CREATE TABLE if not exists User (UserID int AUTO_INCREMENT, Username VARCHAR(255) NOT NULL, Password varchar(255) NOT NULL, Email varchar(255) UNIQUE NOT NULL, FirstName varchar(20) NOT NULL, LastName varchar(20) NOT NULL, UserType ENUM('stud', 'staff', 'prof'), ProfilePic varchar(255), Userprivatemode boolean, CVlink varchar(255), regdate datetime NOT NULL, lastlogindate datetime NOT NULL, Course varchar(255), Matyear int, Tagline varchar(255), `desc` text, portfolio varchar(255), experience varchar(255), education varchar(255), certifications varchar(255), PRIMARY KEY(UserID))";

  // Execute the CREATE TABLE statement
  db.query(sql, (err) => {
    if (err) {
      console.error(err);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    res.send("User table created");
  });
});

// Insert User Details
app.post("/adduser", (req, res) => {
  // Assuming you have the user details in the request body
  const {
    Username,
    Password,
    Email,
    FirstName,
    LastName,
    UserType,
    ProfilePic,
    UserPrivateMode,
    CVLink,
    RegDate,
    LastLoginDate,
    Course,
    MatYear,
    Tagline,
    Desc,
    Portfolio,
    Experience,
    Education,
    Certifications,
  } = req.body;

  let sql =
    "INSERT INTO User (Username, Password, Email, FirstName, LastName, UserType, ProfilePic, Userprivatemode, CVlink, regdate, lastlogindate, Course, Matyear, Tagline, `desc`, portfolio, experience, education, certifications) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW(), ?, ?, ?, ?, ?, ?, ?, ?)";

  db.query(
    sql,
    [
      Username,
      Password,
      Email,
      FirstName,
      LastName,
      UserType,
      ProfilePic,
      UserPrivateMode,
      CVLink,
      RegDate,
      LastLoginDate,
      Course,
      MatYear,
      Tagline,
      Desc,
      Portfolio,
      Experience,
      Education,
      Certifications,
    ],
    (err, result) => {
      if (err) {
        console.error(err);

        // Send a response indicating that an error occurred
        return res.status(500).json({ error: "Internal Server Error" });
      }

      res.send("User added successfully");
    },
  );
});

// Remove All User in User Database
app.post("/removeallusers", (req, res) => {
  let sql = "DELETE FROM User";

  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    res.send("All users removed successfully");
  });
});

// Retrieve All User Details in User Database
app.get("/get-userdata", (req, res) => {
  const query = "SELECT * FROM User";

  db.query(query, (error, results) => {
    if (error) {
      console.error(error);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    // Send the JSON result as a response
    res.json(results);
  });
});

// Reset User Increment
app.post("/resetuserincrement", (req, res) => {
  let sql = "ALTER TABLE User AUTO_INCREMENT = 1";

  db.query(sql, (err) => {
    if (err) {
      console.error(err);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    res.send("User increment reset successfully");
  });
});

// Create Project Table
app.get("/createproject", (req, res) => {
  let sql =
    "CREATE TABLE if not exists Project (ProjectID int AUTO_INCREMENT, UserID int NOT NULL, Title varchar(255) NOT NULL, Phase enum('Onboarding', 'Initiation', 'Execution', 'Closed') NOT NULL, Recruiting boolean NOT NULL, Details text NOT NULL, Category varchar(255) NOT NULL, Image varchar(255) NOT NULL, RolesAvailable varchar(255) NOT NULL, CreationDate datetime NOT NULL, LastActive datetime NOT NULL, Views int NOT NULL, Likes int NOT NULL, ProjectPrivateMode boolean NOT NULL, PRIMARY KEY(ProjectID), FOREIGN KEY(UserID) REFERENCES User(UserID))";
  db.query(sql, (err) => {
    if (err) {
      console.error(err);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    res.send("Project table created");
  });
});

// Insert Project Details
app.post("/addproject", (req, res) => {
  // Assuming you have the project details in the request body
  const {
    UserID,
    Title,
    Phase,
    Recruiting,
    Details,
    Category,
    Image,
    RolesAvailable,
    CreationDate,
    LastActive,
    Views,
    Likes,
    ProjectPrivateMode,
  } = req.body;

  let sql =
    "INSERT INTO Project (UserID, Title, Phase, Recruiting, Details, Category, Image, RolesAvailable, CreationDate, LastActive, Views, Likes, Projectprivatemode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?)";

  db.query(
    sql,
    [
      UserID,
      Title,
      Phase,
      Recruiting,
      Details,
      Category,
      Image,
      RolesAvailable,
      CreationDate,
      LastActive,
      Views,
      Likes,
      ProjectPrivateMode,
    ],
    (err, result) => {
      if (err) {
        console.error(err);

        // Send a response indicating that an error occurred
        return res.status(500).json({ error: "Internal Server Error" });
      }

      res.send("Project added successfully");
    },
  );
});

// Get all projects
app.get("/projectlist", (req, res) => {
  let sql = "SELECT * FROM Project";

  db.query(sql, (error, results) => {
    if (error) {
      console.error(error);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }
    res.json(results);
  });
});

//Get project page details with param ProjectID
app.get("/project/:id", (req, res) => {

  const ProjectID = req.params.id;
  
  let sql = "SELECT * FROM project WHERE ProjectID = ?";

  db.query(sql, [ProjectID], (error,results) => {
    if (error) {
      console.error(error);
      return res.status(500).json({ error: "Internal Server Error"});
    }
    res.json(results);
  });
});

// Remove all projects
app.post("/removeallprojects", (req, res) => {
  let sql = "DELETE FROM Project";

  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    res.send("All projects removed successfully");
  });
});

// Reset Project Increment
app.post("/resetprojectincrement", (req, res) => {
  let sql = "ALTER TABLE Project AUTO_INCREMENT = 1";

  db.query(sql, (err) => {
    if (err) {
      console.error(err);

      // Send a response indicating that an error occurred
      return res.status(500).json({ error: "Internal Server Error" });
    }

    res.send("Project increment reset successfully");
  });
});

// Create Feedback Table
app.get("/createfeedback", (req, res) => {
  let sql =
    "CREATE TABLE if not exists Feedback (FeedbackID int AUTO_INCREMENT, Email varchar(255) not null, Subject varchar(255) not null, Comments text not null, PRIMARY KEY(FeedbackID), FOREIGN KEY(Email) REFERENCES User(Email))";
  db.query(sql, (err) => {
    if (err) {
      throw err;
    }
    res.send("Feedback table created");
  });
});

// Insert Feedback Details
app.post("/addfeedback", (req, res) => {
  // Assuming you have the feedback details in the request body
  const { Email, Subject, Comments } = req.body;

  let sql = "INSERT INTO Feedback (Email, Subject, Comments) VALUES (?, ?, ?)";

  db.query(sql, [Email, Subject, Comments], (err, result) => {
    if (err) {
      throw err;
    }
    res.send("Feedback added successfully");
  });
});

// Create UserSkillSet Table
app.get("/createuserskillset", (req, res) => {
  let sql =
    "CREATE TABLE if not exists UserSkillSet (UserSkillSetID int AUTO_INCREMENT, UserID int NOT NULL, SkillName varchar(255) NOT NULL, PRIMARY KEY(UserSkillSetID), FOREIGN KEY(UserID) REFERENCES User(UserID))";
  db.query(sql, (err) => {
    if (err) {
      throw err;
    }
    res.send("User SkillSet table created");
  });
});

// Insert Userskillset Details
app.post("/adduserskillset", (req, res) => {
  const { UserID, SkillName } = req.body;

  let sql = "INSERT INTO UserSkillSet (UserID, SkillName) VALUES (?, ?)";

  db.query(sql, [UserID, SkillName], (err, result) => {
    if (err) {
      throw err;
    }
    res.send("User SkillSet details added successfully");
  });
});

// Create LikedProject Table
app.get("/createlikedproject", (req, res) => {
  let sql =
    "CREATE TABLE if not exists LikedProject (LikeID int AUTO_INCREMENT, UserID int NOT NULL, ProjectID int NOT NULL, PRIMARY KEY(LikeID), FOREIGN KEY(UserID) REFERENCES User(UserID), FOREIGN KEY(ProjectID) REFERENCES Project(ProjectID), CONSTRAINT unique_user_project_pair UNIQUE (UserID, ProjectID))";
  db.query(sql, (err) => {
    if (err) {
      throw err;
    }
    res.send("LikedProject table created");
  });
});

// Insert Likedprojects Details
app.post("/addlikedproject", (req, res) => {
  const { UserID, ProjectID } = req.body;

  let sql = "INSERT INTO LikedProject (UserID, ProjectID) VALUES (?, ?)";

  db.query(sql, [UserID, ProjectID], (err, result) => {
    if (err) {
      throw err;
    }
    res.send("Liked Project details added successfully");
  });
});

// Create ProjectMember Table
app.get("/createprojectmember", (req, res) => {
  let sql =
    "CREATE TABLE if not exists ProjectMember (ProjectMemberID int AUTO_INCREMENT, UserID int NOT NULL, ProjectID int NOT NULL, Role varchar(255) NOT NULL, JoinDate datetime NOT NULL, LeaveDate datetime, PRIMARY KEY(ProjectMemberID), FOREIGN KEY(UserID) REFERENCES User(UserID), FOREIGN KEY(ProjectID) REFERENCES Project(ProjectID))";
  db.query(sql, (err) => {
    if (err) {
      throw err;
    }
    res.send("Project Member table created");
  });
});

// Insert Projectmember Details
app.post("/addprojectmember", (req, res) => {
  const { UserID, ProjectID, Role, JoinDate, LeaveDate } = req.body;

  let sql =
    "INSERT INTO ProjectMember (UserID, ProjectID, Role, JoinDate, LeaveDate) VALUES (?, ?, ?, ?, ?)";

  db.query(
    sql,
    [UserID, ProjectID, Role, JoinDate, LeaveDate],
    (err, result) => {
      if (err) {
        throw err;
      }
      res.send("Project Member details added successfully");
    },
  );
});

// Frontend routes

// Signup
app.post("/signup", (req, res) => {
  // Assuming you have the user details in the request body
  const { FirstName, LastName, Username, Email, Password } = req.body;

  // Hash the password before storing it in the database
  const hashedPassword = bcrypt.hashSync(Password, 10);

  let sql =
    "INSERT INTO User (Username, Password, Email, FirstName, LastName) VALUES (?, ?, ?, ?, ?)";

  db.query(
    sql,
    [Username, hashedPassword, Email, FirstName, LastName],
    (err, result) => {
      if (err) {
        console.error(err);
        return res
          .status(500)
          .json({ status: "error", message: "Internal Server Error" });
      }

      res.json({
        status: "success",
        message: "User account created successfully.",
      });
    },
  );
});

const jwt = require("jsonwebtoken");
// Express route for user login
app.post("/login", (req, res) => {
  const { Username, Password } = req.body;

  // Fetch user details by username from the database
  let sql = "SELECT * FROM User WHERE Username = ?";
  db.query(sql, [Username], (err, results) => {
    if (err) {
      console.error(err);
      return res
        .status(500)
        .json({ status: "error", message: "Internal Server Error" });
    }

    if (results.length === 1) {
      const user = results[0];

      // Check if the provided password matches the hashed password in the database
      const passwordMatch = bcrypt.compareSync(Password, user.Password);

      if (passwordMatch) {
        const token = jwt.sign(
          { userid: user.UserID, username: user.Username },
          "P2ssw0rd",
          { expiresIn: "1h" },
        );
        res.json({ status: "success", token }); //, token
        console.log(token);
      } else {
        // Incorrect password
        res.status(401).json({ status: "error", message: "Invalid password" });
        console.log("incorrect pass");
      }
    } else {
      // User not found
      res.status(404).json({ status: "error", message: "User not found" });
      console.log("user not found");
    }
  });
});

/////////
////////////////////////////////////////////////////////////////////////////////////////////
// Creating the things needed for Login, Forget Password, Creating New Users and other stuff

// Render the forgot password form
app.get("/forgot-password", (req, res) => {
  res.render("forgot-password.ejs");
});

// Handle the forgot password form submission
app.post("/forgot-password", (req, res) => {
  const email = req.body.email;

  // Generate a unique token for this password reset request
  const token =
    Math.random().toString(36).substring(2, 15) +
    Math.random().toString(36).substring(2, 15);

  // Create a nodemailer transporter
  const transporter = nodemailer.createTransport({
    service: "Gmail",
    auth: {
      user: "vsitdwarka@gmail.com",
      pass: "ncxfvvmekdggosfm",
    },
  });

  // Send the password reset email
  const mailOptions = {
    to: email,
    subject: "Password Reset Request",
    text: `Click the following link to reset your password: http://localhost:3000/reset-password/${token}`,
    html: `<p>Click the following link to reset your password:</p><p><a href="http://localhost:3000/reset-password/${token}">http://localhost:3000/reset-password/${token}</a></p>`,
  };

  transporter.sendMail(mailOptions, (err, info) => {
    if (err) {
      console.log(err);
      res.send("Error sending email");
    } else {
      console.log(info);
      res.send("Password reset email sent");
    }
  });
});

// Render the reset password form
app.get("/reset-password/:token", (req, res) => {
  const token = req.params.token;

  res.render("reset-password.ejs", { token });
});

// Handle the reset password form submission
app.post("/reset-password/:token", (req, res) => {
  const token = req.params.token;
  const password = req.body.password;
  const confirm_password = req.body.confirm_password;

  // Check if passwords match
  if (password !== confirm_password) {
    res.render("reset-password.ejs", {
      token,
      message: "Passwords do not match",
    });
    return;
  }

  res.send("Password reset successful");
});

//////////////////////////////////////////////////////////////////////////////////////

// Reset Increment Counters for All Tables
app.post("/resetallincrements", async (req, res) => {
    try {
        const tables = [
            'User',
            'Project',
            'Feedback',
            'UserSkillSet',
            'LikedProject',
            'ProjectMember',
            'Portfolio',
            'Experience',
            'ExperienceTask',
            'Education',
            'EducationTask',
            'Certification',
            'ProjectRoles',
            'ProjectRolesSkill',
            'ProjectTages'
            // Add more table names as needed
        ];

        for (const table of tables) {
            const sql = `ALTER TABLE ${table} AUTO_INCREMENT = 1`;
            await executeQuery(sql);
        }

        res.send("All increment counters reset successfully");
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Helper function to execute a query
function executeQuery(sql) {
    return new Promise((resolve, reject) => {
        db.query(sql, (err) => {
            if (err) {
                reject(err);
            } else {
                resolve();
            }
        });
    });
}

app.listen("3000", () => {
  console.log("Server Started on port 3000");
});
