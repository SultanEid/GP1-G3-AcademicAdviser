
import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/StudentView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import '../../AcademicAdvisorView/Dashboard/Dashboard.dart';
import '../../AcademicAdvisorView/Dashboard/DashboardWidget/AbsentsWidget.dart';
import '../../AcademicAdvisorView/Dashboard/DashboardWidget/AlertsWidget.dart';
import '../../AcademicAdvisorView/Dashboard/DashboardWidget/CoursesProgressWidget.dart';
import '../../AcademicAdvisorView/Dashboard/DashboardWidget/LevelTimeLineWidget.dart';
import '../../AcademicAdvisorView/Dashboard/DashboardWidget/NotesWidget.dart';
import '../../AcademicAdvisorView/Dashboard/DashboardWidget/ScheduleWidget.dart';
import '../../AcademicAdvisorView/Dashboard/DashboardWidget/ScoresWidget.dart';
import '../../AcademicAdvisorView/Notes/Note.dart';
import '../../AcademicAdvisorView/Profile/Profile.dart';
import '../../AcademicAdvisorView/Reports/Reports.dart';
import '../../AcademicAdvisorView/Scores/Scores.dart';
import '../../AcademicAdvisorView/ServicesPage/Services.dart';
import '../../AcademicAdvisorView/StudentList/StudentsList.dart';
import '../../UniversalWidgetAA/Backgraound.dart';
import 'package:academic_adviser/pages/StudentView/Notes/Note.dart';
import 'package:academic_adviser/pages/StudentView/Profile/Profile.dart';
import 'package:academic_adviser/pages/StudentView/Reports/Reports.dart';
import 'package:academic_adviser/pages/StudentView/Scores/Scores.dart';
import 'package:academic_adviser/pages/StudentView/StudentAcadimicAdvisorProfile/Profile.dart';
import '../../UniversalWidgetAA/MenuButton.dart';
import '../../Wrapper.dart';
class StudentDashboardWidget extends StatefulWidget {
  StudentDashboardWidget({Key? key , required this.student,this.advisor,this.indecator}) : super(key: key);
  Student student;
  AcademicAdvisor? advisor;
  int? indecator;

  @override
  State<StatefulWidget> createState() => _StudentDashboardWidget(student: student,advisor: advisor,indecator: indecator);

}
class _StudentDashboardWidget extends State<StudentDashboardWidget> {
  _StudentDashboardWidget({Key? key , required this.student,this.advisor,this.indecator});
  Student student;
  AcademicAdvisor? advisor;
  int? indecator;
  late ThemeConfig themeConfig;
  @override
  Widget build(BuildContext context) {
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (student.theme! & themeConfig.theme) {
      student.theme = themeConfig.theme;
      //DB
    }
    return
      Stack(
        children: [
          BackgroundWidget(
            themeConfig: themeConfig,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              drawer: SizedBox(
                width: 513.w,
                child: Drawer(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 513.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 28.h,
                          ),
                          Container(
                            width: 172.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/Logos/LogoWithoutStrapline.png',
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            height: 36.5.h,
                          ),
                          Divider(
                            color: Color.fromARGB(255, 162, 162, 162),
                            thickness: 1.5,
                            indent: 56.5.w,
                            endIndent: 56.5.w,
                          ),
                          SizedBox(
                            height: 36.5.h,
                          ),
                          SizedBox(
                            width: 444.w,
                            height: 34.h,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'App Theme',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.sp,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Original',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Tajawal',
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                      width: 20.w,
                                      height: 20.h,
                                      child: RawMaterialButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          if (themeConfig.theme) {
                                            setState(() {
                                              student.theme = false;
                                              themeConfig.orginalTheme();
                                              themeConfig.updateShouldNotify(themeConfig);
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 19.w,
                                          height: 19.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(4.sp),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 1.sp),
                                          ),
                                          child: Container(
                                            width: 15.w,
                                            height: 15.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(4.sp),
                                              color: !themeConfig.theme
                                                  ? themeConfig.primaryColor
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                      'Acadimic',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Tajawal',
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                      width: 20.w,
                                      height: 20.h,
                                      child: RawMaterialButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          if (!themeConfig.theme) {
                                            setState(() {
                                              student.theme = true;
                                              themeConfig.acadimicTheme();
                                              themeConfig.updateShouldNotify(
                                                  themeConfig);
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 19.w,
                                          height: 19.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(4.sp),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                width: 1.sp),
                                          ),
                                          child: Container(
                                            width: 15.w,
                                            height: 15.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(4.sp),
                                              color: themeConfig.theme
                                                  ? themeConfig.primaryColor
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 3.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: themeConfig.primaryGradientColor,
                                    ),
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36.5.h,
                          ),
                          Divider(
                            color: Color.fromARGB(255, 162, 162, 162),
                            thickness: 1.5,
                            indent: 56.5.w,
                            endIndent: 56.5.w,
                          ),
                          SizedBox(
                            height: 23.5.h,
                          ),
                          MenuButton(
                            buttonLabel: "Services",
                            icon: Icons.view_list_rounded,
                            route:  indecator==0 ? Services(Advisor: advisor!): StudentServices(
                              student: student,
                            ),
                            themeConfig: themeConfig,
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          MenuButton(
                              buttonLabel: "Profile",
                              icon: Icons.person,
                              route:  indecator==0 ? ProfilePage(user: advisor!) : StudentProfile(
                                user: student,
                              ),
                              themeConfig: themeConfig),
                          SizedBox(
                            height: 21.h,
                          ),
                          MenuButton(
                              buttonLabel: "Dashboard",
                              icon: Icons.dashboard,
                              route: indecator==0 ? DashboardWidget(user: advisor!) : StudentDashboardWidget(
                                student: student,
                              ),
                              themeConfig: themeConfig),
                          SizedBox(
                            height: 21.h,
                          ),
                          MenuButton(
                              buttonLabel: indecator==0  ? "Students' List" : "Advisor profile",
                              icon: indecator==0  ?  Icons.list : Icons.supervisor_account,
                              route: indecator==0 ? StudentsListState(user: advisor!) :StudentAcadimicAdvisorProfile(
                                student: student,
                              ),
                              themeConfig: themeConfig),
                          SizedBox(
                            height: 21.h,
                          ),
                          MenuButton(
                              buttonLabel: "Scores",
                              icon: Icons.stacked_line_chart,
                              route: indecator==0 ? ScoresWidget(user: advisor!) : StudentScoresWidget(
                                user: student,
                              ),
                              themeConfig: themeConfig),
                          SizedBox(
                            height: 21.h,
                          ),
                          MenuButton(
                              buttonLabel: "Notes",
                              icon: Icons.edit_note_outlined,
                              route: indecator==0 ? Notes(user: advisor!) : StudentNotes(
                                user: student,
                              ),
                              themeConfig: themeConfig),
                          SizedBox(
                            height: 21.h,
                          ),
                          MenuButton(
                              buttonLabel: "Report",
                              icon: Icons.library_books_outlined,
                              route:  indecator==0 ? Report(user: advisor!) : StudentReport(
                                user: student,
                              ),
                              themeConfig: themeConfig),
                          SizedBox(
                            height: 21.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              appBar: AppBar(
                toolbarHeight: 78.h,
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                    color: themeConfig.primaryColor, size: 34.sp),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      icon: Icon(
                        AAA_Icons_Pack.profile,
                        color: Colors.white,
                        size: 45.sp,
                      ),
                      offset: Offset(0, 50),
                      elevation: 0,
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Text("Sign out"),
                          ),
                        ];
                      },
                      onSelected: (value) async {
                        if (value == 0) {
                          await AuthService().SignOut();
                          setState(() {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Wrapper()), (Route<dynamic> route) => false);
                          });
                        }
                      },
                    ),
                    Container(padding: EdgeInsets.only(top: 10.h),alignment: Alignment.center,child: Text('${student.firstName} ${student.lastName}',style: TextStyle(
                        fontSize: 30.sp,
                        fontFamily: 'Tajawal',
                        color: themeConfig.servicesTitleColor),),)
                  ],
                ),
              ),
              body: Container(
                alignment: Alignment.topCenter,
                width: 1920.w,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                              width: 420.w,
                              height: 485.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30.sp))),
                              child: Column(
                                children: [
                                  Container(
                                    width: 200.w,
                                    height: 200.h,
                                    margin: EdgeInsets.only(top: 20.h),
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      backgroundColor: themeConfig.primaryColor,
                                      radius: 100.sp,
                                      child: student.profile.profileAvatar == null
                                          ?
                                      CircleAvatar(
                                          backgroundColor: Color.fromARGB(255, 75, 75, 75),
                                          radius: 95.sp,
                                          child: Icon(
                                            AAA_Icons_Pack.profile,
                                            size: 95.sp,
                                            color: Colors.white,
                                          ))
                                          : CircleAvatar(
                                        backgroundImage:
                                        AssetImage(student.profile.profileAvatar!),
                                        backgroundColor: Colors.white10,
                                        radius: 95.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15.h),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${student.firstName.toUpperCase()} ${student.lastName.toUpperCase()}',
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                  Text(
                                    student.gpa.toStringAsFixed(2) + ' | ' + student.profile.role,
                                    style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        color: themeConfig.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.h),
                                    alignment: Alignment.center,
                                    width: 250.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              info('Finished Credits', student.totalHours.toString()),
                                              info('Registered Credits',
                                                  student.registeredHours.toString()),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                info('ID', student.academicID),
                                                info('Total Credits', student.totalHours.toString()),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8.h),
                                    width: 96.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: Color.fromARGB(255, 112, 112, 112),
                                                    width: 2)),
                                            child: Builder(
                                                builder: (context) => IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  icon: Icon(
                                                    Icons.phone,
                                                    size: 20.sp,
                                                    color: Color.fromARGB(255, 112, 112, 112),
                                                  ),
                                                  onPressed: () {
                                                    Clipboard.setData(
                                                        ClipboardData(text: student.phone));
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        student.phone + ' Copied!',
                                                        style: TextStyle(fontFamily: 'Tajawal'),
                                                      ),
                                                    ));
                                                  },
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: Color.fromARGB(255, 112, 112, 112),
                                                    width: 2)),
                                            child: Builder(
                                                builder: (context) => IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  icon: Center(
                                                    child: Icon(
                                                      Icons.email,
                                                      size: 20.sp,
                                                      color: Color.fromARGB(255, 112, 112, 112),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Clipboard.setData(
                                                        ClipboardData(text: student.academicEmail));
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        student.academicEmail + ' Copied!',
                                                        style: TextStyle(fontFamily: 'Tajawal'),
                                                      ),
                                                    ));
                                                  },
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8.h),
                                    width: 60.w,
                                    height: 20.h,
                                    child: RawMaterialButton(
                                      onPressed: () {
                                      },
                                      child: Text(
                                        'Read More',
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: themeConfig.primaryColor,
                                            fontSize: 11.sp),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8.h),
                                    child: Divider(
                                      indent: 60.w,
                                      endIndent: 60.w,
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ScoresDB(student: student, themeConfig: themeConfig,),
                                LevelTimeLineDB(student: student, themeConfig: themeConfig,),
                              ],
                            )
                          ],
                        ),

                        AbsentsChartDB(students: student,isReport: false,),
                        ProgressWidgetDB(student: student,),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            NotesWidgetDB(student: student, isAdvisorView: false),
                            AlertsWidgetDB(students: student),
                          ],
                        ),
                        ScheduleWidgetDB(student: student,themeConfig: themeConfig,),
                      ],
                    )
                  ],
                ),
              )
          ),
        ],
      );
  }
}
