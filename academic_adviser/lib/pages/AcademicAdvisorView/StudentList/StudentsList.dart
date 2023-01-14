<<<<<<< Updated upstream
=======
<<<<<<<< Updated upstream:academic_adviser/lib/pages/AcademicAdvisorView/StudentList/StudentsList.dart
import 'package:academic_adviser/Models/AcademicAdvisor.dart';
>>>>>>> Stashed changes
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'StudentsListWidget/StudentsListView.dart';

class StudentsList extends StatefulWidget {
<<<<<<< Updated upstream
  const StudentsList({Key? key, required this.studentList}) : super(key: key);
  final List<Student> studentList;

  @override
  State<StudentsList> createState() => _StudentsListState(studentList: studentList);
}

class _StudentsListState extends State<StudentsList> {
  _StudentsListState({Key? key, required this.studentList}) ;
  final List<Student> studentList;
  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus([
=======
   StudentsList({Key? key, required this.studentList ,required this.user}) : super(key: key);
  final List<Student> studentList;
  AcademicAdvisor user;
  @override
  State<StudentsList> createState() => _StudentsListState(studentList: studentList, user: user);
}

class _StudentsListState extends State<StudentsList> {
  _StudentsListState({Key? key, required this.studentList ,required this.user}) ;
  final List<Student> studentList;
  AcademicAdvisor user;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus(
        [
>>>>>>> Stashed changes
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
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    'TH',
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
              child: StudentsListView(studentList: studentList,),
            )
                  ]
              )
      ),
<<<<<<< Updated upstream
    ]
    );
  }
}
=======
    ],
      user: user,
    );
  }
}
========

>>>>>>>> Stashed changes:academic_adviser/lib/pages/StudentList/StudentsList.dart
>>>>>>> Stashed changes
