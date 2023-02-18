import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Models/AAAUser.dart';
import '../Models/AcademicAdvisor.dart';
import '../Models/Appointment.dart';
import '../Models/Attendance.dart';
import '../Models/Certificate.dart';
import '../Models/Course.dart';
import '../Models/Note.dart';
import '../Models/Score.dart';
import 'AcademicAdvisorView/ServicesPage/Services.dart';
import 'LoadingWidgetA/Loadingwidgets.dart';
import 'SignIn/SignIn.dart';
import 'package:academic_adviser/Models/Alert.dart';
import 'package:academic_adviser/Models/Office.dart';
import 'package:academic_adviser/Models/OfficeHours.dart';
import 'package:academic_adviser/Models/Profile.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'StudentView/ServicesPage/Services.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  LoadingData loadingData = LoadingData();
  AcademicAdvisor Advisor = AcademicAdvisor(
      uid: "",
      firstName: "",
      lastName: "",
      academicID: "",
      academicEmail: "",
      phone: "",
      profile: Profile(role: "", department: "", educationalCertificates: []),
      student: [], planCourses: []);
  bool loadingIndecator = false;
  bool closingSetState=true;
  List<Course> Courses = [];
  String userType = "";
  Map<dynamic, dynamic> studentMap = {};
  late Widget Choice;
  int timerFactor=1;

  Student student = Student(
      uid: "",
      firstName: "",
      lastName: "",
      studentID: "",
      studentEmail: "",
      studentPhone: "",
      studentProfile:
      Profile(role: "", department: "", educationalCertificates: []),
      gpa: 0,
      totalHours: 0,
      registeredHours: 0,
      planHours: 0,
      currentStudyingCourses: [],
      finishedCourses: []);


  bool checkAdvisorData(){
    bool advisorData=true;
    if(Advisor.firstName.isEmpty||Advisor.lastName.isEmpty||Advisor.academicEmail.isEmpty||Advisor.academicID.isEmpty||Advisor.uid.isEmpty||Advisor.phone.isEmpty||Advisor.profile.profileAvatar!.isEmpty||Advisor.profile.brief!.isEmpty||Advisor.profile.department.isEmpty||Advisor.profile.role.isEmpty||Advisor.profile.additionalCertificates!.isEmpty||Advisor.profile.educationalCertificates.isEmpty||Advisor.student.isEmpty){
      advisorData=true;
    }else{
      advisorData=false;
    }
    return advisorData;
  }


  @override
  Widget build(BuildContext context) {


    Advisor=new AcademicAdvisor(uid: "", firstName: "", lastName: "", academicID: "", academicEmail: "", phone:"", profile: Profile(role: "", department: "", educationalCertificates: []), student: [], planCourses: [],office: Office(building: "", floor: 0, officeNumber: 0),officeHoures: []);
    student=new Student(uid: "", firstName: "", lastName: "", studentID: "", studentEmail: "", studentPhone: "", studentProfile: Profile(role: "", department: "", educationalCertificates: []), gpa: 0, totalHours: 0, registeredHours: 0, planHours: 0, currentStudyingCourses: [], finishedCourses: []);
    var dbRefUserType = FirebaseDatabase.instance.ref("UsersMap");
    final user = Provider.of<AAAUser?>(context);

    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        if (user == null) {
          Choice = SignIn();
        } else if (user != null) {
          var userTypeRef = dbRefUserType.child(user.uid).child("userType");
          userTypeRef.once().then((snapshot) {
            userType = snapshot.snapshot.value.toString();
          });

          if (loadingIndecator == false) {
            Choice = LoadingWidgets();

            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                loadingIndecator = true;
              });
            });

          } else if (loadingIndecator == true) {
            if (userType == "Advisor") {

              Future.delayed(Duration(seconds: 5*timerFactor),(){
                Advisor= loadingData.Readings();
                timerFactor+=1;
                Choice = Services(
                  Advisor: Advisor,);

                Future.delayed(const Duration(seconds: 3), ()
                {
                  Advisor = loadingData.Readings();
                });
                Future.delayed(const Duration(seconds: 3), ()
                {
                  setState(() {
                  });

                });
              });


            } else if (userType == "Student") {
              StudentData studentData = StudentData(user.uid);
              Future.delayed(Duration(seconds: 5*timerFactor),(){
                timerFactor+=1;
                student = studentData.getStudent();

                Choice = StudentServices(
                  student: student,
                );

              });
              Future.delayed( Duration(seconds: 3*timerFactor), ()
              {
                setState(() {
                });

              });
            }
          }
        }
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Choice,
        );
      },
    );
  }

  void setuserType(String userT) {
    this.userType = userT;
  }
}

class StudentData {
  Student student = Student(
    uid: "",
    firstName: "",
    lastName: "",
    studentID: "",
    studentEmail: "",
    studentPhone: "",
    studentProfile: Profile(
        role: "",
        department: "",
        educationalCertificates: [],
        additionalCertificates: []),
    gpa: 0,
    totalHours: 0,
    registeredHours: 0,
    planHours: 0,
    currentStudyingCourses: [],
    finishedCourses: [],
    alerts: [],
    notes: [],
    score: [],
  );
  static Map<String, dynamic> studentData = {};
  static Map<String, dynamic>? studentNotes = {};
  static  List<String> noteKeys = [];
  static Map<String, dynamic>? studentScores = {};
  static List<String> scoreKeys = [];
  static Map<String,dynamic> getCoursesData = {};
  late String uid;
  AcademicAdvisor sAdvisor = AcademicAdvisor.AcademicAdvisorProfile(firstName: "", lastName: "", academicEmail: "", profile: Profile(role: "", department: "", educationalCertificates: []), planCourses: []);
  static Map<String, dynamic> studentAdviosrMap = {};

  Map<String, dynamic> getCourses() {
    FirebaseDatabase.instance
        .ref("PlanCourses")
        .orderByKey().once().then((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,);

      getCoursesData = data;
    });

    return getCoursesData;
  }
  StudentData(String uid) {
    this.uid = uid;
  }

  AcademicAdvisor StudentAdvisorData(String uid)  {
    getCoursesData=getCourses();
    FirebaseDatabase.instance
        .ref("AcademicAdvisor")
        .child(uid).once().then((Event) {
      Map<String, dynamic> stuAdvisor = Event.snapshot.value as Map<String, dynamic>;
      studentAdviosrMap=stuAdvisor;
      sAdvisor = AcademicAdvisor.AcademicAdvisorProfile(
          firstName: studentAdviosrMap["firstName"],
          lastName: studentAdviosrMap["lastName"],
          academicEmail: studentAdviosrMap["advisorEmail"],
          office: Office(
              building: studentAdviosrMap["Profile"]["Office"]["bulding"],
              floor: studentAdviosrMap["Profile"]["Office"]["floor"],
              officeNumber: studentAdviosrMap["Profile"]["Office"]
              ["officeNumber"]),
          officeHoures: [
            OfficeHours(
              officeHoursFrom: studentAdviosrMap["Profile"]["Office"]
              ["OfficeHours"]["Day1"]["officeHoursfrom"],
              officeHoursTo: studentAdviosrMap["Profile"]["Office"]
              ["OfficeHours"]["Day1"]["officeHoursto"],
              day: studentAdviosrMap["Profile"]["Office"]["OfficeHours"]
              ["Day1"]["avalibaleDay"],
            ),
            OfficeHours(
              officeHoursFrom: studentAdviosrMap["Profile"]["Office"]
              ["OfficeHours"]["Day2"]["officeHoursfrom"],
              officeHoursTo: studentAdviosrMap["Profile"]["Office"]
              ["OfficeHours"]["Day2"]["officeHoursto"],
              day: studentAdviosrMap["Profile"]["Office"]["OfficeHours"]
              ["Day2"]["avalibaleDay"],
            ),
            OfficeHours(
              officeHoursFrom: studentAdviosrMap["Profile"]["Office"]
              ["OfficeHours"]["Day3"]["officeHoursfrom"],
              officeHoursTo: studentAdviosrMap["Profile"]["Office"]
              ["OfficeHours"]["Day3"]["officeHoursto"],
              day: studentAdviosrMap["Profile"]["Office"]["OfficeHours"]
              ["Day3"]["avalibaleDay"],
            )
          ],
          profile: Profile(
            role: studentAdviosrMap["Profile"]["role"],
            department: studentAdviosrMap["Profile"]["department"],
            brief: studentAdviosrMap["Profile"]["brief"],
            educationalCertificates: [],
            additionalCertificates: [],
          ), planCourses: []);

      for (int j = 0; j < getCoursesData["Courses"].length; j++) {
        sAdvisor.planCourses.insert(
            j,
            Course(
              courseCode: getCoursesData["Courses"][j]["courseCode"],
              courseHour: getCoursesData["Courses"][j]["courseHours"],
              courseNumber: getCoursesData["Courses"][j]["courseNumber"],
              courseTitle: getCoursesData["Courses"][j]["courseName"],
              courseID: getCoursesData["Courses"][j]["courseID"],
              level: getCoursesData["Courses"][j]["level"],
              grade: 0,
              prerequisites: [],
            ));
        for(int prerequisitesIndex=0;prerequisitesIndex<getCoursesData["Courses"][j]["Prerequisites"].length;prerequisitesIndex++){
          sAdvisor.planCourses[j].prerequisites!.insert(prerequisitesIndex,getCoursesData["Courses"][j]["Prerequisites"][prerequisitesIndex]["CourseID"]);
        }
      }

      for (int educationalCirtificatesIndex = 0; educationalCirtificatesIndex <  studentAdviosrMap["Profile"]["educationalCirtificates"]["Cirtificates"].length; educationalCirtificatesIndex++) {
        sAdvisor.profile.educationalCertificates.insert(educationalCirtificatesIndex,  studentAdviosrMap["Profile"]["educationalCirtificates"]["Cirtificates"][educationalCirtificatesIndex]["eduDegree"]);
      }
      for (int additionalCirtificatesIndex = 0; additionalCirtificatesIndex <  studentAdviosrMap["Profile"]["additionalCirtificates"].length; additionalCirtificatesIndex++) {
        sAdvisor.profile.additionalCertificates?.insert(additionalCirtificatesIndex,  Certificate(certificateTitle: studentAdviosrMap["Profile"]["additionalCirtificates"][additionalCirtificatesIndex]["certificateName"], certificateIssuer: studentAdviosrMap["Profile"]["additionalCirtificates"][additionalCirtificatesIndex]["providerName"], date: studentAdviosrMap["Profile"]["additionalCirtificates"][additionalCirtificatesIndex]["date"]));
      }
      student.academicAdvisor=sAdvisor;
    });
    return sAdvisor;
  }


  Student getStudent() {
    ReadStudentNote();
    ReadStudentScores();

    FirebaseDatabase.instance
        .ref("Student")
        .child(uid)
        .orderByKey().once().then((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );
      studentData = data;
      student.uid = studentData["uid"];
      student.firstName = studentData["firstName"];
      student.lastName = studentData["lastName"];
      student.academicID = studentData["studentID"];
      student.academicEmail = studentData["studentEmail"];

      student.academicID = studentData["studentID"];
      student.phone = studentData["phone"];
      student.gpa = studentData["GPA"];
      student.registeredHours = studentData["registerdHours"];
      student.totalHours = studentData["totalHours"];
      student.planHours = studentData["PlanHours"];

      student.apologiesNumber = studentData["AcademicProcesses"]["apologiesNumber"];
      student.delaysNumber = studentData["AcademicProcesses"]["delaysNumber"];
      student.reenrolmentsNumber = studentData["AcademicProcesses"]["reenrolmentsNumber"];
      student.visitsNumber = studentData["AcademicProcesses"]["visitsNumber"];
      student.warningsNumber = studentData["AcademicProcesses"]["warningsNumber"];
      student.withdrawalsNumber = studentData["AcademicProcesses"]["withdrawalsNumber"];

      student.profile.brief = studentData["Profile"]["brief"];
      student.profile.profileAvatar = studentData["Profile"]["URLAvatar"];
      student.profile.role = studentData["Profile"]["role"];
      student.profile.department = studentData["Profile"]["department"];

      //Readign student notes
      for (int note = 0; note < studentData["StudentNotes"].length; note++) {
        student.notes?.insert(
          note,
          Note(
            receiver: studentData["StudentNotes"][noteKeys[note]]["Reciver"],
            noteContent: studentData["StudentNotes"][noteKeys[note]]["Text"],
            noteID: studentData["StudentNotes"][noteKeys[note]]["NoteID"],
            noteState: studentData["StudentNotes"][noteKeys[note]]["NoteState"],
          ),
        );
      }
      student.notes!.removeAt(0);

      //Reading student scores
      for (int j = 0; j < studentData["scoreRef"].length; j++) {
        student.score!.insert(
            j,
            Score(
                scoreName: studentData["scoreRef"][scoreKeys[j]]["scoreName"],
                scoreDescription: studentData["scoreRef"][scoreKeys[j]]
                ["scoreDescription"],
                scoreCourses: [],
                coursesPercentage: [],
                goodPercent: studentData["scoreRef"][scoreKeys[j]]
                ["goodPercent"],
                badPercent: studentData["scoreRef"][scoreKeys[j]]["badPercent"],
                scoreID: studentData["scoreRef"][scoreKeys[j]]["scoreID"],
                score: studentData["scoreRef"][scoreKeys[j]]["score"]
            ));

        for (int k = 0; k < studentData["scoreRef"][scoreKeys[j]]["PLO"].length;k++) {
          student.score![j].scoreCourses.insert(k,
              Course(
                  courseTitle: "",
                  courseNumber: 000,
                  courseCode: "",
                  courseHour: 0,
                  courseID: studentData["scoreRef"][scoreKeys[j]]["PLO"][k]["CourseID"],
                  level: 0,grade: 0));
          student.score![j].coursesPercentage.insert(k, studentData["scoreRef"][scoreKeys[j]]["PLO"][k]["affect"]);
        }
      }

      for (int j = 0; j < studentData["alertRef"].length; j++) {
        student.alerts!.insert(
            j,
            Alert(
                alertContent: studentData["alertRef"][j]["alertContent"],
                alertTitle: studentData["alertRef"][j]["alertTitle"],
                alertDate: studentData["alertRef"][j]["alertDate"],
                alertDegree: studentData["alertRef"][j]["priority"],
                realtedCourse: studentData["alertRef"][j]["relatedCourse"]));
      }

      for (int j = 0; j < studentData["coursesRef"]["courses"].length; j++) {
        student.currentStudyingCourses.insert(
            j,
            Course(
              courseCode: studentData["coursesRef"]["courses"][j]["courseCode"],
              courseHour: studentData["coursesRef"]["courses"][j]
              ["courseHours"],
              courseNumber: studentData["coursesRef"]["courses"][j]
              ["courseNumber"],
              courseTitle: studentData["coursesRef"]["courses"][j]
              ["courseName"],
              courseID: studentData["coursesRef"]["courses"][j]["courseID"],
              level: studentData["coursesRef"]["courses"][j]["level"],
              grade: studentData["coursesRef"]["courses"][j]["grade"],
              attendance: Attendance(absent: studentData["coursesRef"]["courses"][j]["attendance"]["absent"], attendance: studentData["coursesRef"]["courses"][j]["attendance"]["attendance"], numberOfLecture: studentData["coursesRef"]["courses"][j]["attendance"]["numberOfLecture"], absentsPercentage: studentData["coursesRef"]["courses"][j]["attendance"]["absentsPercentage"]),
              appointment: [],
            ));
        for(int appointmentIndex=0;appointmentIndex<studentData["coursesRef"]["courses"][j]["appointment"].length;appointmentIndex++){
          String start1 = studentData["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["startTime"];
          List<String> start11 = start1.split(':');
          List<int> start111 = [int.parse(start11[0]),int.parse(start11[1])];
          TimeOfDay start = TimeOfDay(hour: start111[0], minute: start111[1]);
          String end1 = studentData["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["endTiem"];
          List<String> end11 = end1.split(':');
          List<int> end111 = [int.parse(end11[0]),int.parse(end11[1])];
          TimeOfDay end = TimeOfDay(hour: end111[0], minute: end111[1]);
          student.currentStudyingCourses[j].appointment?.insert(appointmentIndex, Appointment(startTime: start, endTime: end, day: studentData["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["day"], classRoom: studentData["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["classRoom"], Building: studentData["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["building"]));
        }

      }

      for (int j = 0; j < studentData["FinishedCourses"].length; j++) {
        student.finishedCourses.insert(
            j,
            Course(
              courseCode: studentData["FinishedCourses"][j]["courseCode"],
              courseHour: studentData["FinishedCourses"][j]["courseHours"],
              courseNumber: studentData["FinishedCourses"][j]["courseNumber"],
              courseTitle: studentData["FinishedCourses"][j]["courseName"],
              courseID: studentData["FinishedCourses"][j]["courseID"],
              level: studentData["FinishedCourses"][j]["level"],
              grade: studentData["FinishedCourses"][j]["grade"],
            ));

      }
      for (int j = 0;
      j < studentData["Profile"]["additionalCirtificates"].length;
      j++) {
        student.profile.additionalCertificates!.insert(
            j,
            Certificate(
                certificateTitle: studentData["Profile"]
                ["additionalCirtificates"][j]["certificateName"],
                certificateIssuer: studentData["Profile"]
                ["additionalCirtificates"][j]["providerName"],
                date: studentData["Profile"]["additionalCirtificates"][j]
                ["date"]));
      }

      for (int j = 0;
      j < studentData["Profile"]["educationalCirtificates"].length;
      j++) {
        student.profile.educationalCertificates!.insert(j,
            studentData["Profile"]["educationalCirtificates"][j]["eduDegree"]);
      }
      student.academicAdvisor = StudentAdvisorData(studentData["AdvisorUID"]);
    });



    return student;
  }

  void ReadStudentNote()  {
    FirebaseDatabase.instance
        .ref("Student")
        .child(uid)
        .child("StudentNotes").once().then((Event) {
      Map<String, dynamic> stuNotes =
      Event.snapshot.value as Map<String, dynamic>;
      studentNotes = Map.fromEntries(
          stuNotes.entries.map((e) => MapEntry(e.key, e.value)));
      noteKeys = studentNotes!.keys.toList();
    });
  }

  void ReadStudentScores()  {
    FirebaseDatabase.instance
        .ref("Student")
        .child(uid)
        .child("scoreRef").once().then((Event) {
      Map<String, dynamic> stuNotes =
      Event.snapshot.value as Map<String, dynamic>;
      studentScores = Map.fromEntries(
          stuNotes.entries.map((e) => MapEntry(e.key, e.value)));
      scoreKeys = studentScores!.keys.toList();
    });
  }

}

class LoadingData {
  static Map<String,dynamic> getAcademicAdvisorData = {};
  static List<dynamic> getStudentData = [];
  static Map<String,dynamic> getCoursesData = {};
  static List<dynamic> UserType = [];

  static List<Student> Students = [];
  static Map<String, dynamic> studentScores = {};
  static List<String> studentScoreKeys = [];
  static List<List<String>> allStudentsScoresKeys = [];
  late String userType;
  late AAAUser userA;
  static AcademicAdvisor Sultan = AcademicAdvisor(
      uid: "",
      firstName: "",
      lastName: "",
      academicID: "",
      academicEmail: "",
      phone: "",
      profile: Profile(
          role: '',
          department: '',
          educationalCertificates: [],
          additionalCertificates: []),
      student: [], planCourses: []);

  AcademicAdvisor Readings() {
    getAcademicAdvisorData = getAcademicAdvisor();
    getStudentData = getStudent();
    getCoursesData = getCourses();

    for(int i = 0;i<getStudentData.length;i++){
      studentScoreKeys = ReadScores(getStudentData[i]["uid"], i);
    }

    for (int i = 0; i < getStudentData.length; i++) {

      Sultan.student.insert(
        i,
        new Student(
          uid: getStudentData[i]["uid"],
          studentEmail: getStudentData[i]["studentEmail"],
          studentID: getStudentData[i]["studentID"],
          studentPhone: getStudentData[i]["phone"],
          score: [],
          alerts: [],
          firstName: getStudentData[i]["firstName"],
          lastName: getStudentData[i]["lastName"],
          gpa: getStudentData[i]["GPA"],
          registeredHours: getStudentData[i]["registerdHours"],
          totalHours: getStudentData[i]["totalHours"],
          planHours: getStudentData[i]["PlanHours"],
          apologiesNumber : getStudentData[i]["AcademicProcesses"]["apologiesNumber"],
          delaysNumber : getStudentData[i]["AcademicProcesses"]["delaysNumber"],
          reenrolmentsNumber : getStudentData[i]["AcademicProcesses"]["reenrolmentsNumber"],
          visitsNumber : getStudentData[i]["AcademicProcesses"]["visitsNumber"],
          warningsNumber : getStudentData[i]["AcademicProcesses"]["warningsNumber"],
          withdrawalsNumber : getStudentData[i]["AcademicProcesses"]["withdrawalsNumber"],
          notes: [],
          currentStudyingCourses: [],
          finishedCourses: [],
          studentProfile: Profile(
              brief: getStudentData[i]["Profile"]["brief"],
              profileAvatar: getStudentData[i]["Profile"]["URLAvatar"],
              additionalCertificates: [],
              educationalCertificates: [],
              role: getStudentData[i]["Profile"]["role"],
              department: getStudentData[i]["Profile"]["department"]),
        ),
      );

      for (int j = 0; j < getStudentData[i]["alertRef"].length; j++) {
        Sultan.student[i].alerts?.insert(
            j,
            Alert(
                alertContent: getStudentData[i]["alertRef"][j]["alertContent"],
                alertDate: getStudentData[i]["alertRef"][j]["alertDate"],
                alertDegree: getStudentData[i]["alertRef"][j]["priority"],
                alertTitle: getStudentData[i]["alertRef"][j]["alertTitle"],
                realtedCourse: getStudentData[i]["alertRef"][j]
                ["relatedCourse"]));
      }

      for (int j = 0; j < allStudentsScoresKeys[i].length; j++) {
        Sultan.student[i].score?.add(
            Score(
                scoreName: getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]["scoreName"],
                scoreDescription: getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]["scoreDescription"],
                scoreCourses: [],
                coursesPercentage: [],
                goodPercent: getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]["goodPercent"],
                badPercent: getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]["badPercent"],
                scoreID: getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]["scoreID"],
                score: getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]["score"]

            ));
        for (int k = 0;
        k <
            getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]
            ["PLO"]
                .length;
        k++) {
          Sultan.student[i].score![j].scoreCourses.insert(
              k,
              Course(
                  courseTitle: "",
                  courseNumber: 0,
                  courseCode: "",
                  courseHour: 0,
                  courseID: getStudentData[i]["scoreRef"]
                  [allStudentsScoresKeys[i][j]]["PLO"][k]["CourseID"],
                  level: 0,
                  grade: 0));
          Sultan.student[i].score![j].coursesPercentage.insert(
              k,
              getStudentData[i]["scoreRef"][allStudentsScoresKeys[i][j]]["PLO"]
              [k]["affect"]);
        }

      }

      for (int j = 0; j < getStudentData[i]["coursesRef"]["courses"].length; j++) {
        Sultan.student[i].currentStudyingCourses.insert(
            j,
            Course(
              courseCode: getStudentData[i]["coursesRef"]["courses"][j]
              ["courseCode"],
              courseHour: getStudentData[i]["coursesRef"]["courses"][j]
              ["courseHours"],
              courseNumber: getStudentData[i]["coursesRef"]["courses"][j]
              ["courseNumber"],
              courseTitle: getStudentData[i]["coursesRef"]["courses"][j]
              ["courseName"],
              courseID: getStudentData[i]["coursesRef"]["courses"][j]
              ["courseID"],
              level: getStudentData[i]["coursesRef"]["courses"][j]["level"],
              grade: getStudentData[i]["coursesRef"]["courses"][j]["grade"],
              attendance: Attendance(absent: getStudentData[i]["coursesRef"]["courses"][j]["attendance"]["absent"], attendance: getStudentData[i]["coursesRef"]["courses"][j]["attendance"]["attendance"], numberOfLecture: getStudentData[i]["coursesRef"]["courses"][j]["attendance"]["numberOfLecture"], absentsPercentage: getStudentData[i]["coursesRef"]["courses"][j]["attendance"]["absentsPercentage"]),
              appointment: [],
            ));

        for(int appointmentIndex=0;appointmentIndex<getStudentData[i]["coursesRef"]["courses"][j]["appointment"].length;appointmentIndex++){
          String start1 = getStudentData[i]["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["startTime"];
          List<String> start11 = start1.split(':');
          List<int> start111 = [int.parse(start11[0]),int.parse(start11[1])];
          TimeOfDay start = TimeOfDay(hour: start111[0], minute: start111[1]);
          String end1 = getStudentData[i]["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["endTiem"];
          List<String> end11 = end1.split(':');

          List<int> end111 = [int.parse(end11[0]),int.parse(end11[1])];
          TimeOfDay end = TimeOfDay(hour: end111[0], minute: end111[1]);
          Sultan.student[i].currentStudyingCourses[j].appointment!.insert(appointmentIndex, Appointment(startTime: start, endTime:end , day: getStudentData[i]["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["day"], classRoom: getStudentData[i]["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["classRoom"], Building: getStudentData[i]["coursesRef"]["courses"][j]["appointment"][appointmentIndex]["building"]));
        }
      }

      for (int n = 0; n < getStudentData[i]["FinishedCourses"].length; n++) {
        Sultan.student[i].finishedCourses.insert(
            n,
            Course(
                courseTitle: getStudentData[i]["FinishedCourses"][n]
                ["courseName"],
                courseNumber: getStudentData[i]["FinishedCourses"][n]
                ["courseNumber"],
                courseCode: getStudentData[i]["FinishedCourses"][n]
                ["courseCode"],
                courseHour: getStudentData[i]["FinishedCourses"][n]
                ["courseHours"],
                courseID: getStudentData[i]["FinishedCourses"][n]["courseID"],
                level: getStudentData[i]["FinishedCourses"][n]["level"],
                grade: getStudentData[i]["FinishedCourses"][n]["grade"]));
      }

      for (int j = 0;
      j < getStudentData[i]["Profile"]["additionalCirtificates"].length;
      j++) {
        Sultan.student[i].profile.additionalCertificates?.add(Certificate(
          certificateTitle: getStudentData[i]["Profile"]
          ["additionalCirtificates"][j]["certificateName"],
          certificateIssuer: getStudentData[i]["Profile"]
          ["additionalCirtificates"][j]["providerName"],
          date: getStudentData[i]["Profile"]["additionalCirtificates"][j]
          ["date"],
        ));
      }


      for (int j = 0;
      j < getStudentData[i]["Profile"]["educationalCirtificates"].length;
      j++) {
        Sultan.student[i].profile
          ..educationalCertificates.insert(
              j,
              getStudentData[i]["Profile"]["educationalCirtificates"][j]
              ["eduDegree"]);
      }

    }


    return Sultan;
  }
  List<String> ReadScores(String uid, int index) {
    FirebaseDatabase.instance
        .ref("Student")
        .child(uid)
        .child("scoreRef")
        .onValue
        .listen((Event) {
      Map<String, dynamic>? stuScores =
      Event.snapshot.value as Map<String, dynamic>?;
      studentScores = Map.fromEntries(
          stuScores!.entries.map((e) => MapEntry(e.key, e.value)));
      studentScoreKeys = studentScores.keys.toList();
      allStudentsScoresKeys.insert(index, studentScoreKeys);
    });
    return studentScoreKeys;
  }

  Map<String,dynamic> getAcademicAdvisor() {
    FirebaseDatabase.instance
        .ref("AcademicAdvisor")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .orderByKey()
        .onValue
        .listen((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );
      getAcademicAdvisorData = data;
      Sultan = AcademicAdvisor(
        firstName: getAcademicAdvisorData["firstName"],
        lastName: getAcademicAdvisorData["lastName"],
        academicID: getAcademicAdvisorData["advisorID"],
        academicEmail: getAcademicAdvisorData["advisorEmail"],
        uid: getAcademicAdvisorData["uid"],
        phone: getAcademicAdvisorData["phone"],
        student: [],
        office: Office(
          officeNumber: getAcademicAdvisorData["Profile"]["Office"]
          ["officeNumber"],
          building: getAcademicAdvisorData["Profile"]["Office"]["bulding"],
          floor: getAcademicAdvisorData["Profile"]["Office"]["floor"],
        ),
        officeHoures: [
          OfficeHours(
            officeHoursFrom: getAcademicAdvisorData["Profile"]["Office"]
            ["OfficeHours"]["Day1"]["officeHoursfrom"],
            officeHoursTo: getAcademicAdvisorData["Profile"]["Office"]
            ["OfficeHours"]["Day1"]["officeHoursto"],
            day: getAcademicAdvisorData["Profile"]["Office"]["OfficeHours"]
            ["Day1"]["avalibaleDay"],
          ),
          OfficeHours(
            officeHoursFrom: getAcademicAdvisorData["Profile"]["Office"]
            ["OfficeHours"]["Day2"]["officeHoursfrom"],
            officeHoursTo: getAcademicAdvisorData["Profile"]["Office"]
            ["OfficeHours"]["Day2"]["officeHoursto"],
            day: getAcademicAdvisorData["Profile"]["Office"]["OfficeHours"]
            ["Day2"]["avalibaleDay"],
          ),
          OfficeHours(
            officeHoursFrom: getAcademicAdvisorData["Profile"]["Office"]
            ["OfficeHours"]["Day3"]["officeHoursfrom"],
            officeHoursTo: getAcademicAdvisorData["Profile"]["Office"]
            ["OfficeHours"]["Day3"]["officeHoursto"],
            day: getAcademicAdvisorData["Profile"]["Office"]["OfficeHours"]
            ["Day3"]["avalibaleDay"],
          )
        ],
        profile: Profile(
          brief: getAcademicAdvisorData["Profile"]["brief"],
          profileAvatar: getAcademicAdvisorData["Profile"]["URLAvatar"],
          additionalCertificates: [],
          educationalCertificates: [],
          role: getAcademicAdvisorData["Profile"]["role"],
          department: getAcademicAdvisorData["Profile"]["department"],
        ), planCourses: [],
      );
      for (int j = 0; j < getCoursesData["Courses"].length; j++) {
        Sultan.planCourses.insert(
            j,
            Course(
              courseCode: getCoursesData["Courses"][j]["courseCode"],
              courseHour: getCoursesData["Courses"][j]["courseHours"],
              courseNumber: getCoursesData["Courses"][j]["courseNumber"],
              courseTitle: getCoursesData["Courses"][j]["courseName"],
              courseID: getCoursesData["Courses"][j]["courseID"],
              level: getCoursesData["Courses"][j]["level"],
              grade: 0,
              prerequisites: [],
            ));
        for(int prerequisitesIndex=0;prerequisitesIndex<getCoursesData["Courses"][j]["Prerequisites"].length;prerequisitesIndex++){
          Sultan.planCourses[j].prerequisites!.insert(prerequisitesIndex,getCoursesData["Courses"][j]["Prerequisites"][prerequisitesIndex]["CourseID"]);
        }
      }

      for (int j = 0;
      j <
          getAcademicAdvisorData["Profile"]["additionalCirtificates"]
              .length;
      j++) {
        Sultan.profile.additionalCertificates?.add(Certificate(
          certificateTitle: getAcademicAdvisorData["Profile"]
          ["additionalCirtificates"][j]["certificateName"],
          certificateIssuer: getAcademicAdvisorData["Profile"]
          ["additionalCirtificates"][j]["providerName"],
          date: getAcademicAdvisorData["Profile"]["additionalCirtificates"][j]
          ["date"],
        ));
      }

      for (int k = 0;
      k <
          getAcademicAdvisorData["Profile"]["educationalCirtificates"]
          ["Cirtificates"]
              .length;
      k++) {
        Sultan.profile.educationalCertificates.insert(
            k,
            getAcademicAdvisorData["Profile"]["educationalCirtificates"]
            ["Cirtificates"][k]["eduDegree"]);
      }
    });

    return getAcademicAdvisorData;
  }

  List<dynamic> getStudent() {
    FirebaseDatabase.instance
        .ref("Student")
        .orderByKey()
        .onValue
        .listen((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );
      getStudentData = data.values.toList();
      for(int i=0;i<getStudentData.length;i++){
        if(getStudentData[i]["AdvisorUID"]!=FirebaseAuth.instance.currentUser!.uid){
          getStudentData.removeAt(i);
        }
      }
    });


    return getStudentData;
  }

  Map<String, dynamic> getCourses() {
    FirebaseDatabase.instance
        .ref("PlanCourses")
        .orderByKey()
        .onValue
        .listen((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,);

      getCoursesData = data;
    });
    return getCoursesData;
  }
}
