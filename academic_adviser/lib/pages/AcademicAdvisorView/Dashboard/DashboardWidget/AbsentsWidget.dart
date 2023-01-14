import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Attendance.dart';
import 'package:academic_adviser/Models/Course.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AbsentsChartDB extends StatelessWidget {
  AbsentsChartDB({Key? key ,required this.students}) : super(key: key);
  Student students;
  // List<List<Course>> getCurrentStudyCourses;
  // List<Attendance> getAttendance;


  //
  // Student std = Student(
  //     currentStudyCourses: [
  //       Course(
  //         courseTitle: 'Computer Graphics',
  //         courseCode: 'CS',
  //         courseNumber: 451,
  //         courseHour: 4,
  //         level: 2,
  //         grade: 43,
  //       ),
  //       Course(
  //         courseTitle: 'Information Retrieval',
  //         courseCode: 'CS',
  //         courseNumber: 471,
  //         courseHour: 3,
  //         level: 8,
  //         grade: 75,
  //       ),
  //       Course(
  //         courseTitle: 'Graduation Project(1)',
  //         courseCode: 'CS',
  //         courseNumber: 491,
  //         courseHour: 1,
  //         level: 1,
  //         grade: 95,
  //       ),
  //       Course(
  //         courseTitle: 'Introduction To Oriental',
  //         courseCode: 'ORNT',
  //         courseNumber: 101,
  //         courseHour: 2,
  //         level: 12,
  //         grade: 71,
  //       ),
  //       Course(
  //         courseTitle: 'Islamic Studies',
  //         courseCode: 'GS',
  //         courseNumber: 101,
  //         courseHour: 2,
  //         level: 3,
  //         grade: 95,
  //       ),
  //       Course(
  //         courseTitle: 'Calculus(1)',
  //         courseCode: 'MATH',
  //         courseNumber: 203,
  //         courseHour: 3,
  //         level: 15,
  //         grade: 93,
  //       ),
  //     ],
  //     attendance: [
  //       Attendance(
  //           course: Course(
  //             courseTitle: 'Computer Graphics',
  //             courseCode: 'CS',
  //             courseNumber: 451,
  //             courseHour: 4,
  //             level: 2,
  //             grade: 43,
  //           ),
  //           absentsPercentage: 13
  //       ),
  //       Attendance(
  //           course: Course(
  //             courseTitle: 'Information Retrieval',
  //             courseCode: 'CS',
  //             courseNumber: 471,
  //             courseHour: 3,
  //             level: 8,
  //             grade: 75,
  //           ),
  //           absentsPercentage: 15
  //       ),
  //       Attendance(
  //           course: Course(
  //             courseTitle: 'Graduation Project(1)',
  //             courseCode: 'CS',
  //             courseNumber: 491,
  //             courseHour: 1,
  //             level: 1,
  //             grade: 95,
  //           ),
  //           absentsPercentage: 1
  //       ),
  //       Attendance(
  //           course: Course(
  //             courseTitle: 'Introduction To Oriental',
  //             courseCode: 'ORNT',
  //             courseNumber: 101,
  //             courseHour: 2,
  //             level: 12,
  //             grade: 71,
  //           ),
  //           absentsPercentage: 3
  //       ),
  //       Attendance(
  //           course: Course(
  //             courseTitle: 'Islamic Studies',
  //             courseCode: 'GS',
  //             courseNumber: 101,
  //             courseHour: 2,
  //             level: 3,
  //             grade: 95,
  //           ),
  //           absentsPercentage: 26
  //       ),
  //       Attendance(
  //           course: Course(
  //             courseTitle: 'Calculus(1)',
  //             courseCode: 'MATH',
  //             courseNumber: 203,
  //             courseHour: 3,
  //             level: 15,
  //             grade: 93,
  //           ),
  //           absentsPercentage: 9
  //       ),
  //     ]);

  List<Color> colors = [
    Color.fromARGB(255, 96, 220, 220),
    Color.fromARGB(255, 114, 72, 185),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          color: Color.fromARGB(255, 1, 4, 41),),
        height: 172.h,
        width: 1106.w,
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 7.w),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Absents (%)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),),
            Expanded(child: Container(
              padding: EdgeInsets.only(
                right: 10.w,
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 1, 4, 41),
                  borderRadius: BorderRadius.circular(30.sp)),
              height: 172.h,
              width: 1070.w,
              child: chart(context),
            ),)
          ],
        ),);
  }

  Widget chart(BuildContext context) {
    return BarChart(
        BarChartData(
          borderData: FlBorderData(
              show: true,
              border: Border(
                  bottom: BorderSide(
                    color: Color(0xff2a2747), width: 1,
                  )
              )),
          gridData: FlGridData(
              show: true,
              horizontalInterval: 5,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Color(0xff2a2747),
                );
              }
          ),
          titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                  getTextStyles: (context, num) {
                    return TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                        fontSize: 15.sp
                    );
                  },
                  showTitles: true,
                  margin: 10.h,
                  getTitles: (value) {
                    String title = '';
                    if(value == value as int){
                      title = '${students.currentStudyingCourses[value as int].courseCode} ${students.currentStudyingCourses[value as int].courseNumber}';
                    }
                    return title;
                  }
              ),
              leftTitles: SideTitles(
                  interval: 5,
                  getTextStyles: (context, num) {
                    return TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                      fontSize: 15.sp
                    );
                  },
                  showTitles: true,
                  margin: 10.w,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return '0';
                      case 5:
                        return '5';
                      case 10:
                        return '10';
                      case 15:
                        return '15';
                      case 20:
                        return '20';
                      case 25:
                        return '25';
                      case 30:
                        return '30';
                    }
                    return '';
                  })),
          alignment: BarChartAlignment.center,
          minY: 0,
          maxY: 35,
          groupsSpace: ((1085.w -
              (students.currentStudyingCourses.length * (16.w))) /
              students.currentStudyingCourses.length).w,
          barTouchData: BarTouchData(enabled: true),
          barGroups: students.currentStudyingCourses
              .asMap()
              .entries
              .map((entry) {
            return BarChartGroupData(
                x: entry.key,
                barRods: [
                  BarChartRodData(
                      y: students.currentStudyingCourses[entry.key].attendance!.absentsPercentage,
                      width: 16.w,
                      colors: students.currentStudyingCourses[entry.key].attendance!.absentsPercentage >
                          20
                          ? [Color.fromARGB(255, 252, 85, 119)]
                          : colors,
                      gradientColorStops: [
                        0,
                       students.currentStudyingCourses[entry.key].attendance!.absentsPercentage / 35
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2))
                  )
                ]
            );
          }).toList(),
        )
    );
  }
}

