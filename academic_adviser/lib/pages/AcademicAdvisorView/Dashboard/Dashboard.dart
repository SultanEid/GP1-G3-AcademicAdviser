import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Student.dart';

import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DashboardWidget/AlertsWidget.dart';
import 'DashboardWidget/CoursesProgressWidget.dart';
import 'DashboardWidget/LevelTimeLineWidget.dart';
import 'DashboardWidget/NotesWidget.dart';
import 'DashboardWidget/ScoresWidget.dart';

class DashboardWidget extends StatelessWidget {
  DashboardWidget({Key? key , required this.student ,required this.user}) : super(key: key);
  Student student;
  AcademicAdvisor user;
  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus(
        [
      Container(
        alignment: Alignment.topCenter,
        width: 1920.w,
        //color: Colors.red[50],
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    // ProfileWidgetDB(student: student,),
                    Column(
                      children: [
                        ScoresDB(student: student,),
                        LevelTimeLineDB(),
                      ],
                    )
                  ],
                ),
                // AbsentsChartDB(students: student,),
                // ProgressWidgetDB(student: student,),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    NotesWidgetDB(student: student,),
                    AlertsWidgetDB(students: student,),
                  ],
                ),
                // ScheduleWidgetDB(student: student,),
              ],
            )
          ],
        ),
      )
    ],
      user: user,
    );
  }
}
