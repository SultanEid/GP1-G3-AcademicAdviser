import 'package:academic_adviser/Models/Alert.dart';
import 'package:academic_adviser/Models/Appointment.dart';
import 'package:academic_adviser/Models/Attendance.dart';
import 'package:academic_adviser/Models/Course.dart';
import 'package:academic_adviser/Models/Note.dart';
import 'package:academic_adviser/Models/Profile.dart';
import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/StudentView/Profile/Profile.dart';
import 'package:academic_adviser/pages/StudentView/ServicesPage/ServicesWidget/ServicesCard.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/UniversalWidget/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentServices extends StatelessWidget {

 Student dataFill() {
   Profile studentProfile = Profile(
       role: 'Student at Taibah University',
       department: 'Computer Science Department',
       profileAvatar: 'assets/images/ProfileImages/4000951Avater.jpg',
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
     Score(
         scoreName: 'Programming',
         scoreCourses: [
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
   Student students = Student(
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
   );
   return students;
 }

 @override
  Widget build(BuildContext context) {
   Student user = dataFill();
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: SizedBox(
        width: 513.w,
        child: Drawer(
          child: Menu(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 78.h ,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color.fromARGB(255, 114, 72, 185),size: 34.sp),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              AAA_Icons_Pack.profile,
              color: Colors.white,
              size: 45.sp,
            ),
            Text(
              user.firstName,
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
                        Route: StudentProfile(user: user,),
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
                        //Route: DashboardWidget(student: user.student[0],),
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
                        //Route: ProfilePage(user: user,),
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
                        label: 'Advisor Profile',
                        //Route: StudentsList(studentList: user.student,),
                        children:  [
                          TextSpan(
                              text: 'list',
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: ' of all the students who  are under your supervising'
                          ),
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
                        //Route: ProfilePage(user: user,),
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
                        //Route: ScoresWidget(user: user,),
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
                        //Route: Notes(user: user,),
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
                        //Route: Report(user: user,),
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
