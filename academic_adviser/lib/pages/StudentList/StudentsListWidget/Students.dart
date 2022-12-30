import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Models/StudentData.dart';
import '../../UniversalWidget/AAA_Icons_Pack.dart';
class Students extends StatefulWidget {
  const Students({Key? key}) : super(key: key);

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  List<String> StudentsUID = [];
  var StudentsListData = [];
  bool time = false;

  void getStudents() async {

   await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).collection("StudentList").doc("StudentData").get().then((Snapshot) {
      for (String Student in Snapshot.data()?["students"]) {
        setState(() {
          if (!StudentsUID.contains(Student)) {
            StudentsUID.add(Student);

            print(StudentsUID);
            FirebaseFirestore.instance
                .collection("StudentList")
                .doc(Student)
                .get()
                .then((StudentSnapshot) {
              StudentsListData.add(StudentData(
                name: StudentSnapshot["Name"],
                studentId: StudentSnapshot["studentId"],
                GPA: StudentSnapshot["GPA"],
                CH: StudentSnapshot["CH"],
                RH: StudentSnapshot["RH"],
              ));
              print(StudentData().name.toString());
            }); }  });
      }
    });
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
      super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    getStudents();
    print(StudentsListData);
    return ListView.builder(
        itemCount: StudentsUID.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Container(
              width: 1352.w,
              height: 83.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    width: 58.w,
                    height: 58.h,
                    child: Icon(
                      AAA_Icons_Pack.profile,
                      color: Colors.white,
                      size: 44.sp,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 75, 75, 75)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    width: 316.w,
                    child: SelectableText(
                      StudentsListData[index].name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6.w),
                    width: 215.w,
                    child: SelectableText(
                      StudentsListData[index].studentId,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.w),
                    width: 150.w,
                    child: SelectableText(
                      StudentsListData[index].GPA,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7.w),
                    width: 136.w,
                    child: SelectableText(
                      StudentsListData[index].CH,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7.w),
                    width: 136.w,
                    child: SelectableText(
                      StudentsListData[index].RH,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 45.w),
                    width: 47.w,
                    height: 47.h,
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Icon(
                        AAA_Icons_Pack.chat,
                        color: Colors.white,
                        size: 26.sp,
                      ),
                      shape: CircleBorder(),
                      fillColor: Color.fromARGB(255, 113, 99, 192),
                    ),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    width: 140.w,
                    height: 47.h,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 25.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(24.sp),
                              )),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 113, 99, 192),
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }
}
