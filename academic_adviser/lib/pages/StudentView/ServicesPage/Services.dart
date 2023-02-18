import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/ServicesWidget/ServicesCard.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/StudentView/Dashboard/Dashboard.dart';
import 'package:academic_adviser/pages/StudentView/Notes/Note.dart';
import 'package:academic_adviser/pages/StudentView/Profile/Profile.dart';
import 'package:academic_adviser/pages/StudentView/Reports/Reports.dart';
import 'package:academic_adviser/pages/StudentView/Scores/Scores.dart';
import 'package:academic_adviser/pages/StudentView/StudentAcadimicAdvisorProfile/Profile.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/Backgraound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../UniversalWidgetAA/MenuButton.dart';
import '../../Wrapper.dart';
class StudentServices extends StatefulWidget{
  StudentServices({required this.student,this.indecator ,this.advisor});
  Student student;
  int? indecator;
  AcademicAdvisor? advisor;
  @override
  State<StatefulWidget> createState() => _StudentServices(student: student,indecator: indecator,advisor: advisor);

}
class _StudentServices extends State<StudentServices> {
  _StudentServices({required this.student,this.indecator,this.advisor});
  Student student;
  int? indecator;
  AcademicAdvisor? advisor;
  late ThemeConfig themeConfig;
  @override
  Widget build(BuildContext context) {
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (student.theme! & themeConfig.theme) {
      student.theme = themeConfig.theme;
      //DB
    }
    return Stack(
      children: [
        BackgroundWidget(themeConfig: themeConfig,),
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
                        route: StudentServices(
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
                          route: StudentProfile(
                            user: student,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Dashboard",
                          icon: Icons.dashboard,
                          route: StudentDashboardWidget(
                            student: student,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Advisor Profile",
                          icon: Icons.supervisor_account,
                          route: StudentAcadimicAdvisorProfile(
                            student: student,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Scores",
                          icon: Icons.stacked_line_chart,
                          route: StudentScoresWidget(
                            user: student,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Notes",
                          icon: Icons.edit_note_outlined,
                          route: StudentNotes(
                            user: student,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Report",
                          icon: Icons.library_books_outlined,
                          route: StudentReport(
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
            child: Stack(alignment: Alignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 383.63.w,
                    height: 106.93.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Logos/LogoWithoutStrapline.png',
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 41.1.h,
                  ),
                  Text(
                    'Our ServicesPage Features',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        color:  themeConfig.servicesTitleColor,
                        fontFamily: 'Tajawal'),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  Container(
                    width: 1267.w,
                    height: 619.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ServicesCard(
                              label: 'Profile',
                              Route: StudentProfile(user: student,indecator: 1,advisor: advisor,),
                              children:  [
                                TextSpan(
                                    text: 'profile',
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                    text: ' is where you find all your academic information, certificates, and student plan'
                                )
                              ],
                              icon: AAA_Icons_Pack.profile, themeConfig: themeConfig,
                            ),
                            SizedBox(width: 29.w,),
                            ServicesCard(
                              label: 'Dashboard',
                              Route: StudentDashboardWidget(student: student,indecator: 1,),
                              children:  [
                                TextSpan(
                                    text: 'summary for all activities, charts,  and  statistics in a single '
                                ),
                                TextSpan(
                                    text: 'dashboard',
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                              ],
                              icon: AAA_Icons_Pack.dashboard,themeConfig: themeConfig,
                            ),
                            SizedBox(width: 29.w,),
                            ServicesCard(
                              label: 'Advisor Profile',
                              Route: StudentAcadimicAdvisorProfile(student: student),
                              children:  [
                                TextSpan(
                                    text: 'your Academic Advisor\'s '
                                ),
                                TextSpan(
                                    text: 'profile',
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                              ],
                              icon: Icons.supervisor_account,themeConfig: themeConfig,
                            ),
                          ],
                        ),
                        SizedBox(height: 29.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ServicesCard(
                              label: 'Scores',
                              Route: StudentScoresWidget(user: student,),
                              children:  [
                                TextSpan(
                                    text: 'evaluate your '
                                ),
                                TextSpan(
                                    text: 'scores',
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                    text: ' and skills in statistics'
                                )
                              ],
                              icon: AAA_Icons_Pack.graph,themeConfig: themeConfig,
                            ),
                            SizedBox(width: 29.w,),
                            ServicesCard(
                              label: 'Notes',
                              Route: StudentNotes(user: student,),
                              children:  [
                                TextSpan(
                                    text: 'see   '
                                ),
                                TextSpan(
                                    text: 'notes',
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                    text: '   about   from your academic advisors'
                                )
                              ],
                              icon: AAA_Icons_Pack.note,themeConfig: themeConfig,
                            ),
                            SizedBox(width: 29.w,),
                            ServicesCard(
                              label: 'Report',
                              Route: StudentReport(user: student,),
                              children:  [
                                TextSpan(
                                    text: 'generate    '
                                ),
                                TextSpan(
                                    text: 'reports',
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                    text: '    about one    of     your-self'
                                )
                              ],
                              icon: AAA_Icons_Pack.report,themeConfig: themeConfig,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
