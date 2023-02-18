import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/Reports.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/Scores.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/ServicesWidget/ServicesCard.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/StudentList/StudentsList.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/Backgraound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Models/AcademicAdvisor.dart';
import '../../UniversalWidgetAA/MenuButton.dart';
import '../../Wrapper.dart';
import '../Dashboard/Dashboard.dart';
import '../Notes/Note.dart';
import '../Profile/Profile.dart';

class Services extends StatefulWidget {
  Services({required this.Advisor ,this.indecator});
  AcademicAdvisor Advisor;
  int? indecator;

  @override
  State<Services> createState() =>
      _Services(Advisor: Advisor);
}

class _Services extends State<Services> {
  _Services({required this.Advisor});
  AcademicAdvisor Advisor;
  late ThemeConfig themeConfig;
  LoadingData loadingData = LoadingData();


  @override
  Widget build(BuildContext context) {
    Advisor= loadingData.Readings();

    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (Advisor.theme! & themeConfig.theme) {
      Advisor.theme = themeConfig.theme;
      //DB
    }
    return Stack(
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
                                          Advisor.theme = false;
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
                                          Advisor.theme = true;
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
                        route: Services(
                          Advisor: Advisor,
                        ),
                        themeConfig: themeConfig,
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Profile",
                          icon: Icons.person,
                          route: ProfilePage(
                            user: Advisor,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Dashboard",
                          icon: Icons.dashboard,
                          route: DashboardWidget(
                            user: Advisor,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Students' List",
                          icon: Icons.list,
                          route: StudentsListState(
                            user: Advisor,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Scores",
                          icon: Icons.stacked_line_chart,
                          route: ScoresWidget(
                            user: Advisor,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Notes",
                          icon: Icons.edit_note_outlined,
                          route: Notes(
                            user: Advisor,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Report",
                          icon: Icons.library_books_outlined,
                          route: Report(
                            user: Advisor,
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
            iconTheme:
            IconThemeData(color: themeConfig.primaryColor, size: 34.sp),
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
                Container(padding: EdgeInsets.only(top: 10.h),alignment: Alignment.center,child: Text('Dr.${Advisor.firstName} ${Advisor.lastName}',style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'Tajawal',
                    color: themeConfig.servicesTitleColor),),),
              ],
            ),
          ),
          body: Container(
            width: 1920.w,
            alignment: Alignment.topCenter,
            child: Column(
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
                      color: themeConfig.servicesTitleColor,
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
                              Route: ProfilePage(
                                user: Advisor,
                              ),
                              children: [
                                TextSpan(
                                    text: 'profile',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                    ' is where you find all your academic information and certificates')
                              ],
                              icon: AAA_Icons_Pack.profile,
                              themeConfig: themeConfig),
                          SizedBox(
                            width: 29.w,
                          ),
                          ServicesCard(
                            label: 'Dashboard',
                            Route: DashboardWidget(
                              user: Advisor,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                  'summary for all activities, charts,  and  statistics in a single '),
                              TextSpan(
                                  text: 'dashboard',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ],
                            icon: AAA_Icons_Pack.dashboard,
                            themeConfig: themeConfig,
                          ),
                          SizedBox(
                            width: 29.w,
                          ),
                          ServicesCard(
                            label: 'Students\' List',
                            Route: StudentsListState(
                              user: Advisor,
                            ),
                            children: [
                              TextSpan(
                                  text: 'list',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' of all the students who  are under your supervising and their profiles')
                            ],
                            icon: AAA_Icons_Pack.student_list,
                            themeConfig: themeConfig,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ServicesCard(
                            label: 'Scores',
                            Route: ScoresWidget(
                              user: Advisor,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                  'evaluate   and   customize  your student\'s '),
                              TextSpan(
                                  text: 'scores',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' and skills')
                            ],
                            icon: AAA_Icons_Pack.graph,
                            themeConfig: themeConfig,
                          ),
                          SizedBox(
                            width: 29.w,
                          ),
                          ServicesCard(
                            label: 'Notes',
                            Route: Notes(
                              user: Advisor,
                            ),
                            children: [
                              TextSpan(text: 'write   '),
                              TextSpan(
                                  text: 'notes',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                  '   about   your students  for  them,  or for your-self')
                            ],
                            icon: AAA_Icons_Pack.note,
                            themeConfig: themeConfig,
                          ),
                          SizedBox(
                            width: 29.w,
                          ),
                          ServicesCard(
                            label: 'Report',
                            Route: Report(
                              user: Advisor,
                            ),
                            children: [
                              TextSpan(text: 'generate    '),
                              TextSpan(
                                  text: 'reports',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                  '    about one    of     your     students')
                            ],
                            icon: AAA_Icons_Pack.report,
                            themeConfig: themeConfig,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

