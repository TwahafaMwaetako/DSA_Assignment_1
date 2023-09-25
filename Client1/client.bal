import ballerina/io;
import ballerina/http;

public function main() returns error?{
  http:Client fciClient = check new("localhost:8080");
  
  boolean infinity = true;
  string choice = " ";
  string a = " ";
  string b = " ";
  string c = " ";
  string d = " ";
  string e = " ";
  string f = " ";
  string g = " ";
  string h = " ";
  string i = " ";    
  
    while infinity == true{
    io:println("Welcome to the fci lecturer management system");
    io:println("Press 1 to see all lecturers in the system.");
    io:println("Press 2 to add a lecturers to the system.");
    io:println("Press 3 to update a lecturer's information or courses");
    io:println("Press 4 to search for a lecturer by staff id");
    io:println("Press 5 to search for a lecturer by office number");
    io:println("Press 6 to remove a lecturers from the system.");
    io:println("Press 0 to exit.");
    i = io:readln("Enter choice 1 - 6:");
    
    io:println(" ");
    
    if i == "1"{
    Lecturer[] allLecturers= check fciClient->get("/fci/api/v1/lecturers");
    io:println("Here are all the lecturers",allLecturers.toJsonString());
    io:println(" ");
    io:println(" ");
    
    } else if i == "2"{
       
         a = io:readln("Enter the staff number: ");
         b = io:readln("Enter the office number: "); 
         c = io:readln("Enter the title: ");
         d = io:readln("Enter the first name: ");
         e = io:readln("Enter the last name: ");
         f = io:readln("Enter course code: ");
         g = io:readln("Enter course name: ");
         h = io:readln("Enter nqf level: ");            
        
          http:Response resp = check fciClient->/fci/api/v1/lecturers.post({
   staffNumber: a,
   officeNumber: b,
   title: c,
   firstName: d,
   lastName: e,
   courses: [
    {
       courseCode: f,
       coursName: g,
       nqfLevel: h
    }
  ]
});

    if (resp.statusCode == 201) {
        io:println(" \n The post request succesful ", resp.getJsonPayload(), "record added");
    }  
    io:println(" ");
    io:println(" ");
    io:println(" ");
    
    } else if i == "3"{
       
         a = io:readln("Enter the staff number: ");
         b = io:readln("Enter the new office number: "); 
         c = io:readln("Enter the new title: ");
         d = io:readln("Enter the first name: ");
         e = io:readln("Enter the last name: ");
         f = io:readln("Enter the new course code: ");
         g = io:readln("Enter the new course name: ");
         h = io:readln("Enter nqf levelof the new course: ");            
        
          http:Response resp2 = check fciClient->/fci/api/v1/lecturers.put({
   staffNumber: a,
   officeNumber: b,
   title: c,
   firstName: d,
   lastName: e,
   courses: [
    {
       courseCode: f,
       coursName: g,
       nqfLevel: h
    } ] });
       
       if (resp2.statusCode == 201) {
        io:println(" \n The put request succesful ", resp2.getJsonPayload(), "record updated");
   }
    io:println(" ");
    io:println(" ");
    io:println(" ");
        
    } else if i == "4" {
      a = io:readln("Enter the staff number of the lecturer you are looking for");   
     Lecturer a_lecturer = check fciClient->get("/fci/api/v1/lecturers/staff/" + a);   
      io:println("Get Request", a_lecturer.toString());
    io:println(" ");
    io:println(" ");
    io:println(" ");
         
    }  else if i == "5" { 
    b= io:readln("Enter office number");
     Lecturer b_lecturer = check fciClient->get("/fci/api/v1/lecturers/office/"+ b);
    io:println("");
io:println("\n\n");
    } else if i == "6" {
    a= io:readln("Enter staff number of lecturer to remove");
    Lecturer a_lecturer = check fciClient->delete("/fci/api/v1/lecturers/staff/" + a);1
io:println("staff number " +b+" has been deleted.");

    io:println("\n\n");
    } else {
      infinity = false;
    }
    
 }
   
}
