<<<<<<< Updated upstream

import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Alert.dart';
import 'package:academic_adviser/Models/Appointment.dart';
import 'package:academic_adviser/Models/Attendance.dart';
import 'package:academic_adviser/Models/Certificate.dart';
import 'package:academic_adviser/Models/Course.dart';
import 'package:academic_adviser/Models/Note.dart';
import 'package:academic_adviser/Models/Office.dart';
import 'package:academic_adviser/Models/OfficeHours.dart';
import 'package:academic_adviser/Models/Profile.dart';
import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/Scores.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/ServicesWidget/ServicesCard.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/StudentList/StudentsList.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/UniversalWidget/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
import 'dart:js_util';

import 'package:academic_adviser/Models/DatabaseVariable.dart' as GlobalVaribales;
import 'package:academic_adviser/Models/AAAUser.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

<<<<<<<< Updated upstream:academic_adviser/lib/pages/AcademicAdvisorView/ServicesPage/Services.dart
import '../../../Models/AcademicAdvisor.dart';
import '../../../Models/Alert.dart';
import '../../../Models/Appointment.dart';
import '../../../Models/Attendance.dart';
import '../../../Models/Certificate.dart';
import '../../../Models/Course.dart';
import '../../../Models/Note.dart';
import '../../../Models/Office.dart';
import '../../../Models/OfficeHours.dart';
import '../../../Models/Profile.dart';
import '../../../Models/Score.dart';
import '../../../Models/Student.dart';
========
import '../../Models/AcademicAdvisor.dart';
import '../../Models/Alert.dart';
import '../../Models/Appointment.dart';
import '../../Models/Attendance.dart';
import '../../Models/Certificate.dart';
import '../../Models/Course.dart';
import '../../Models/Note.dart';
import '../../Models/Office.dart';
import '../../Models/OfficeHours.dart';
import '../../Models/Profile.dart';
import '../../Models/Score.dart';
import '../../Models/Student.dart';
import '../AcademicAdvisorView/StudentList/StudentsList.dart';
>>>>>>>> Stashed changes:academic_adviser/lib/pages/ServicesPage/Services.dart
>>>>>>> Stashed changes
import '../Dashboard/Dashboard.dart';
import '../Notes/Note.dart';
import '../Profile/Profile.dart';
import '../Reports/Reports.dart';
<<<<<<< Updated upstream

class Services extends StatelessWidget {
=======
import '../Scores/Scores.dart';
import '../StudentList/StudentsList.dart';
import 'ServicesWidget/ServicesCard.dart';

class Services extends StatelessWidget {
  Services({ required this.Advisor});
    AcademicAdvisor Advisor;
>>>>>>> Stashed changes
 AcademicAdvisor dataFill() {
   Profile AcadimicAdvisorProfile = Profile(
       role: 'Assistant Professor at Taibah Univeraity',
       brief:
       'A model-driven development enthusiast. Mainly interested in conducting research on code generation and UML centric software. I have graduated from Taibah University with B.Sc degree in computer science and join the academic staff as a teacher assistant at Taibah University after then. I spent around two years as a lab TA for different courses mainly focusing on object-oriented programming. After that I started my master program in University of Ottawa and joined Cruise Lab that is being supervised by professor Timothy Lethbridge conducting research on different areas of Umple. My thesis is discussing the development of C++ code generation for Umple which generates OO C++ code from UML/Umple models. The development was approached in agile way through test-driven development. Through the development of this project I have gained more interest in several topics including: Modelling (in general), Meta-Modelling, Eclipse-based development, OO programming, Design of Domain-Specific Languages, Testing, Model Transformation M2T (Code Generation), Scenario Modelling, Requirement Engineering, Conducting Usability Experiments, Conducting Usability Evaluation with inspection methods, UML modelling, Petri-Nets modelling, agile programming, web programming and web testing.I have also developed good expertise in working with GRL models and proposed an approach to improve business using GRL and Ruby which automate the process of collecting customer reviews and propagate them back to the model using JucmNav and Ruby as main development language.Currently, I am a Phd student at the University of Ottawa focusing my research on model-based testing and automatic tests generation in Umple/UML.',
       department: 'Computer Science Department',
       profileAvatar: 'assets/images/ProfileImages/4000951Avater.jpg',
       educationalCertificates: [
         'PhD in computer science',
         'BSc in computer science',
         'MSc in computer science',
       ],
       additionalCertificates: [
         Certificate(
             certificateTitle: 'UI/UX design',
             certificateIssuer: 'Coursera',
             date: '2022/2/8'),
         Certificate(
             certificateTitle: 'Java',
             certificateIssuer: 'Udemy',
             date: '2022/2/8'),
         Certificate(
             certificateTitle: 'Design',
             certificateIssuer: 'Taibah university',
             date: '2022/2/8'),
         Certificate(
             certificateTitle: 'Machine Learning',
             certificateIssuer: 'Taibah university',
             date: '2022/2/8'),
       ]);
   Office AcadimicAdvisorOffice =
   Office(building: "115", floor: 1, officeNumber: 7);
   List<OfficeHours> AcadimicAdvisorOfficeHours = [
     OfficeHours(
         officeHoursFrom: '1:00PM', officeHoursTo: '2:00PM', day: 'Sunday'),
     OfficeHours(
         officeHoursFrom: '9:00AM', officeHoursTo: '10:30AM', day: 'Monday'),
     OfficeHours(
         officeHoursFrom: '1:00PM', officeHoursTo: '2:00PM', day: 'Wednesday'),
   ];

   Profile studentProfile = Profile(
       role: 'Student at Taibah University',
       department: 'Computer Science Department',
       educationalCertificates: [
         'High School',
       ]);
   List<Course> currentStudyingCourses = [
     Course(
         courseTitle: '',
         courseNumber: 101,
         courseCode: 'CHEM',
         courseHour: 3,
         courseID: 'CHEM101',
         level: 7,
         appointment: [
           Appointment(
               startTime: TimeOfDay(hour: 4, minute: 3),
               endTime:  TimeOfDay(hour: 4, minute: 3),
               day: 2,
               classRoom: 'G85',
               Building: '115'),
           Appointment(
               startTime: TimeOfDay(hour: 4, minute: 3),
               endTime:  TimeOfDay(hour: 4, minute: 3),
               day: 4,
               classRoom: 'G85',
               Building: '115'),
         ],
         attendance: Attendance(
           absent: 15,
           attendance: 16,
           numberOfLecture: 40,
         )),
     Course(
         courseTitle: '',
         courseNumber: 101,
         courseCode: 'CHEM',
         courseHour: 3,
         courseID: 'CHEM101',
         level: 7,
         appointment: [
           Appointment(
               startTime: TimeOfDay(hour: 4, minute: 3),
               endTime: TimeOfDay(hour: 4, minute: 3),
               day: 2,
               classRoom: 'G85',
               Building: '115'),
           Appointment(
               startTime:  TimeOfDay(hour: 4, minute: 3),
               endTime:  TimeOfDay(hour: 4, minute: 3),
               day: 4,
               classRoom: 'G85',
               Building: '115'),
         ],
         attendance: Attendance(
           absent: 15,
           attendance: 16,
           numberOfLecture: 40,
         )),
     Course(
         courseTitle: '',
         courseNumber: 101,
         courseCode: 'CHEM',
         courseHour: 3,
         courseID: 'CHEM101',
         level: 7,
         appointment: [
           Appointment(
               startTime:  TimeOfDay(hour: 4, minute: 3),
               endTime:  TimeOfDay(hour: 4, minute: 3),
               day: 2,
               classRoom: 'G85',
               Building: '115'),
           Appointment(
               startTime:  TimeOfDay(hour: 4, minute: 3),
               endTime: TimeOfDay(hour: 4, minute: 3),
               day: 4,
               classRoom: 'G85',
               Building: '115'),
         ],
         attendance: Attendance(
           absent: 15,
           attendance: 16,
           numberOfLecture: 40,
         )),
   ];
   List<Course> finishedCourses = [
     Course(
       courseTitle: '',
       courseNumber: 101,
       courseCode: 'CHEM',
       courseHour: 3,
       courseID: 'CHEM101',
       level: 7,
     ),
     Course(
       courseTitle: '',
       courseNumber: 101,
       courseCode: 'CHEM',
       courseHour: 3,
       courseID: 'CHEM101',
       level: 7,
     ),
     Course(
       courseTitle: '',
       courseNumber: 101,
       courseCode: 'CHEM',
       courseHour: 3,
       courseID: 'CHEM101',
       level: 7,
     ),
   ];
   List<Score> score = [
     Score(scoreName: 'Programming', scoreCourses: [
       Course(
         courseTitle: '',
         courseNumber: 101,
         courseCode: 'CHEM',
         courseHour: 3,
         courseID: 'CHEM101',
         level: 7,
       ),
       Course(
         courseTitle: '',
         courseNumber: 101,
         courseCode: 'CHEM',
         courseHour: 3,
         courseID: 'CHEM101',
         level: 7,
       ),
       Course(
         courseTitle: '',
         courseNumber: 101,
         courseCode: 'CHEM',
         courseHour: 3,
         courseID: 'CHEM101',
         level: 7,
       ),
     ], coursesPercentage: [
       33.0,
       34.0,
       33.0
     ],
         goodPercent: 70,
         badPercent: 50
     )
   ];
   List<Note> notes = [
     Note(
         receiver: 'Student',
         noteContent:
         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
         noteID: '1'),
     Note(
         noteID: '2',
         receiver: 'Myself',
         noteContent:
         'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
     Note(
         noteID: '3',
         receiver: 'Myself',
         noteContent:
         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
     Note(
         noteID: '4',
         receiver: 'Student',
         noteContent:
         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
     Note(
         noteID: '5',
         receiver: 'Myself',
         noteContent:
         'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
   ];
   List<Alert> alert = [
     Alert(
         alertContent: 'CS471',
         alertTitle: 'Miss Final Exam',
         alertDate: '2022/6/6',
         alertDegree: 2),
     Alert(
         alertContent: 'CS451',
         alertTitle: '20% Absents',
         alertDate: '2022/6/20',
         alertDegree: 1),
     Alert(
         alertContent: 'Level 10',
         alertTitle: 'Drop GPA',
         alertDate: '2022/6/6',
         alertDegree: 1)
   ];
   List<Student> AcadimicAdvisorStudents = [
     Student(
       uid: 'PhxLyaAHeCZUWuiPJFlaDzxmvrU2',
       firstName: 'Mohammed',
       lastName: 'Alhusainy',
       studentID: '4000951',
       studentEmail: 'tu4000951@taibahu.edu.sa',
       studentPhone: '0537913432',
       studentProfile: studentProfile,
       gpa: 4.69,
       totalHours: 143,
       registeredHours: 153,
       planHours: 153,
       currentStudyingCourses: currentStudyingCourses,
       finishedCourses: finishedCourses,
       score: score,
       notes: notes,
       alerts: alert,
     ),
   ];
   return AcademicAdvisor(
     uid: 'MbbP6Ck8O6gseVYX9KKZdpvJkqU2',
     firstName: 'Sultan',
     lastName: 'Almaghthawi',
     academicID: '4200',
     academicEmail: 'SMAGHTHAWI@taibahu.edu.sa',
     phone: '0537945312',
     profile: AcadimicAdvisorProfile,
     student: AcadimicAdvisorStudents,
     office: AcadimicAdvisorOffice,
     officeHoures: AcadimicAdvisorOfficeHours,
   );
 }

 @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
   AcademicAdvisor user = dataFill();
=======
>>>>>>> Stashed changes
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: SizedBox(
        width: 513.w,
        child: Drawer(
<<<<<<< Updated upstream
          child: Menu(),
=======
          child: Menu(user: Advisor,),
>>>>>>> Stashed changes
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 78.h ,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 114, 72, 185),size: 34.sp),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              AAA_Icons_Pack.profile,
              color: Colors.white,
              size: 45.sp,
            ),
            Text(
<<<<<<< Updated upstream
              user.firstName,
=======
              Advisor.firstName,
>>>>>>> Stashed changes
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal', color: Colors.white
              ),
            ),
          ],
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        BackgroundWidget(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 129.h,
            ),
            Container(
              width: 383.63.w,
              height: 106.93.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Logos/LogoWithoutStrapline.png',
                      ),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 41.1.h,
            ),
            Text(
              'Our ServicesPage Features',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 231, 248, 249),
                  fontFamily: 'Tajawal'),
            ),
            SizedBox(
              height: 39.h,
            ),
            Container(
              width: 1267.w,
              height: 619.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServicesCard(
                        label: 'Profile',
<<<<<<< Updated upstream
                        Route: ProfilePage(user: user,),
=======
                        Route: ProfilePage(user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'profile',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: ' is where you find all your academic information and certificates'
                          )
                        ],
                        icon: AAA_Icons_Pack.profile,
                      ),
                      SizedBox(width: 29.w,),
                      ServicesCard(
                        label: 'Dashboard',
<<<<<<< Updated upstream
                        Route: DashboardWidget(student: user.student[0],),
=======
                        Route: DashboardWidget(student: Advisor.student[0],user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'summary for all activities, charts,  and  statistics in a single '
                          ),
                          TextSpan(
                              text: 'dashboard',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ],
                        icon: AAA_Icons_Pack.dashboard,
                      ),
                      SizedBox(width: 29.w,),
                      ServicesCard(
                        label: 'Chating',
<<<<<<< Updated upstream
                        Route: ProfilePage(user: user,),
=======
                        Route: ProfilePage(user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'live '
                          ),
                          TextSpan(
                              text: 'chat',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: '   for  fast  &  easy communication  with  your students/academic advisor'
                          )
                        ],
                        icon: AAA_Icons_Pack.chat,
                      ),
                      SizedBox(width: 29.w,),
                      ServicesCard(
                        label: 'Students\' List',
<<<<<<< Updated upstream
                        Route: StudentsList(studentList: user.student,),
=======
                        Route: StudentsList(studentList: Advisor.student,user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'list',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: ' of all the students who  are under your supervising'
                          )
                        ],
                        icon: AAA_Icons_Pack.student_list,
                      ),
                    ],
                  ),
                  SizedBox(height: 29.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServicesCard(
                        label: 'Add/Delete',
<<<<<<< Updated upstream
                        Route: ProfilePage(user: user,),
=======
                        Route: ProfilePage(user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'adding/deleting',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: '  courses before you make it on SIS'
                          )
                        ],
                        icon: AAA_Icons_Pack.books,
                      ),
                      SizedBox(width: 29.w,),
                      ServicesCard(
                        label: 'Scores',
<<<<<<< Updated upstream
                        Route: ScoresWidget(user: user,),
=======
                        Route: ScoresWidget(user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'Evaluate   and   customize  your student\'s '
                          ),
                          TextSpan(
                              text: 'scores',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: ' and skills'
                          )
                        ],
                        icon: AAA_Icons_Pack.graph,
                      ),
                      SizedBox(width: 29.w,),
                      ServicesCard(
                        label: 'Notes',
<<<<<<< Updated upstream
                        Route: Notes(user: user,),
=======
                        Route: Notes(user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'write   '
                          ),
                          TextSpan(
                              text: 'notes',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: '   about   your students  to  them,  save it for future,  or for your-self'
                          )
                        ],
                        icon: AAA_Icons_Pack.note,
                      ),
                      SizedBox(width: 29.w,),
                      ServicesCard(
                        label: 'Report',
<<<<<<< Updated upstream
                        Route: Report(user: user,),
=======
                        Route: Report(user: Advisor,),
>>>>>>> Stashed changes
                        children:  [
                          TextSpan(
                              text: 'generate    '
                          ),
                          TextSpan(
                              text: 'reports',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: '    about one    of     your     students'
                          )
                        ],
                        icon: AAA_Icons_Pack.report,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
