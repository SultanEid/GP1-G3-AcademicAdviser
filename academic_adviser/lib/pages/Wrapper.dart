import 'dart:developer';

import 'package:academic_adviser/Models/LoadingWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Models/AAAUser.dart';
import '../Models/AcademicAdvisor.dart';
import '../Models/Attendance.dart';
import '../Models/Certificate.dart';
import '../Models/Course.dart';
import '../Models/Note.dart';
import '../Models/Score.dart';
import 'LoadingWidgetA/Loadingwidgets.dart';
import 'ServicesPage/Services.dart';
import 'SignIn/SignIn.dart';
import 'dart:developer';

import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Alert.dart';
import 'package:academic_adviser/Models/Certificate.dart';
import 'package:academic_adviser/Models/Course.dart';
import 'package:academic_adviser/Models/Office.dart';
import 'package:academic_adviser/Models/OfficeHours.dart';
import 'package:academic_adviser/Models/Profile.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  LoadingData loadingData = LoadingData();
  AcademicAdvisor A =AcademicAdvisor(uid: "", firstName: "", lastName: "", academicID: "", academicEmail: "", phone: "", profile:Profile(role: "" ,department: "",educationalCertificates: []), student:[]);
  bool loadingIndecator=false;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AAAUser?>(context);
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Widget Choice;
        if(user==null){
          Choice =  SignIn();
        }else{
          if(loadingIndecator==false){
            Choice=LoadingWidgets();

            Future.delayed(const Duration(seconds: 5), (){
              A=loadingData.Readings();
              loadingIndecator=true;
              setState(() {
                loadingIndecator=true;
              });
            });

          }else{
            Choice = LoadingWidget(A: A,);
          }}
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Choice,
        );
      },
    );
  }
}


class LoadingData {
  static List<dynamic> getAcademicAdvisorData = [];
  static List<dynamic> getStudentData = [];
  static List<dynamic> getCoursesData = [];
  static List<Student> Students = [];
  AcademicAdvisor Readings() {
    getAcademicAdvisorData = getAcademicAdvisor();
    getStudentData = getStudent();
    getCoursesData = getCourses();
    AcademicAdvisor Sultan = AcademicAdvisor(
        uid: "",
        firstName: "",
        lastName: "",
        academicID: "",
        academicEmail: "",
        phone: "",
        profile: Profile(role: '', department: '', educationalCertificates: [] ,additionalCertificates: []),
        student: []);

    for (int i = 0; i < 1; i++) {
      Sultan = AcademicAdvisor(
        firstName: getAcademicAdvisorData[0]
        [FirebaseAuth.instance.currentUser!.uid]["firstName"],
        lastName: getAcademicAdvisorData[0]
        [FirebaseAuth.instance.currentUser!.uid]["lastName"],
        academicID: getAcademicAdvisorData[0]
        [FirebaseAuth.instance.currentUser!.uid]["advisorID"],
        academicEmail: getAcademicAdvisorData[0]
        [FirebaseAuth.instance.currentUser!.uid]["advisorEmail"],
        uid: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]
        ["uid"],
        phone: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]
        ["phone"],
        student: [],
        office: Office(
          officeNumber: getAcademicAdvisorData[0]
          [FirebaseAuth.instance.currentUser!.uid]["Profile"]["Office"]
          ["officeNumber"],
          building: getAcademicAdvisorData[0]
          [FirebaseAuth.instance.currentUser!.uid]["Profile"]["Office"]
          ["bulding"],
          floor: getAcademicAdvisorData[0]
          [FirebaseAuth.instance.currentUser!.uid]["Profile"]["Office"]
          ["floor"],
        ),
        officeHoures: [
          OfficeHours(
            officeHoursFrom: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day1"]["officeHoursfrom"],
            officeHoursTo: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day1"]["officeHoursto"],
            day: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day1"]["avalibaleDay"],
          ),
          OfficeHours(
            officeHoursFrom: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day2"]["officeHoursfrom"],
            officeHoursTo: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day2"]["officeHoursto"],
            day: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day2"]["avalibaleDay"],
          ),
          OfficeHours(
            officeHoursFrom: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day3"]["officeHoursfrom"],
            officeHoursTo: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day3"]["officeHoursto"],
            day: getAcademicAdvisorData[0]
            [FirebaseAuth.instance.currentUser!.uid]["Profile"]
            ["Office"]["OfficeHours"]["Day3"]["avalibaleDay"],
          )
        ],
        //AdvisorProfile: Profile(brief: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["brief"], profileAvatar: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["URLAvatar"], additionalCirtificates: [Certificate(certificateTitle: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["additionalCirtificates"][0]["certificateName"], certificaIssuer: getStudentData[i]["Profile"]["additionalCirtificates"][0]["providerName"], grade: getStudentData[i]["Profile"]["additionalCirtificates"][0]["grade"], date: getStudentData[i]["Profile"]["additionalCirtificates"][0]["date"]),Certificate(certificateTitle: getStudentData[i]["Profile"]["additionalCirtificates"][1]["certificateName"], certificaIssuer: getStudentData[i]["Profile"]["additionalCirtificates"][1]["providerName"], grade: getStudentData[i]["Profile"]["additionalCirtificates"][1]["grade"], date: getStudentData[i]["Profile"]["additionalCirtificates"][1]["date"]),Certificate(certificateTitle: getStudentData[i]["Profile"]["additionalCirtificates"][2]["certificateName"], certificaIssuer: getStudentData[i]["Profile"]["additionalCirtificates"][2]["providerName"], grade: getStudentData[i]["Profile"]["additionalCirtificates"][2]["grade"], date: getStudentData[i]["Profile"]["additionalCirtificates"][2]["date"])], educationalCirtificates: [])
        profile: Profile(
          brief: getAcademicAdvisorData[0]
          [FirebaseAuth.instance.currentUser!.uid]["Profile"]["brief"],
          profileAvatar: getAcademicAdvisorData[0]
          [FirebaseAuth.instance.currentUser!.uid]["Profile"]["URLAvatar"],
          additionalCertificates: [],
          educationalCertificates: [],
          role: getAcademicAdvisorData[0]
          [FirebaseAuth.instance.currentUser!.uid]["Profile"]["role"],
          department: getAcademicAdvisorData[0]
          [FirebaseAuth.instance.currentUser!.uid]["Profile"]["department"],
        ),
      );
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

            // finishedCourses: ,
            // leftCourses: ,

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
              ));
        }

        for (int j = 0; j <1; j++) {
          Sultan.student[i].score?.insert(
              j,
              Score(
                scoreName: getStudentData[i]["scoreRef"]["English"]
                ["scoreName"],
                scoreDescription: getStudentData[i]["scoreRef"]["English"]["scoreDescription"],
                scoreCourses: [],
                coursesPercentage: [],
                goodPercent: getStudentData[i]["scoreRef"]["English"]["goodPercent"],
                badPercent: getStudentData[i]["scoreRef"]["English"]["badPercent"],
              ));
          for(int k=0; k < getStudentData[i]["scoreRef"]["English"]["PLO"].length;k++){
            Sultan.student[i].score![j].scoreCourses.insert(k, Course(courseTitle: "", courseNumber: 000, courseCode:"", courseHour:0, courseID: getStudentData[i]["scoreRef"]["English"]["PLO"][k]["CourseID"], level: 0));
            Sultan.student[i].score![j].coursesPercentage.insert(k,getStudentData[i]["scoreRef"]["English"]["PLO"][k]["affect"]);
          }


        }

        for (int j = 1; j <2; j++) {
          Sultan.student[i].score?.insert(
              j,
              Score(
                scoreName: getStudentData[i]["scoreRef"]["Programming"]["scoreName"],
                scoreDescription: getStudentData[i]["scoreRef"]["Programming"]["scoreDescription"],
                scoreCourses: [],
                coursesPercentage: [],
                goodPercent: getStudentData[i]["scoreRef"]["Programming"]["goodPercent"],
                badPercent: getStudentData[i]["scoreRef"]["Programming"]["badPercent"],
              ));
          for(int k=0; k < getStudentData[i]["scoreRef"]["Programming"]["PLO"].length;k++){
            Sultan.student[i].score![j].scoreCourses.insert(k, Course(courseTitle: "", courseNumber: 000, courseCode:"", courseHour:0, courseID: getStudentData[i]["scoreRef"]["Programming"]["PLO"][k]["CourseID"], level: 0));
            Sultan.student[i].score![j].coursesPercentage.insert(k,getStudentData[i]["scoreRef"]["Programming"]["PLO"][k]["affect"]);
          }


        }
        for (int j = 0; j < getStudentData[i]["UserNotes"].length; j++) {
          Sultan.student[i].notes?.insert(
            j,
            Note(
              receiver: getStudentData[i]["UserNotes"][j]["Reciver"],
              noteContent: getStudentData[i]["UserNotes"][j]["Text"],
              noteID: getStudentData[i]["UserNotes"][j]["NoteID"],
              noteState: getStudentData[i]["UserNotes"][j]["NoteState"],
            ),
          );
        }

        // for (int j = 0; j < getStudentData[i]["coursesRef"]["CS"].length; j++) {
        //   Sultan.student[i].currentStudyingCourses.insert(
        //       j,
        //       Course(
        //           courseCode: getStudentData[i]["coursesRef"]["CS"][j]
        //           ["courseCode"],
        //           courseHour: getStudentData[i]["coursesRef"]["CS"][j]
        //           ["courseHours"],
        //           courseNumber: getStudentData[i]["coursesRef"]["CS"][j]
        //           ["courseNumber"],
        //           courseTitle: getStudentData[i]["coursesRef"]["CS"][j]
        //           ["courseName"],
        //           courseID: getStudentData[i]["coursesRef"]["CS"][j]
        //           ["courseID"],
        //           level: 5));
        // }
        //
        // for (int j = 0; j < getStudentData[i]["coursesRef"]["GS"].length; j++) {
        //   Sultan.student[i].currentStudyingCourses.insert(
        //       j,
        //       Course(
        //           courseCode: getStudentData[i]["coursesRef"]["GS"][j]
        //           ["courseCode"],
        //           courseHour: getStudentData[i]["coursesRef"]["GS"][j]
        //           ["courseHours"],
        //           courseNumber: getStudentData[i]["coursesRef"]["GS"][j]
        //           ["courseNumber"],
        //           courseTitle: getStudentData[i]["coursesRef"]["GS"][j]
        //           ["courseName"],
        //           courseID: getStudentData[i]["coursesRef"]["GS"][j]
        //           ["courseID"],
        //           level: 6));
        // }
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
                level: getStudentData[i]["coursesRef"]["courses"][j]
                ["level"],
              ));
        }
        for (int j = 0; j <getStudentData[i]["Profile"]["additionalCirtificates"].length; j++) {
          Sultan.student[i].profile.additionalCertificates?.add(Certificate(
            certificateTitle: getStudentData[i]["Profile"]["additionalCirtificates"][j]["certificateName"],
            certificateIssuer: getStudentData[i]["Profile"]["additionalCirtificates"][j]["providerName"],
            date: getStudentData[i]["Profile"]["additionalCirtificates"][j]["date"],
          ));
        }
        for (int j = 0; j <getStudentData[i]["Profile"]["educationalCirtificates"].length; j++) {
          Sultan.student[i].profile..educationalCertificates.insert(j,getStudentData[i]["Profile"]["educationalCirtificates"][j]["eduDegree"]);

        }
      }

      print(getStudentData.length);


      for (int j = 0; j < getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["additionalCirtificates"].length; j++) {
        Sultan.profile.additionalCertificates?.add(Certificate(
          certificateTitle: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!
              .uid]["Profile"]["additionalCirtificates"][j]["certificateName"],
          certificateIssuer: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!
              .uid]["Profile"]["additionalCirtificates"][j]["providerName"],
          date: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!
              .uid]["Profile"]["additionalCirtificates"][j]["date"],
        ));
        print("QQQQQ");
        print(j);
        print("QQQQQ");
      }

      for (int k = 0; k < getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["educationalCirtificates"]["Cirtificates"].length; k++) {

        Sultan.profile.educationalCertificates.insert(k,
            getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!
                .uid]["Profile"]["educationalCirtificates"]["Cirtificates"][k]["eduDegree"]);
        print("AAAAAAAAAAAA");
// print(getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["educationalCirtificates"].length.hashCode);
// print(getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["educationalCirtificates"][0]["eduDegree"]);
//           print(getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["educationalCirtificates"][1]["eduDegree"]);
//           print(getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["Profile"]["educationalCirtificates"][2]["eduDegree"]);
      }
      // Readings2(AD);
      // print("asdasdadafef");
      // print(AD.student[0].name);
      // print(AD.student[0].myScores);
    }
    return Sultan;

  }

  void Readings2(AcademicAdvisor AD) {
    print("gsfhsgdfg");
    print(AD.student);
    print("gsfhsgdfg");
  }

  List<dynamic> getAcademicAdvisor() {
    FirebaseDatabase.instance
        .ref("AcademicAdvisor")
        .orderByKey()
        .onValue
        .listen((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );

      data.forEach((key, value) {
        log("$value");
      });
      getAcademicAdvisorData = data.values.toList();
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

      data.forEach((key, value) {
        log("$value");
      });
      getStudentData = data.values.toList();
    });

    return getStudentData;
  }
  List<dynamic> getCourses() {
    FirebaseDatabase.instance
        .ref("Courses")
        .orderByKey()
        .onValue
        .listen((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );

      data.forEach((key, value) {
        log("$value");
      });
      getCoursesData = data.values.toList();
    });

    return getCoursesData;
  }
}

// print(A.student[0].registeredHours);
// print(A.student[0].totalHours);
// print(A.student[0].notes);
// print(A.student[0].notes?[0].noteContent);
// print(A.student[0].alerts?[0].alertContent);
// print(A.student[0].score?[0].scoreName);
// print(A.student[0].notes?[0].noteContent);
// print(A.student[0].notes?[0].receiver);
// print(A.student[0].score);
// print(A.student[0].alerts);
// print(A.student[1].notes);
// print(A.student[1].notes?[0].noteContent);
// print(A.student[0].firstName);
// print(A.student[1].firstName);
// print(A.student[2].firstName);
// print(A.uid);
// print(A.firstName);
// print(A.lastName);
// print(A.academicID);
// print(A.academicEmail);
// print("${A.office?.building}\n${A.office?.officeNumber}\n${A.office?.floor}");
// print("${A.officeHoures?[0].officeHoursFrom}\n${A.officeHoures?[0].officeHoursTo}\n${A.officeHoures?[0].day}");
// print("${A.student[0].currentStudyingCourses[0].courseTitle} ${A.student[0].currentStudyingCourses[0].courseNumber} ${A.student[0].currentStudyingCourses[0].courseID} ${A.student[0].currentStudyingCourses[0].level}");
// print("${A.student[0].currentStudyingCourses[1].courseTitle} ${A.student[0].currentStudyingCourses[1].courseNumber} ${A.student[0].currentStudyingCourses[1].courseID} ${A.student[0].currentStudyingCourses[1].level}");
// print("${A.student[0].currentStudyingCourses[2].courseTitle} ${A.student[0].currentStudyingCourses[2].courseNumber} ${A.student[0].currentStudyingCourses[2].courseID} ${A.student[0].currentStudyingCourses[2].level}");
// print("${A.student[0].currentStudyingCourses[3].courseTitle} ${A.student[0].currentStudyingCourses[3].courseNumber} ${A.student[0].currentStudyingCourses[3].courseID} ${A.student[0].currentStudyingCourses[3].level}");
// print("${A.student[0].currentStudyingCourses[4].courseTitle} ${A.student[0].currentStudyingCourses[4].courseNumber} ${A.student[0].currentStudyingCourses[4].courseID} ${A.student[0].currentStudyingCourses[4].level}");
// print("${A.student[0].currentStudyingCourses[5].courseTitle} ${A.student[0].currentStudyingCourses[5].courseNumber} ${A.student[0].currentStudyingCourses[5].courseID} ${A.student[0].currentStudyingCourses[5].level}");
// print("${A.student[0].currentStudyingCourses[6].courseTitle} ${A.student[0].currentStudyingCourses[6].courseNumber} ${A.student[0].currentStudyingCourses[6].courseID} ${A.student[0].currentStudyingCourses[6].level}");
// print("${A.student[0].currentStudyingCourses[7].courseTitle} ${A.student[0].currentStudyingCourses[7].courseNumber} ${A.student[0].currentStudyingCourses[7].courseID} ${A.student[0].currentStudyingCourses[7].level}");
// print(A.student[0].currentStudyingCourses.length);
// print("${A.student[0].profile.additionalCertificates?[0].certificateTitle}\n${A.student[0].profile.additionalCertificates?[0].certificaIssuer}\n${A.student[0].profile.additionalCertificates?[0].date}");
// print("${A.student[0].profile.additionalCertificates?[1].certificateTitle}\n${A.student[0].profile.additionalCertificates?[1].certificaIssuer}\n${A.student[0].profile.additionalCertificates?[1].date}");
// print("${A.student[0].profile.additionalCertificates?[2].certificateTitle}\n${A.student[0].profile.additionalCertificates?[2].certificaIssuer}\n${A.student[0].profile.additionalCertificates?[2].date}");
// print(A.student[0].profile.additionalCertificates);
// print("${A.student[0].profile.educationalCertificates[0]}\n${A.student[0].profile.educationalCertificates[1]}");
// print(A.student[0].profile.educationalCertificates);
// print(A.student[0].profile.educationalCertificates.length);
//
// print(A.student[0].score?.length);
// print(A.student[0].score);
//
// print(A.student[0].score?[0].scoreName);
// print(A.student[0].score?[0].score);
// print(A.student[0].score?[0].scoreDescription);
// print(A.student[0].score?[0].goodPercent);
// print(A.student[0].score?[0].badPercent);
// print(A.student[0].score?[0].scoreCourses);
// print(A.student[0].score?[0].coursesPercentage);
// print(A.student[0].score?[0].scoreName);
//
//
// print(A.student[0].score?[1].scoreName);
// print(A.student[0].score?[1].score);
// print(A.student[0].score?[1].scoreDescription);
// print(A.student[0].score?[1].goodPercent);
// print(A.student[0].score?[1].badPercent);
// print(A.student[0].score?[1].scoreCourses);
// print(A.student[0].score?[1].coursesPercentage);
// print(A.student[0].score?[1].scoreName);
// //
// print("${A.profile.brief}\n${A.profile.additionalCertificates?[0].certificateTitle}\n${A.profile.additionalCertificates?[1].certificateTitle}");
// print(A.profile.educationalCertificates);
// print(A.profile.educationalCertificates.length);
// print(A.profile.additionalCertificates);
// print(A.profile.additionalCertificates?.length);
// print(A.student[0].currentStudyingCourses[0].attendance?.attendance);
// print(A.student[0].currentStudyingCourses.length);

