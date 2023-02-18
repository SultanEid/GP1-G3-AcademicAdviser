import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/Backgraound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/Reports.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/StudentList/StudentsList.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/MenuButton.dart';
import '../AcademicAdvisorView/Dashboard/Dashboard.dart';
import '../AcademicAdvisorView/Notes/Note.dart';
import '../AcademicAdvisorView/Profile/Profile.dart';
import '../AcademicAdvisorView/Scores/Scores.dart';
import '../Services/Authentication.dart';
import 'AAA_Icons_Pack.dart';

class ScaffoldPlus extends StatelessWidget {
  ScaffoldPlus(this.children, {required this.user,required this.themeConfig});
  final List<Widget> children;
  final AcademicAdvisor user;
  final ThemeConfig themeConfig;
  int _selectedtheme = 0;

  @override
  Widget build(BuildContext context) {
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
                        colors: [
                          Colors.black,
                          Colors.transparent
                        ]
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 28.h,),
                    Container(
                      width: 172.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Logos/LogoWithoutStrapline.png',
                              ),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    SizedBox(height: 36.5.h,),
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
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          width: 60.w,height: 25.h,
                                          decoration: BoxDecoration(
                                            color: _selectedtheme == 0? Colors.grey: Colors.grey.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: RawMaterialButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: _selectedtheme != 0? () {
                                              _selectedtheme = 0;
                                            }: (){},
                                            child: Text(
                                              'Acadimic',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Tajawal',
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          )
                                      )
                                  )),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          width: 60.w,height: 25.h,
                                          decoration: BoxDecoration(
                                            color: _selectedtheme == 1? Colors.grey: Colors.grey.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: RawMaterialButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: _selectedtheme != 1? () {
                                              _selectedtheme = 1;
                                            }: (){},
                                            child: Text(
                                              'Orginal',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Tajawal',
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          )
                                      )
                                  ))
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 3.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(255, 96, 220, 220),
                                  Color.fromARGB(255, 114, 72, 185)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 36.5.h,),
                    Divider(
                      color: Color.fromARGB(255, 162, 162, 162),
                      thickness: 1.5,
                      indent: 56.5.w,
                      endIndent: 56.5.w,
                    ),
                    Divider(
                      color: Color.fromARGB(255, 162, 162, 162),
                      thickness: 1.5,
                      indent: 56.5.w,
                      endIndent: 56.5.w,
                    ),
                    SizedBox(height: 23.5.h,),
                    MenuButton(buttonLabel:"Services",icon: Icons.view_list_rounded, route: Services(Advisor: user,), themeConfig: themeConfig,),
                    SizedBox(height: 21.h,),
                    MenuButton(buttonLabel:"Profile",icon: Icons.person,route: ProfilePage(user: user,), themeConfig: themeConfig),
                    SizedBox(height: 21.h,),
                    MenuButton(buttonLabel:"Dashboard",icon: Icons.dashboard, route: DashboardWidget(user: user,), themeConfig: themeConfig),
                    SizedBox(height: 21.h,),
                    MenuButton(buttonLabel:"Students' List",icon: Icons.list, route: StudentsListState(user: user,), themeConfig: themeConfig),
                    SizedBox(height: 21.h,),
                    MenuButton(buttonLabel:"Scores",icon: Icons.stacked_line_chart, route: ScoresWidget(user: user,), themeConfig: themeConfig),
                    SizedBox(height: 21.h,),
                    MenuButton(buttonLabel:"Notes",icon: Icons.edit_note_outlined, route: Notes(user: user,), themeConfig: themeConfig),
                    SizedBox(height: 21.h,),
                    MenuButton(buttonLabel:"Report",icon: Icons.library_books_outlined, route: Report(user: user,), themeConfig: themeConfig),
                    SizedBox(height: 21.h,),
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
              color: Color.fromARGB(255, 114, 72, 185), size: 34.sp),
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
                      child: Text("My profile"),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Sign out"),
                    ),
                  ];
                },
                onSelected: (value) async {
                  if (value == 0) {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(uid: FirebaseAuth.instance.currentUser?.uid)));
                  } else if (value == 1) {
                    await AuthService().SignOut();
                  }
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: children,
          alignment: Alignment.topCenter,
        )
    ),
      ],
    );
  }
}
