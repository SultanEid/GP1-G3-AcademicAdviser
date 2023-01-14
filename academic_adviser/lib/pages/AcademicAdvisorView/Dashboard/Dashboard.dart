import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Student.dart';
<<<<<<< Updated upstream
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/AbsentsWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/AlertsWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/LevelTimeLineWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/NotesWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/ProfileWidget.dart';
=======

>>>>>>> Stashed changes
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<< Updated upstream
import 'DashboardWidget/CoursesProgressWidget.dart';
import 'DashboardWidget/ScheduleWidget.dart';
import 'DashboardWidget/ScoresWidget.dart';

class DashboardWidget extends StatelessWidget {
  DashboardWidget({Key? key , required this.student}) : super(key: key);
  Student student;
  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus([
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                    ProfileWidgetDB(student: student,),
=======
                    // ProfileWidgetDB(student: student,),
>>>>>>> Stashed changes
                    Column(
                      children: [
                        ScoresDB(student: student,),
                        LevelTimeLineDB(),
                      ],
                    )
                  ],
                ),
<<<<<<< Updated upstream
                AbsentsChartDB(students: student,),
                ProgressWidgetDB(student: student,),
=======
                // AbsentsChartDB(students: student,),
                // ProgressWidgetDB(student: student,),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                ScheduleWidgetDB(student: student,),
=======
                // ScheduleWidgetDB(student: student,),
>>>>>>> Stashed changes
              ],
            )
          ],
        ),
      )
<<<<<<< Updated upstream
    ]);
=======
    ],
      user: user,
    );
>>>>>>> Stashed changes
  }
}
