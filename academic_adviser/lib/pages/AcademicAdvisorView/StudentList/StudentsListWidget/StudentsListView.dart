import 'package:academic_adviser/pages/StudentView/Profile/Profile.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Models/AcademicAdvisor.dart';
class StudentsListView extends StatelessWidget {
  StudentsListView({Key? key, required this.advisor, required this.themeConfig,this.indecator});
  AcademicAdvisor advisor;
  final ThemeConfig themeConfig;
  int? indecator;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: advisor.student.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Container(
              width: 1352.w,
              height: 83.h,
              decoration: BoxDecoration(
                  color: themeConfig.studentsListCardColor, borderRadius: BorderRadius.circular(6)),
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
                      '${advisor.student[index].firstName} ${advisor.student[index].lastName}',
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
                      '${advisor.student[index].academicID}',
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
                      '${advisor.student[index].gpa}',
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
                      '${advisor.student[index].totalHours}',
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
                      '${advisor.student[index].registeredHours}',
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
                    margin: EdgeInsets.only(left: 10.w),
                    width: 140.w,
                    height: 47.h,
                    child: ElevatedButton(
                        onPressed: () { Navigator.push(context ,MaterialPageRoute(builder: (context) => StudentProfile(user: advisor.student[index],indecator: 0,advisor: advisor,)));},
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
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.sp),
                              )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              themeConfig.studentListButton
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

