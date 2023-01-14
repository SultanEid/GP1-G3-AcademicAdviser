import 'dart:collection';

import 'package:academic_adviser/Models/Course.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressWidgetDB extends StatelessWidget {
  ProgressWidgetDB({required this.student});
  Student student;


  List<Color> colors = [
    Color.fromARGB(255, 212, 220, 96),
    Color.fromARGB(255, 124, 220, 96),
    Color.fromARGB(255, 220, 96, 96),
    Color.fromARGB(255, 96, 220, 220),
    Color.fromARGB(255, 114, 72, 185),
  ];

  late List<String> courseCodes = [];
  late Map<String, List<int>> levelMap = {};
  late Map<List<int>, List<int>> gradeMap = {};
/*
  void analyseFinishedCourses() {
    for (int i = 0; i < student.finishedCourses.length; i++) {
      courseCodes.add(student.finishedCourses[i].courseCode);
      if (!levelMap.containsKey(student.finishedCourses[i].courseCode)) {
        levelMap[student.finishedCourses[i].courseCode] = [
          student.finishedCourses[i].level
        ];
      } else {
        levelMap[student.finishedCourses[i].courseCode] =
            List.from(levelMap[student.finishedCourses[i].courseCode]!)
              ..addAll([student.finishedCourses[i].level]);
      }
    }

    for (int i = 0; i < student.finishedCourses.length; i++) {
      if (!gradeMap
          .containsKey(levelMap[student.finishedCourses[i].courseCode])) {
        gradeMap[levelMap[student.finishedCourses[i].courseCode]!] = [
          student.finishedCourses[i].grade as int
        ];
      } else {
        gradeMap[levelMap[student.finishedCourses[i].courseCode]!] = List
            .from(gradeMap[levelMap[student.finishedCourses[i].courseCode]!]!)
          ..addAll([student.finishedCourses[i].grade as int]);
      }
    }
    courseCodes = courseCodes.toSet().toList();
    removeLevelDuplication();
  }

  void removeLevelDuplication() {
    List<String> courseCodesTemp = courseCodes;
    Map<String, List<int>> levelMapTemp = {};
    Map<List<int>, List<int>> gradeMapTemp = {};
    for (int i = 0; i < courseCodes.length; i++) {
      List<int> newLevelList = []..addAll(levelMap[courseCodes[i]]!);
      List<int> newGradeList = []..addAll(gradeMap[levelMap[courseCodes[i]]]!);
      List<int> tempList = []..addAll(levelMap[courseCodes[i]]!);
      for (int j = 0; j < tempList.length + 0; j++) {
        for (int k = 0; k < tempList.length + 0; k++) {
          List<int> tempGradeList = []
            ..addAll(gradeMap[levelMap[courseCodes[i]]]!);
          if (j == k) {
            continue;
          }
          if (tempList[j] == tempList[k]) {
            newGradeList[j] = ((newGradeList[j] + tempGradeList[k]) / 2) as int;
          }
        }
      }

      Map<int, int> tempLevelGrade = {
        for (int l = 0; l < newLevelList.length; l++)
          newLevelList[l]: newGradeList[l]
      };
      newLevelList.sort();

      newLevelList = newLevelList.toSet().toList();

      List<int> tempGradesort = [
        for (int number in newLevelList) tempLevelGrade[number]!
      ];
      newGradeList = []..addAll(tempGradesort);
      levelMapTemp[courseCodesTemp[i]] = newLevelList;
      gradeMapTemp[[]..addAll(levelMapTemp[courseCodesTemp[i]]!)] =
          newGradeList;
    }

    courseCodes = courseCodes;
    levelMap = levelMapTemp;
    gradeMap = gradeMapTemp;
  }


 */
  @override
  Widget build(BuildContext context) {
    //analyseFinishedCourses();
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.sp)),
        height: 172.h,
        width: 1106.w,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: 10.w,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1, 4, 41),
                      borderRadius: BorderRadius.circular(30.sp)),
                  height: 172.h,
                  width: 1106.w,
                  child: chart(context),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.w, top: 10.h),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  alignment: Alignment.centerRight,
                  width: 96.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.sp),
                      color: Colors.white.withAlpha(180)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: courseCodes.asMap().entries.map((entry) {
                      return GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  courseCodes[entry.key],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10.w),
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.sp),
                                color: colors[entry.key % colors.length],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    height: 172.h,
                    width: 1106.w,
                    padding: EdgeInsets.only(top: 6.h),
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Courses Progress',
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20.sp,
                          color: Colors.white.withAlpha(180),
                          fontWeight: FontWeight.bold),
                    )
                )
              ],
            ),
          ],
        ));
  }

  Widget chart(BuildContext context) {
    return LineChart(LineChartData(
      gridData: FlGridData(
          show: true,
          horizontalInterval: 20,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color(0xff2a2747),
            );
          }
      ),
      minX: 0,
      maxX: 16,
      minY: 0,
      maxY: 130,
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              getTextStyles: (context, num) {
                return TextStyle(
                  color: Colors.white,
                  fontFamily: 'Tajawal',
                );
              },
              rotateAngle: 45,
              showTitles: true,
              margin: 5.h,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return 'L1';
                  case 2:
                    return 'L2';
                  case 3:
                    return 'L3';
                  case 4:
                    return 'L4';
                  case 5:
                    return 'L5';
                  case 6:
                    return 'L6';
                  case 7:
                    return 'L7';
                  case 8:
                    return 'L8';
                  case 9:
                    return 'L9';
                  case 10:
                    return 'L10';
                  case 11:
                    return 'L11';
                  case 12:
                    return 'L12';
                  case 13:
                    return 'L13';
                  case 14:
                    return 'L14';
                  case 15:
                    return 'L15';
                }
                return '';
              }),
          leftTitles: SideTitles(
              getTextStyles: (context, num) {
                return TextStyle(
                  color: Colors.white,
                  fontFamily: 'Tajawal',
                );
              },
              showTitles: true,
              margin: 5.w,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 0:
                    return '0';
                  case 20:
                    return '20';
                  case 40:
                    return '40';
                  case 60:
                    return '60';
                  case 80:
                    return '80';
                  case 100:
                    return '100';
                }
                return '';
              })),
      borderData: FlBorderData(
          show: true,
          border: Border(
              bottom: BorderSide(
                color: Color(0xff2a2747), width: 1,
              )
          )),
      lineBarsData: courseCodes.asMap().entries.map((entry) {
        List<FlSpot>? spotsPoints = [];
        spotsPoints =
            levelMap[courseCodes[entry.key]]?.asMap().entries.map((subEntry) {
          var tempGradKeys = gradeMap.keys;
          return FlSpot(
              levelMap[courseCodes[entry.key]]![subEntry.key] as double,
              gradeMap[tempGradKeys.toList()[entry.key]]![subEntry.key]
                  as double);
        }).toList();
        spotsPoints?.insert(
            0,
            FlSpot(
                0, gradeMap[gradeMap.keys.toList()[entry.key]]![0] as double));
        return LineChartBarData(
            spots: spotsPoints,
            dotData: FlDotData(show: true),
            isCurved: true,
            colors: [
              colors[entry.key % colors.length],
            ],
            barWidth: 5.sp,
            belowBarData: BarAreaData(
                show: true,
                colors: [colors[entry.key % colors.length].withAlpha(100)]));
      }).toList(),
    ));
  }
}
