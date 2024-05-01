const mysql = require('mysql');
const {faker, fakerEN_US} =require('@faker-js/faker');
const con= mysql.createConnection({
    host:'localhost',
    user: 'root',
    password: '',
    database: 'road_trip' 
});


con.connect((err)=>{
    if(err) throw err;
    console.log("Connected to database");
});

//insert a new student
//var q = "insert into student (name,dept_name,tot_credit) values('Bob Tonk', 'Comp. Sci.', 120) ,('Harry Potter', 'Public Health Edu.', 17) ";

//con.query(q,(err,results)=>{
 //   if(err) throw err;
   // console.log(results.affectedRows+" rows inserted");
//});



//display student table
//var q ="select * from student";

//con.query(q,(err,results)=>{
   // if(err) throw err;
   // results.forEach(student => {
     //   console.log("ID: "+student.ID+" Name: "+student.name+" Department: "+student.dept_name);
   // })
   // console.log(results);
//});

// const search_student_ID =1;
// var q = "select * from student where ID=?";


// con.query(q,[search_student_ID],(err,results)=>{
//     if(err) throw err;
//     if(results.length==0){
//         console.log("No student found");
//     }
//     else
//         console.log(results);
// });

// var q ="select count(*) as count, max(tot_credit) as maxCredit, avg(tot_credit) as avgCredit from student";

// con.query(q,(err,results)=>{
//     if(err) throw err;
//     console.log(results[0].count +" student are now in the student table");
//     console.log(results[0].maxCredit +" is the max credit in the student table");
//     console.log(results[0].avgCredit +" is the avg credit in the student table");
// });
//insert a random student
// const students = [];
// const N = 7;
// const std_department = ["Biology.","Copm. Sci.", "Math", "Physics"];
// //const student_info = {name:std_name, tot_credit: std_credit, dept_name: std_department[Math.floor(Math.random() * std_department.length)]};

// for(let i=0; i<N; i++){

// const std_name = faker.person.fullName();
// const std_credit = faker.number.int({min: 15, max: 120});

// students.push([std_name, std_credit, std_department[Math.floor(Math.random() * std_department.length)]]);
// }

// const q = "insert into student (name, tot_credit, dept_name) values ?";

// con.query(q,[students],(err,results)=>{
//   if(err) throw err;
//   console.log(results.affectedRows + " studnet is inserted suc");
  
// })

// const std_id = 2;

// const q = "update student set tot_credit=? where id=?" ;

// con.query(q, [133, std_id],(err,results)=>{
//   if(err) throw err;
//   console.log(results.affectedRows + " students get updated");
// })

// const std_id = 35;

// const q = "delete from student where id=?" ;

// con.query(q, [std_id],(err,results)=>{
//   if(err) throw err;
//   console.log(results.affectedRows + " students gets deleted");
// })