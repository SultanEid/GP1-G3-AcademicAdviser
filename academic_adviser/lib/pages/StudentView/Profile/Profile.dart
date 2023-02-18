import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/StudentView/Profile/ProfileWidget/BrifeWidget.dart';
import 'package:academic_adviser/pages/StudentView/Profile/ProfileWidget/CertificatesWidget.dart';
import 'package:academic_adviser/pages/StudentView/Profile/ProfileWidget/StudentPlanWidget.dart';
import 'package:academic_adviser/pages/StudentView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../AcademicAdvisorView/Dashboard/Dashboard.dart';
import '../../AcademicAdvisorView/Notes/Note.dart';
import '../../AcademicAdvisorView/Profile/Profile.dart';
import '../../AcademicAdvisorView/Reports/Reports.dart';
import '../../AcademicAdvisorView/Scores/Scores.dart';
import '../../AcademicAdvisorView/StudentList/StudentsList.dart';
import '../../UniversalWidgetAA/Backgraound.dart';
import '../../Wrapper.dart';
import 'ProfileWidget/ProfileWidget.dart';
import 'package:academic_adviser/pages/StudentView/Dashboard/Dashboard.dart';
import 'package:academic_adviser/pages/StudentView/Notes/Note.dart';
import 'package:academic_adviser/pages/StudentView/Reports/Reports.dart';
import 'package:academic_adviser/pages/StudentView/Scores/Scores.dart';
import 'package:academic_adviser/pages/StudentView/StudentAcadimicAdvisorProfile/Profile.dart';
import '../../UniversalWidgetAA/MenuButton.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({Key? key, required this.user, this.advisor,this.advisorStudent ,this.indecator}) : super(key: key);
  AcademicAdvisor? advisor;
  Student? user;
  Student? advisorStudent;
  int? indecator;
  @override
  State<StudentProfile> createState() => _StudentProfileState(
    user: user!,
    advisor: advisor,
    advisorStudent: advisorStudent,
    indecator: indecator,
  );
}


class _StudentProfileState extends State<StudentProfile> {
  _StudentProfileState({required this.user , this.advisor ,this.advisorStudent,this.indecator});
  AcademicAdvisor? advisor;
  Student user;
  Student? advisorStudent;
  int? indecator;
  CarouselController _carouselController = CarouselController();
  int _current = 0;
  late ThemeConfig themeConfig;
  @override
  Widget build(BuildContext context) {

    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (user.theme! & themeConfig.theme) {
      user.theme = themeConfig.theme;
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
                                          user.theme = false;
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
                                          user.theme = true;
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
                          student: user,
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
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Dashboard",
                          icon: Icons.dashboard,
                          route: indecator==0 ? DashboardWidget(user: advisor!) : StudentDashboardWidget(
                            student: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: indecator==0  ? "Students' List" : "Advisor profile",
                          icon: Icons.list,
                          route: indecator==0 ? StudentsListState(user: advisor!) :StudentAcadimicAdvisorProfile(
                            student: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Scores",
                          icon: Icons.stacked_line_chart,
                          route: indecator==0 ? ScoresWidget(user: advisor!) : StudentScoresWidget(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Notes",
                          icon: Icons.edit_note_outlined,
                          route: indecator==0 ? Notes(user: advisor!) : StudentNotes(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Report",
                          icon: Icons.library_books_outlined,
                          route:  indecator==0 ? Report(user: advisor!) : StudentReport(
                            user: user,
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
                Container(padding: EdgeInsets.only(top: 10.h),alignment: Alignment.center,child: Text('${widget.indecator != 0? '': 'Dr.'}${widget.indecator != 0? user.firstName: advisor!.firstName} ${widget.indecator != 0? user.lastName: advisor!.lastName}',style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'Tajawal',
                    color: themeConfig.servicesTitleColor),),)
              ],
            ),
          ),
          body: Container(
              width: 1920.w,
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        height: 1920.w,
                        viewportFraction: 0.82,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: [
                      Container(
                        width: 1542.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfileWidget(
                              user: user,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CertificatesWidget(user: user),
                                SizedBox(
                                  width: 15.w,
                                ),
                                BrifeWidget(brief: user.profile.brief),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 1542.w,
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              indecator==0 ? StudentPlanWidget(user: user!, advisor: advisor!,themeConfig: themeConfig,) : StudentPlanWidget(user: user, advisor: user.academicAdvisor!,themeConfig: themeConfig,)
                            ],
                          )
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      width: 1920.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 66.w,
                            height: 66.h,
                            margin: EdgeInsets.only(bottom: 10.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.sp)
                            ),
                            child: RawMaterialButton(
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                indecator==0 ?  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Services(Advisor: advisor!,indecator: indecator,)), (Route<dynamic> route) => false) : Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => StudentServices(student: user,advisor: advisor,)!), (Route<dynamic> route) => false);
                              },
                              child: ShaderMask(
                                child: SizedBox(
                                  width: 36.w * 1.2,
                                  height: 36.h * 1.2,
                                  child: Icon(
                                    AAA_Icons_Pack.home,
                                    size: 36.sp,
                                    color: Colors.white,
                                  ),
                                ),

                                shaderCallback: (Rect bounds) {
                                  final Rect rect = Rect.fromLTRB(0, 0, 36.w, 36.h);
                                  return LinearGradient(colors: themeConfig.primaryGradientColor).createShader(rect);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1618.w,
                            height: 889.h,
                          ),
                        ],
                      )),
                ],
              )
          ),
        ),
      ],
    );
  }
}
