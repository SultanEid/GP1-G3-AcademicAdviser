import 'package:academic_adviser/Database/Database.dart';
import 'package:academic_adviser/Models/StudentData.dart';
import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/pages/StudentList/StudentsListWidget/StudentsListCard.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:duration_button/duration_button.dart';

import 'StudentsListWidget/Students.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({Key? key}) : super(key: key);

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }



  String hintText = 'sort by';
  // List<String> Students = TheUser().Students;
  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus([
      Container(
        width: 1920.w,
        height: 925.h,
        alignment: Alignment.topCenter,
        color: Color.fromARGB(255, 227, 225, 225),
      ),
      Container(
          margin: EdgeInsets.only(top: 20.h),
          height: 874.h,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: 1352.w,
              height: 83.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 98.w,
                  ),
                  SelectableText(
                    'student name',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 30.sp,
                        color: Color.fromARGB(255, 74, 73, 73),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 142.w,
                  ),
                  SelectableText(
                    'student id',
                      textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 30.sp,
                        color: Color.fromARGB(255, 74, 73, 73),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 90.w,
                  ),
                  SelectableText(
                    'GPA',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 30.sp,
                        color: Color.fromARGB(255, 74, 73, 73),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 125.w,
                  ),
                  SelectableText(
                    'CH',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 30.sp,
                        color: Color.fromARGB(255, 74, 73, 73),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 104.w,
                  ),
                  SelectableText(
                    'RH',
                      textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 30.sp,
                        color: Color.fromARGB(255, 74, 73, 73),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 169.w,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 28.h),
              height: 763.h,
              width: 1352.w,
              child: Students(),
            )
          ])),
    ]);
  }
}
