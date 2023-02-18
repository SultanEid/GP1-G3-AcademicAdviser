import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/StudentView/Notes/Note/NoteCard.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/StudentView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import '../../../Models/Note.dart';
import '../../UniversalWidgetAA/Backgraound.dart';
import 'package:academic_adviser/pages/StudentView/Dashboard/Dashboard.dart';
import 'package:academic_adviser/pages/StudentView/Profile/Profile.dart';
import 'package:academic_adviser/pages/StudentView/Reports/Reports.dart';
import 'package:academic_adviser/pages/StudentView/Scores/Scores.dart';
import 'package:academic_adviser/pages/StudentView/StudentAcadimicAdvisorProfile/Profile.dart';
import '../../UniversalWidgetAA/MenuButton.dart';
import '../../Wrapper.dart';

class StudentNotes extends StatefulWidget {
  const StudentNotes({Key? key, required this.user}) : super(key: key);
  final Student user;
  @override
  State<StudentNotes> createState() => _NotesState(user: user);
}

class _NotesState extends State<StudentNotes> {
  _NotesState({Key? key, required this.user});
  final Student user;

  void RemoveAdvisorNotes(){
    List<Note> onlyStudentNotes = [];
    for(int i =0;i<user.notes!.length;i++){
      if(user.notes![i].receiver=="Student"){
        onlyStudentNotes.add(user.notes![i]);
      }
    }
    user.notes=onlyStudentNotes;
  }
  late ThemeConfig themeConfig;

  @override
  Widget build(BuildContext context) {
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (user.theme! & themeConfig.theme) {
      user.theme = themeConfig.theme;
      //DB
    }
    RemoveAdvisorNotes();

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
                          route: StudentServices(
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
                            route: StudentProfile(
                              user: user,
                            ),
                            themeConfig: themeConfig),
                        SizedBox(
                          height: 21.h,
                        ),
                        MenuButton(
                            buttonLabel: "Dashboard",
                            icon: Icons.dashboard,
                            route: StudentDashboardWidget(
                              student: user,
                            ),
                            themeConfig: themeConfig),
                        SizedBox(
                          height: 21.h,
                        ),
                        MenuButton(
                            buttonLabel: "Advisor Profile",
                            icon: Icons.supervisor_account,
                            route: StudentAcadimicAdvisorProfile(
                              student: user,
                            ),
                            themeConfig: themeConfig),
                        SizedBox(
                          height: 21.h,
                        ),
                        MenuButton(
                            buttonLabel: "Scores",
                            icon: Icons.stacked_line_chart,
                            route: StudentScoresWidget(
                              user: user,
                            ),
                            themeConfig: themeConfig),
                        SizedBox(
                          height: 21.h,
                        ),
                        MenuButton(
                            buttonLabel: "Notes",
                            icon: Icons.edit_note_outlined,
                            route: StudentNotes(
                              user: user,
                            ),
                            themeConfig: themeConfig),
                        SizedBox(
                          height: 21.h,
                        ),
                        MenuButton(
                            buttonLabel: "Report",
                            icon: Icons.library_books_outlined,
                            route: StudentReport(
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
                  Container(padding: EdgeInsets.only(top: 10.h),alignment: Alignment.center,child: Text('${user.firstName} ${user.lastName}',style: TextStyle(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 66.w,
                      height: 877.h,
                      margin: EdgeInsets.only(right: 10.w),
                      child: Column(
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
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => StudentServices(student: user,)!), (Route<dynamic> route) => false);
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
                        ],
                      ),
                    ),
                    Container(
                      width: 1541.5.w,
                      height: 877.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.sp)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Text(
                              'Notes'.toUpperCase(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 59.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: 1541.5.w,
                            height: 760.h,
                            child: user.notes!.length==1 ?Container(
                              margin: EdgeInsets.only(left: 20.w),
                              child: Text(
                                "No notes available",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  color: Colors.black45,
                                ),
                              ),) : GridView.builder(
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 479.w / 153.h,
                                ),
                                itemCount: user.notes!.length,
                                itemBuilder: (context, index) {

                                  return NoteCard(
                                    color: user.notes?[index].receiver == 'Myself'? Color.fromARGB(255, 180, 145, 250):Color.fromARGB(255, 254, 200, 113),
                                    reciver: user.notes?[index].receiver,
                                    noteContent: user.notes?[index].noteContent,
                                  );
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 76.w,
                    ),
                  ],
                )),
          ),
        ],
      );
  }
}
