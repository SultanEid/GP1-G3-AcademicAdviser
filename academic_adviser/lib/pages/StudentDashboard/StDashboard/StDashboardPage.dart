import 'package:academic_adviser/pages/StudentDashboard/StDashboardWidgets/AlertsWidget.dart';
import 'package:academic_adviser/pages/StudentDashboard/StDashboardWidgets/GradesWidget.dart';
import 'package:academic_adviser/pages/StudentDashboard/StDashboardWidgets/NotesWidget.dart';
import 'package:academic_adviser/pages/StudentDashboard/StDashboardWidgets/ProfileCardWidget.dart';
import 'package:academic_adviser/pages/StudentDashboard/StDashboardWidgets/ProgressWidget.dart';
import 'package:academic_adviser/pages/StudentDashboard/StDashboardWidgets/SkillWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StDashboardPage extends StatefulWidget {
  const StDashboardPage({Key? key}) : super(key: key);

  @override
  _StDashboardPageState createState() => _StDashboardPageState();
}

class _StDashboardPageState extends State<StDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 114, 72, 185),
                Color.fromARGB(255, 96, 220, 220),
              ]
            )
          ),
          child: Column(
            children: [
              Row(
                children: [
                  StdProfileCard(),
                  Column(//skills and Progress
                    children: [
                      SkillWidget(),
                      GradesWidget()
                    ],
                  ),
                  StdAlertsCard(),
                ],
              ),
              Row(
                children: [
                  ProgressWidget(),
                  NotesWidtget(),
                ],
              )
            ],
          ),
        )
        ),
      );
  }
}
