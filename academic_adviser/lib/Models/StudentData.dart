
import 'package:firebase_database/firebase_database.dart';
/*
class StudentData {
  late String? name;
  late String? studentId;
  late String? GPA;
  late String? CH;
  late String? RH;
  late List<String>? StudentsUID = [];
  StudentData(
      {this.name,
        this.studentId,
        this.GPA,
        this.CH,
        this.RH,
        this.StudentsUID});

  static void SetDataAcademicAdvisor() async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("AcademicAdvisor");

    await ref.child("MbbP6Ck8O6gseVYX9KKZdpvJkqU2").set({
      "advisorID" : "4200",
      "firstName": "Sultan",
      "lastName": "Almaghthawi",
      "advisorEmail": "SMAGHTHAWI@taibahu.edu.sa",
      "role" : "Assistant Professor at Taibah Univeraity",
      "department" : "Computer Science Department",
      "language" : "Arabic/English",
      "profileIDRef" : "#AP1",
      "notesRef" : {
        "N1" :{
          "noteID" : "#N1",
        },
        "N2" :{
          "noteID" : "#N2",
        },
        "N3" :{
          "noteID" : "#N3",
        },
      },
      "dashbaordIDRef" : "#AD1",
      "scoreRef" : {
        "Programming": {
          "scoreID" : "Pro4200"

        },
        "English": {
          "scoreID" : "Eng4200"
        },
      },
      "alertRef" : {
        "0" : {
          "alertID" : "#0",
        },
        "1" : {
          "alertID" : "#1",

        },
        "2" : {
          "alertID" : "#2",

        },
        "3" : {
          "alertID" : "#3",

        },
        "4" : {
          "alertID" : "#4",

        },
        "5" : {
          "alertID" : "#5",

        },

      },
      "notificationIDRef" : {
        "0" : {
          "notificationID" : "#0",
        },
        "1" : {
          "notificationID" : "#1",

        },
        "2" : {
          "notificationID" : "#2",

        },
        "3" : {
          "notificationID" : "#3",

        },
        "4" : {
          "notificationID" : "#4",

        },
        "5" : {
          "notificationID" : "#5",

        },
      },
      "studentIDRef" : {
        "0" : {
          "name" : "Yamin",
          "uid" : "we95cKz0mceapcniPjKygLO6bPv2"
        },"1" : {
          "name" : "Mohammed",
          "uid" : "ucKA4iXT8MSNofOanfUkRgg0Zdc2"
        },
        "2" : {
          "name" : "Hakem",
          "uid" : "PhxLyaAHeCZUWuiPJFlaDzxmvrU2"
        },
      },
      "officeHoursIDRef" : {
        "0" : {
          "officeHoursID" : "#Day1",
        },
        "1" : {
          "officeHoursID" : "#Day2",
        },
        "2" : {
          "officeHoursID" : "#Day3",
        },
      },
      "Profile" : {
    "profileID" : "#AP1",
    "displayname" : "Sultan Almaghthawi",
        "role" : "Assistant Professor at Taibah Univeraity",
        "URLAvatar" : "/",
        "department" : "Computer Science Department",
        "email" : "SMAGHTHAWI@taibahu.edu.sa",
        "brief" : "A model-driven development enthusiast. Mainly interested in conducting research on code generation and UML centric software. I have graduated from Taibah University with B.Sc degree in computer science and join the academic staff as a teacher assistant at Taibah University after then. I spent around two years as a lab TA for different courses mainly focusing on object-oriented programming. After that I started my master program in University of Ottawa and joined Cruise Lab that is being supervised by professor Timothy Lethbridge conducting research on different areas of Umple. My thesis is discussing the development of C++ code generation for Umple which generates OO C++ code from UML/Umple models. The development was approached in agile way through test-driven development. Through the development of this project I have gained more interest in several topics including: Modelling (in general), Meta-Modelling, Eclipse-based development, OO programming, Design of Domain-Specific Languages, Testing, Model Transformation M2T (Code Generation), Scenario Modelling, Requirement Engineering, Conducting Usability Experiments, Conducting Usability Evaluation with inspection methods, UML modelling, Petri-Nets modelling, agile programming, web programming and web testing. I have also developed good expertise in working with GRL models and proposed an approach to improve business using GRL and Ruby which automate the process of collecting customer reviews and propagate them back to the model using JucmNav and Ruby as main development language. Currently, I am a Phd student at the University of Ottawa focusing my research on model-based testing and automatic tests generation in Umple/UML.",
        "educationalCirtificates" : {
          "0" : {
            "eduCirtificateID" : "#eduCert0",
            "eduDegree" : "PhD"
          },
          "1" : {
            "eduCirtificateID" : "#eduCert1",
            "eduDegree" : "BSc"
          },

          "2" : {
            "eduCirtificateID" : "#eduCert2",
            "eduDegree" : "MSc"
          },

        },
        "additionalCirtificates" : {
          "0" : {
            "CirtificateID" : "#acert0",
          },
          "1" : {
            "CirtificateID" : "#acert1",
          },
          "2" : {
            "CirtificateID" : "#acert2",
          },
          "3" : {
            "CirtificateID" : "#acert3",
          },
          "4" : {
            "CirtificateID" : "#acert4",
          },
        },
      },
    });
  }

  static void SetDataStudent() async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("Student");

    await ref.child("ucKA4iXT8MSNofOanfUkRgg0Zdc2").set({
      "firstName": "Mohammed",
      "lastName": "Alhussainy",
      "studentEmail": "tu40009518@taibahu.edu.sa",
      "GPA" : 3,
      "studentID": 4000951,
      "department" : "Computer",
      "language" : "Arabic",
      "registerdHours" : "153",
      "totalHours" : "143",
      "PlanHours" : "153",
      "profileIDRef" : "3",
      "notesRef" : {
        "N1" :{
          "noteID" : "#N1",
        },
        "N2" :{
          "noteID" : "#N2",
        },
        "N3" :{
          "noteID" : "#N3",
        },
      },
      "coursesRef" : {
        "CS" : {
          "0" : {
            "CourseID" : "CS 103"
          },
          "1" : {
            "CourseID" : "CS 111"
          },
          "2" : {
            "CourseID" : "CS 112"
          },
        },
      },
      "dashbaordIDRef" : "#D3",
      "scoreRef" : {
        "Programming": {
          "scoreID" : "Pro4000951"

        },
        "English": {
          "scoreID" : "Eng4000951"
        },

      },
      "alertRef" : {
        "0" : {
          "alertID" : "#0",
        },
        "1" : {
          "alertID" : "#1",

        },
        "2" : {
          "alertID" : "#2",

        },
        "3" : {
          "alertID" : "#3",

        },
        "4" : {
          "alertID" : "#4",

        },
        "5" : {
          "alertID" : "#5",

        },

      },
      "notificationIDRef" : {
        "0" : {
          "notificationID" : "#0",
        },
        "1" : {
          "notificationID" : "#1",

        },
        "2" : {
          "notificationID" : "#2",

        },
        "3" : {
          "notificationID" : "#3",

        },
        "4" : {
          "notificationID" : "#4",

        },
        "5" : {
          "notificationID" : "#5",

        },
      },
    });
  }
  static void SetDataCourse() async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("Courses");

    await ref.set({
        "CS" : {
          "0" : {
            "courseID" : "CS 103",
            "courseName" : "Discrete Structures",
            "courseCode" : "CS",
            "courseNumber" : "103",
            "courseHours" : "3",
          },
          "1" : {
            "courseID" : "CS 111",
            "courseName" : "Programming (1)",
            "courseCode" : "CS",
            "courseNumber" : "111",
            "courseHours" : "4",
          },
          "2" : {
            "courseID" : "CS 112",
            "courseName" : "Programming (2)",
            "courseCode" : "CS",
            "courseNumber" : "112",
            "courseHours" : "4",
          },
          "3" : {
            "courseID" : "CS 211",
            "courseName" : "Algorithms and data structures",
            "courseCode" : "CS",
            "courseNumber" : "211",
            "courseHours" : "4",
          },
        },
        "GS" : {
          "0" : {
            "courseID" : "GS 152",
            "courseName" : "Computer skills",
            "courseCode" : "GS",
            "courseNumber" : "152",
            "courseHours" : "2",
          },
          "1" : {
            "courseID" : "GS 151",
            "courseName" : "University life skills",
            "courseCode" : "GS",
            "courseNumber" : "151",
            "courseHours" : "2",
          },
          "2" : {
            "courseID" : "GS 101",
            "courseName" : "Islamic Studies: Creed and Worship",
            "courseCode" : "GS",
            "courseNumber" : "101",
            "courseHours" : "2",
          },
          "3" : {
            "courseID" : "GS 111",
            "courseName" : "Arabic Language Skills (1)",
            "courseCode" : "GS",
            "courseNumber" : "111",
            "courseHours" : "2",
          },
        },
    });
  }
  static void SetDataDashboard() async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("Dashboard");

    await ref.set({
      "advisorDashboard" : {
        "AD1" : {
          "dashboardID" :"AD1",
          "Notes" : {
            "N1" :{
              "noteID" : "#N1",
            },
            "N2" :{
              "noteID" : "#N2",
            },
            "N3" :{
              "noteID" : "#N3",
            },
          },
          "alertsRef" : {
            "0" : {
              "alertID" : "#0",
            },
            "1" : {
              "alertID" : "#1",

            },
            "2" : {
              "alertID" : "#2",

            },
            "3" : {
              "alertID" : "#3",

            },
            "4" : {
              "alertID" : "#4",

            },
            "5" : {
              "alertID" : "#5",

            },
          },
          "timeLineID" : "#TL1",
          "scoreIDRef" : {
            "Programming": {
              "scoreID" : ""
            },
            "English": {
              "scoreID" : ""
            },
          },
        },
        "AD2Future" : {
          "dashboardID" :"AD2",
          "Notes" : {
            "N1" :{
              "noteID" : "",
            },
            "N2" :{
              "noteID" : "",
            },
            "N3" :{
              "noteID" : "",
            },
          },
          "alertsRef" : {
            "0" : {
              "alertID" : "",
            },
            "1" : {
              "alertID" : "",

            },
            "2" : {
              "alertID" : "",

            },
            "3" : {
              "alertID" : "",

            },
            "4" : {
              "alertID" : "",

            },
            "5" : {
              "alertID" : "",

            },
          },
          "timeLineID" : "",
          "scoreIDRef" : {
            "Programming": {
              "scoreID" : ""
            },
            "English": {
              "scoreID" : ""
            },
          },
        },
        "AD3Future" : {
          "dashboardID" :"AD3",
          "Notes" : {
            "N1" :{
              "noteID" : "",
            },
            "N2" :{
              "noteID" : "",
            },
            "N3" :{
              "noteID" : "",
            },
          },
          "alertsRef" : {
            "0" : {
              "alertID" : "",
            },
            "1" : {
              "alertID" : "",

            },
            "2" : {
              "alertID" : "",

            },
            "3" : {
              "alertID" : "",

            },
            "4" : {
              "alertID" : "",

            },
            "5" : {
              "alertID" : "",

            },
          },
          "timeLineID" : "",
          "scoreIDRef" : {
            "Programming": {
              "scoreID" : ""
            },
            "English": {
              "scoreID" : ""
            },
          },
        },
        "AD4Future" : {
          "dashboardID" :"AD4",
          "Notes" : {
            "N1" :{
              "noteID" : "",
            },
            "N2" :{
              "noteID" : "",
            },
            "N3" :{
              "noteID" : "",
            },
          },
          "alertsRef" : {
            "0" : {
              "alertID" : "",
            },
            "1" : {
              "alertID" : "",

            },
            "2" : {
              "alertID" : "",

            },
            "3" : {
              "alertID" : "",

            },
            "4" : {
              "alertID" : "",

            },
            "5" : {
              "alertID" : "",

            },
          },
          "timeLineID" : "",
          "scoreIDRef" : {
            "Programming": {
              "scoreID" : ""
            },
            "English": {
              "scoreID" : ""
            },
          },
        },
      },
      "studentDashboard" : {
        "D1" : {
          "dashboardID" :"D1",
          "Notes" : {
            "N1" :{
              "noteID" : "#N1",
            },
            "N2" :{
              "noteID" : "#N2",
            },
            "N3" :{
              "noteID" : "#N3",
            },
          },
          "alertsRef" : {
            "0" : {
              "alertID" : "#0",
            },
            "1" : {
              "alertID" : "#1",

            },
            "2" : {
              "alertID" : "#2",

            },
            "3" : {
              "alertID" : "#3",

            },
            "4" : {
              "alertID" : "#4",

            },
            "5" : {
              "alertID" : "#5",

            },
          },
          "timeLineID" : "#TL1",
          "scoreIDRef" : {
            "Programming": {
              "scoreID" : "Pro3703692"
            },
            "English": {
              "scoreID" : "Eng3703692"
            },
          },
        },
        "D3" : {
          "dashboardID" :"D3",
          "Notes" : {
            "N1" :{
              "noteID" : "#N1",
            },
            "N2" :{
              "noteID" : "#N2",
            },
            "N3" :{
              "noteID" : "#N3",
            },
          },
          "alertsRef" : {
            "0" : {
              "alertID" : "#0",
            },
            "1" : {
              "alertID" : "#1",

            },
            "2" : {
              "alertID" : "#2",

            },
            "3" : {
              "alertID" : "#3",

            },
            "4" : {
              "alertID" : "#4",

            },
            "5" : {
              "alertID" : "#5",

            },
          },
          "timeLineID" : "#TL1",
          "scoreIDRef" : {
            "Programming": {
              "scoreID" : "Pro4000951"
            },
            "English": {
              "scoreID" : "Eng4000951"
            },
          },
        },
        "D2" : {
          "dashboardID" :"D2",
          "Notes" : {
            "N1" :{
              "noteID" : "#N1",
            },
            "N2" :{
              "noteID" : "#N2",
            },
            "N3" :{
              "noteID" : "#N3",
            },
          },
          "alertsRef" : {
            "0" : {
              "alertID" : "#0",
            },
            "1" : {
              "alertID" : "#1",

            },
            "2" : {
              "alertID" : "#2",

            },
            "3" : {
              "alertID" : "#3",

            },
            "4" : {
              "alertID" : "#4",

            },
            "5" : {
              "alertID" : "#5",

            },
          },
          "timeLineID" : "#TL1",
          "scoreIDRef" : {
            "Programming": {
              "scoreID" : "Pro4000688"
            },
            "English": {
              "scoreID" : "Eng4000688"
            },
          },
        },
      },
    });
  }

  static void SetDataAlert() async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("Alert");

    await ref.set({
      "4000688" : {
        "strudentID" :"4000688",
        "0" : {
          "alertContent" :"Miss final exam",
          "alertDate" :"24/3/2021",
          "priority" :"9",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "1" : {
          "alertContent" :"Miss Quiz",
          "alertDate" :"21/2/2021",
          "priority" :"6",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "2" : {
          "alertContent" :"Absent level",
          "alertDate" :"4/4/2021",
          "priority" :"8",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "3" : {
          "alertContent" :"Drop GPA",
          "alertDate" :"28/5/2021",
          "priority" :"10",
          "context" :"-------------",
          "relatedCourse" :"Level 10",
        },
      },
      "3703692" : {
        "strudentID" :"3703692",
        "0" : {
          "alertContent" :"Miss final exam",
          "alertDate" :"24/3/2021",
          "priority" :"9",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "1" : {
          "alertContent" :"Miss Quiz",
          "alertDate" :"21/2/2021",
          "priority" :"6",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "2" : {
          "alertContent" :"Absent level",
          "alertDate" :"4/4/2021",
          "priority" :"8",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "3" : {
          "alertContent" :"Drop GPA",
          "alertDate" :"28/5/2021",
          "priority" :"10",
          "context" :"-------------",
          "relatedCourse" :"Level 10",
        },
      },
      "4000951" : {
        "strudentID" :"4000951",
        "0" : {
          "alertContent" :"Miss final exam",
          "alertDate" :"24/3/2021",
          "priority" :"9",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "1" : {
          "alertContent" :"Miss Quiz",
          "alertDate" :"21/2/2021",
          "priority" :"6",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "2" : {
          "alertContent" :"Absent level",
          "alertDate" :"4/4/2021",
          "priority" :"8",
          "context" :"-------------",
          "relatedCourse" :"CS 211",
        },
        "3" : {
          "alertContent" :"Drop GPA",
          "alertDate" :"28/5/2021",
          "priority" :"10",
          "context" :"-------------",
          "relatedCourse" :"Level 10",
        },
      },
    });
  }


  static void SetDataCertificate() async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("Certificate");

    await ref.set({
      "4200" : {
        "profileIDRef" :"4200",
        "0" : {
          "certificateID" :"#acert0",
          "certificateName" :"UI/UX",
          "date" :"22/1/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "1" : {
          "certificateID" :"#acert1",
          "certificateName" :"Flutter dev",
          "date" :"23/4/2021",
          "grade" :"A+",
          "providerName" :"Coursera",
          "file" :"/---/----/----/--.pdf",
        },
        "2" : {
          "certificateID" :"#acert2",
          "certificateName" :"UI",
          "date" :"1/4/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "3" : {
          "certificateID" :"#acert3",
          "certificateName" :"UX",
          "date" :"14/5/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
      },
      "4000688" : {
        "profileIDRef" :"4000688",
        "0" : {
          "certificateID" :"#sCert0",
          "certificateName" :"UI/UX",
          "date" :"22/1/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "1" : {
          "certificateID" :"#sCert1",
          "certificateName" :"Flutter dev",
          "date" :"23/4/2021",
          "grade" :"A+",
          "providerName" :"Coursera",
          "file" :"/---/----/----/--.pdf",
        },
        "2" : {
          "certificateID" :"#sCert2",
          "certificateName" :"UI",
          "date" :"1/4/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "3" : {
          "certificateID" :"#sCert3",
          "certificateName" :"UX",
          "date" :"14/5/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
      },
      "4000951" : {
        "profileIDRef" :"4000951",
        "0" : {
          "certificateID" :"#sCert0",
          "certificateName" :"UI/UX",
          "date" :"22/1/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "1" : {
          "certificateID" :"#sCert1",
          "certificateName" :"Flutter dev",
          "date" :"23/4/2021",
          "grade" :"A+",
          "providerName" :"Coursera",
          "file" :"/---/----/----/--.pdf",
        },
        "2" : {
          "certificateID" :"#sCert2",
          "certificateName" :"UI",
          "date" :"1/4/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "3" : {
          "certificateID" :"#sCert3",
          "certificateName" :"UX",
          "date" :"14/5/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
      },
      "3703692" : {
        "profileIDRef" :"3703692",
        "0" : {
          "certificateID" :"#sCert0",
          "certificateName" :"UI/UX",
          "date" :"22/1/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "1" : {
          "certificateID" :"#sCert1",
          "certificateName" :"Flutter dev",
          "date" :"23/4/2021",
          "grade" :"A+",
          "providerName" :"Coursera",
          "file" :"/---/----/----/--.pdf",
        },
        "2" : {
          "certificateID" :"#sCert2",
          "certificateName" :"UI",
          "date" :"1/4/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
        "3" : {
          "certificateID" :"#sCert3",
          "certificateName" :"UX",
          "date" :"14/5/2021",
          "grade" :"A+",
          "providerName" :"Udemy",
          "file" :"/---/----/----/--.pdf",
        },
      },
    });
  }

  static void SetDataOfficeHours() async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("AcademicAdvisor/MbbP6Ck8O6gseVYX9KKZdpvJkqU2/Profile/Office/OfficeHours");

    await ref.set({
        "Day1": {
          "officeHoursID": "Day1",
          "officeHoursfrom": "9:00am",
          "officeHoursto": "11:00am",
          "avalibaleDay": "Sunday",

        },
        "Day2": {
          "officeHoursID": "Day2",
          "officeHoursfrom": "8:00am",
          "officeHoursto": "12:00pm",
          "avalibaleDay": "Monday",

        },
        "Day3": {
          "officeHoursID": "Day3",
          "officeHoursfrom": "10:00am",
          "officeHoursto": "1:00pm",
          "avalibaleDay": "Wednesday",

        },


    },

    );
  }


  static void SetDataOffice() async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("AcademicAdvisor/MbbP6Ck8O6gseVYX9KKZdpvJkqU2/Profile/Office");

    await ref.set({
        "bulding": "G115",
        "floor": "1",
        "officeNumber": "5",

    },
    );
  }

}
*/

