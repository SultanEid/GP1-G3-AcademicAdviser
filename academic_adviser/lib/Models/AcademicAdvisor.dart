import 'dart:developer';
import 'package:academic_adviser/Models/Office.dart';
import 'package:academic_adviser/Models/OfficeHours.dart';
import 'package:academic_adviser/Models/Profile.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/Models/AAAUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AcademicAdvisor extends AAAUser {
  late List<Student> _student;
  Office? _office;
  List<OfficeHours>? _officeHoures;

  AcademicAdvisor({
    required String uid,
    required String firstName,
    required String lastName,
    required String academicID,
    required String academicEmail,
    required String phone,
    required Profile profile,
    required List<Student> student,
    Office? office,
    List<OfficeHours>? officeHoures,
  })  : _student = student,
        _office = office,
        _officeHoures = officeHoures,
        super(
          uid: uid,
          firstName: firstName,
          lastName: lastName,
          academicID: academicID,
          academicEmail: academicEmail,
          phone: phone,
          profile: profile,
        );

  List<Student> get student => _student;

  set student(List<Student> value) {
    _student = value;
  }

  Office? get office => _office;

  set office(Office? value) {
    _office = value;
  }

  List<OfficeHours>? get officeHoures => _officeHoures;

  set officeHoures(List<OfficeHours>? value) {
    _officeHoures = value;
  }

//========================================================================================
  static List<dynamic> AllData = [];

  List<dynamic> getData() {
    FirebaseDatabase.instance
        .ref("AcademicAdvisor/${FirebaseAuth.instance.currentUser!.uid}")
        .orderByKey()
        .onValue
        .listen((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );

      data.forEach((key, value) {
        log("$value");
      });
      print(data);

      AllData = data.values.toList();
      print(AllData);
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      print(AllData[0]["brief"]);
      print(AllData[10][0]["name"]);
    });

    return AllData;
  }
}
