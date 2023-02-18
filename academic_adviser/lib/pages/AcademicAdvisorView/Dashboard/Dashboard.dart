import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/AbsentsWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/AlertsWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/LevelTimeLineWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/NotesWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Notes/Note.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Profile/Profile.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/Reports.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/Scores.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/StudentList/StudentsList.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../StudentView/Profile/Profile.dart';
import '../../UniversalWidgetAA/AAA_Icons_Pack.dart';
import '../../UniversalWidgetAA/MenuButton.dart';
import '../../UniversalWidgetAA/Backgraound.dart';
import '../../Wrapper.dart';
import '../ServicesPage/Services.dart';
import 'DashboardWidget/CoursesProgressWidget.dart';
import 'DashboardWidget/ScheduleWidget.dart';
import 'DashboardWidget/ScoresWidget.dart';

class DashboardWidget extends StatefulWidget {
  DashboardWidget({Key? key , required this.user,this.selectedStudent}) : super(key: key);
  final AcademicAdvisor user;
  int? selectedStudent;
  @override
  State<DashboardWidget> createState() =>_DashboardWidget(user: user);

}
class _DashboardWidget extends State<DashboardWidget> {
  _DashboardWidget({Key? key , required this.user});
  final AcademicAdvisor user;
  late ThemeConfig themeConfig;
  int selectedStudent = 0;

  @override
  Widget build(BuildContext context) {
    if(widget.selectedStudent != null){
      selectedStudent = widget.selectedStudent!;
    }
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (user.theme! & themeConfig.theme) {
      user.theme = themeConfig.theme;
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
                      Divider(
                        color: Color.fromARGB(255, 162, 162, 162),
                        thickness: 1.5,
                        indent: 56.5.w,
                        endIndent: 56.5.w,
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
                                Text(
                                  'Original',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Tajawal',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 10.w,),
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
                                          themeConfig
                                              .updateShouldNotify(themeConfig);
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
                                          BorderRadius.circular(
                                              4.sp),
                                          color: !themeConfig.theme? themeConfig.primaryColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w,),
                                Text(
                                  'Acadimic',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Tajawal',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 10.w,),
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
                                          color:  themeConfig.theme? themeConfig.primaryColor: Colors.transparent,
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
                      SizedBox(height: 36.5.h,),
                      Divider(
                        color: Color.fromARGB(255, 162, 162, 162),
                        thickness: 1.5,
                        indent: 56.5.w,
                        endIndent: 56.5.w,
                      ),
                      SizedBox(height: 23.5.h,),
                      MenuButton(buttonLabel:"Services",icon: Icons.view_list_rounded, route: Services(Advisor: user,), themeConfig: themeConfig,),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Profile",icon: Icons.person,route: ProfilePage(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Dashboard",icon: Icons.dashboard, route: DashboardWidget(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Students' List",icon: Icons.list, route: StudentsListState(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Scores",icon: Icons.stacked_line_chart, route: ScoresWidget(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Notes",icon: Icons.edit_note_outlined, route: Notes(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Report",icon: Icons.library_books_outlined, route: Report(user: user,),themeConfig: themeConfig),
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
                Container(padding: EdgeInsets.only(top: 10.h),alignment: Alignment.center,child: Text('Dr.${user.firstName} ${user.lastName}',style: TextStyle(
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
                                  child: user.student[selectedStudent].profile.profileAvatar == null
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
                                    AssetImage(user.student[selectedStudent].profile.profileAvatar!),
                                    backgroundColor: Colors.white10,
                                    radius: 95.sp,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15.h),
                                alignment: Alignment.center,
                                child: Text(
                                  '${user.student[selectedStudent].firstName.toUpperCase()} ${user.student[selectedStudent].lastName.toUpperCase()}',
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                              ),
                              Text(
                                user.student[selectedStudent].gpa.toStringAsFixed(2) + ' | ' + user.student[selectedStudent].profile.role,
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
                                          info('Finished Credits', user.student[selectedStudent].totalHours.toString()),
                                          info('Registered Credits',
                                              user.student[selectedStudent].registeredHours.toString()),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            info('ID', user.student[selectedStudent].academicID),
                                            info('Total Credits', user.student[selectedStudent].totalHours.toString()),
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
                                                    ClipboardData(text: user.student[selectedStudent].phone));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    user.student[selectedStudent].phone + ' Copied!',
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
                                                    ClipboardData(text: user.student[selectedStudent].academicEmail));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    user.student[selectedStudent].academicEmail + ' Copied!',
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
                              Tooltip(
                                preferBelow: true,
                                verticalOffset: -40.h,
                                message: "Navigate to student profile",
                                waitDuration: Duration(microseconds: 1500),
                                child: Container(
                                  margin: EdgeInsets.only(top: 8.h),
                                  width: 60.w,
                                  height: 20.h,
                                  child: RawMaterialButton(
                                    onPressed: () { Navigator.push(context ,MaterialPageRoute(builder: (context) => StudentProfile(user: user.student[selectedStudent],indecator: 0,advisor: user,)));},
                                    child: Text(
                                      'Read More',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: themeConfig.primaryColor,
                                          fontSize: 11.sp),
                                    ),
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
                                    Container(
                                      margin: EdgeInsets.only(top: 8.h),
                                      width: 96.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Tooltip(
                                              preferBelow: true,
                                              verticalOffset: -40.h,
                                              message: "Previous student",
                                              waitDuration: Duration(microseconds: 1500),
                                              child: Container(
                                                width: 40.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.transparent,),
                                                child: Builder(
                                                    builder: (context) => IconButton(
                                                      padding: EdgeInsets.all(0),
                                                      icon: Icon(
                                                        Icons.arrow_left,
                                                        size: 40.sp,
                                                        color: Color.fromARGB(255, 112, 112, 112),
                                                      ),
                                                      onPressed: () {
                                                        //data
                                                        if(selectedStudent  > 0){
                                                            setState(() {
                                                              selectedStudent = selectedStudent -1;
                                                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DashboardWidget(user: user,selectedStudent:selectedStudent)!), (Route<dynamic> route) => false);
                                                            });
                                                        }
                                                      },
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Tooltip(
                                              preferBelow: true,
                                              verticalOffset: -40.h,
                                              message: "Next student",
                                              waitDuration: Duration(microseconds: 1500),
                                              child: Container(
                                                width: 40.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.transparent,
                                                ),
                                                child: Builder(
                                                    builder: (context) => IconButton(
                                                      padding: EdgeInsets.all(0),
                                                      icon: Icon(
                                                        Icons.arrow_right_outlined,
                                                        size: 40.sp,
                                                        color: Color.fromARGB(255, 112, 112, 112),
                                                      ),
                                                      onPressed: () {
                                                        //data
                                                        if(selectedStudent < user.student.length-1){
                                                          setState(() {
                                                            selectedStudent  = selectedStudent +1;
                                                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DashboardWidget(user: user,selectedStudent:selectedStudent)!), (Route<dynamic> route) => false);
                                                          });
                                                        }
                                                      },
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ScoresDB(student: user.student[selectedStudent], themeConfig: themeConfig,),
                            LevelTimeLineDB(student: user.student[selectedStudent], themeConfig: themeConfig,),
                          ],
                        )
                      ],
                    ),
                    AbsentsChartDB(students: user.student[selectedStudent],isReport: false,),
                     ProgressWidgetDB(student: user.student[selectedStudent],),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        NotesWidgetDB(student: user.student[selectedStudent] ,selectedStudent: selectedStudent,advisor: user,isAdvisorView: true),
                        AlertsWidgetDB(students: user.student[selectedStudent],),
                      ],
                    ),
                    ScheduleWidgetDB(student: user.student[selectedStudent],themeConfig: themeConfig,),
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

class info extends StatelessWidget {
  String text;
  String value;

  info(String this.text, String this.value);

  @override
  Widget build(BuildContext context) {
    var short =
    text.split(' ').length > 1 ? text[0] + text.split(' ')[1][0] : text;
    return Tooltip(
      preferBelow: true,
      verticalOffset: -5.h,
      message: text + ': ' + value,
      child: Text(
        short + ' : ' + value,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: 'Tajawal',
            color: Color.fromARGB(255, 112, 112, 112),
            fontSize: 20.sp),
      ),
    );
  }
}