import 'dart:developer';

import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Alert.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'AcademicAdvisor.dart';
import 'Note.dart';
import 'Score.dart';
/*
class LoadingWidget {
  static List<dynamic> getAcademicAdvisorData=[];
  static List<dynamic> getStudentData=[];
 AcademicAdvisor  Readings(){
  getAcademicAdvisorData = getAcademicAdvisor();
  getStudentData = getStudent();
  // print(getStudentData[0]["firstName"]);
  AcademicAdvisor Sultan = AcademicAdvisor(
    firstName: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["firstName"],
      lastName: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["lastName"],
      AcadmincID: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["advisorID"],
      academicEmail: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["advisorEmail"],
      language: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["language"],
      uid: getAcademicAdvisorData[0][FirebaseAuth.instance.currentUser!.uid]["uid"],
      student: [ Student(
          score: [Score(score: getStudentData[0]["scoreRef"]["English"]["score"],scoreTag: getStudentData[0]["scoreRef"]["English"]["scoreTag"],PLOs: [] ,PLOPercentage: []),Score(score: getStudentData[0]["scoreRef"]["Programming"]["score"],scoreTag: getStudentData[0]["scoreRef"]["Programming"]["scoreTag"],PLOs: [] ,PLOPercentage: [])],
          alerts: [Alert(alertContent:getStudentData[0]["alertRef"][0]["alertContent"] ,alertDate:getStudentData[0]["alertRef"][0]["alertDate"] ,alertDegree:getStudentData[0]["alertRef"][0]["alertContent"] ,content: getStudentData[0]["alertRef"][0]["priority"] ,notification: []),Alert(alertContent:getStudentData[0]["alertRef"][1]["alertContent"] ,alertDate:getStudentData[0]["alertRef"][1]["alertDate"] ,alertDegree:getStudentData[0]["alertRef"][1]["alertContent"] ,content: getStudentData[0]["alertRef"][1]["priority"] ,notification: [])],
          name:getStudentData[0]["firstName"],
          GPA:getStudentData[0]["GPA"] ,
        registeredHours:getStudentData[0]["registerdHours"] ,
        gainedHours:getStudentData[0]["totalHours"] ,

          // finishedCourses: ,
          // leftCourses: ,

        Notes: [
      Note(
      reciver: getStudentData[0]["UserNotes"][0]["Reciver"],
      noteContent: getStudentData[0]["UserNotes"][0]["Text"],),
          Note(
            reciver: getStudentData[0]["UserNotes"][1]["Reciver"],
            noteContent: getStudentData[0]["UserNotes"][1]["Text"],),
          Note(
            reciver: getStudentData[0]["UserNotes"][2]["Reciver"],
            noteContent: getStudentData[0]["UserNotes"][2]["Text"],),
          Note(
            reciver: getStudentData[0]["UserNotes"][3]["Reciver"],
            noteContent: getStudentData[0]["UserNotes"][3]["Text"],),
  ],
        currentStudyCourses: [],
      ),
        ]
  );
  // Readings2(AD);
  // print("asdasdadafef");
  // print(AD.student[0].name);
  // print(AD.student[0].myScores);
  return Sultan;
}

  void  Readings2(AcademicAdvisor AD){
   print("gsfhsgdfg");
    print(AD.student);
   print("gsfhsgdfg");

  }
  List<dynamic> getAcademicAdvisor()  {
    FirebaseDatabase.instance.ref("AcademicAdvisor").orderByKey().onValue.listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as Map,);

      data.forEach((key, value) {
        log("$value");
      });
      // print(data);

      getAcademicAdvisorData = data.values.toList();
      // print(getAcademicAdvisorData);
      // print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      // print(getAcademicAdvisorData[0]["brief"]);
      // print(getAcademicAdvisorData[10][0]["name"]);
      // print(getAcademicAdvisorData);
    });

    return getAcademicAdvisorData;
  }

  List<dynamic> getStudent()  {
    FirebaseDatabase.instance.ref("Student").orderByKey().onValue.listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as Map,);

      data.forEach((key, value) {
        log("$value");
      });
      // print(data);

      getStudentData = data.values.toList();
      // print(getStudentData[0]["scoreRef"]);
      // print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      // print(getStudentData[0]["brief"]);
      // print(getStudentData[10][0]["name"]);
    });

    return getStudentData;
  }




}

 */