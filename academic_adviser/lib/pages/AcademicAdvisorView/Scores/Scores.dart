import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Profile/Profile.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/ScoresWidget/ScoreDescription.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/ScoresWidget/ScoresSummaryTopCard.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/Wrapper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../Models/AcademicAdvisor.dart';
import '../../../Models/Course.dart';
import '../../../Models/Student.dart';
import '../../ThemeConfigA.dart';
import '../../UniversalWidgetAA/AAA_Icons_Pack.dart';
import '../../UniversalWidgetAA/Backgraound.dart';
import '../../UniversalWidgetAA/MenuButton.dart';
import '../Dashboard/Dashboard.dart';
import '../Notes/Note.dart';
import '../Reports/Reports.dart';
import '../ServicesPage/Services.dart';
import '../StudentList/StudentsList.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class ScoresWidget extends StatefulWidget {
  ScoresWidget({Key? key, required this.user}) : super(key: UniqueKey());
  AcademicAdvisor user;
  @override
  State<ScoresWidget> createState() => _ScoresState(user: user);
}

class _ScoresState extends State<ScoresWidget> {
  _ScoresState({
    Key? key,
    required this.user,
  });

  AcademicAdvisor user;
  int _current = 1;
  String scoreName = '';
  String scoreDescription = '';
  int badPercent = 1;
  int goodPercent = 1;
  List<double> advisorAvgScoreOuteer = [];
  LoadingData loadingData = LoadingData();
  late ThemeConfig themeConfig;
  List<double> coursesPercentageSelectedByAdvisor = [];
  List<String> allSelectedCoursesTemp = [];
  Function? slideGaugeAfterRemoving;

  List<Color> colors = [
    Color.fromARGB(255, 114, 72, 185),
    Color.fromARGB(255, 96, 220, 220),
    Color.fromARGB(255, 232, 135, 50),
    Color.fromARGB(255, 72, 185, 154),
    Color.fromARGB(255, 159, 72, 185),
    Color.fromARGB(255, 158, 177, 72),
  ];

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    if(user.student[0].score!.length==1){
      _current=0;
    }
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (user.theme! & themeConfig.theme) {
      user.theme = themeConfig.theme;
      //DB
    }
    setState(() {
      user = loadingData.Readings();
      calculateTotalStudentsScores();
    });
    setState(() {});

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
                                  'Academic',
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
                          Advisor: user,
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
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Dashboard",
                          icon: Icons.dashboard,
                          route: DashboardWidget(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Students' List",
                          icon: Icons.list,
                          route: StudentsListState(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Scores",
                          icon: Icons.stacked_line_chart,
                          route: ScoresWidget(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Notes",
                          icon: Icons.edit_note_outlined,
                          route: Notes(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Report",
                          icon: Icons.library_books_outlined,
                          route: Report(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: RawMaterialButton(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Services(
                                        Advisor: user,
                                      )!),
                                      (Route<dynamic> route) => false);
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
                                final Rect rect =
                                Rect.fromLTRB(0, 0, 36.w, 36.h);
                                return LinearGradient(
                                    colors:
                                    themeConfig.primaryGradientColor)
                                    .createShader(rect);
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 66.w,
                          height: 66.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: RawMaterialButton(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              try {
                                if (user.student[0].score?.length as int > 7) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor:
                                    Color.fromARGB(255, 248, 76, 76),
                                    content: Text(
                                      'Error: Reach Maximum Number of Scores',
                                      style: TextStyle(fontFamily: 'Tajawal'),
                                    ),
                                  ));
                                } else {
                                  allSelectedCoursesTemp.clear();
                                  coursesPercentageSelectedByAdvisor.clear();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddScore(
                                            user: user,
                                            allSelectedCoursesTemp:
                                            allSelectedCoursesTemp,
                                            coursesPercentageSelectedByAdvisor:
                                            coursesPercentageSelectedByAdvisor,
                                            scoreName: scoreName,
                                            scoreDescription:
                                            scoreDescription,
                                            current: _current,
                                            inceacesCurrent: () {
                                              if (user.student[0].score!
                                                  .length ==
                                                  2) _current++;
                                            },
                                            Refresh:
                                                (AcademicAdvisor newuser) {
                                              setState(() {});
                                            },
                                            Calculate: () {},
                                          )));
                                }
                              } on Exception catch (e) {
                                print(e);
                              }
                            },
                            child: ShaderMask(
                              child: SizedBox(
                                width: 36.w * 1.2,
                                height: 36.h * 1.2,
                                child: Icon(
                                  Icons.add,
                                  size: 36.sp,
                                  color: Colors.white,
                                ),
                              ),
                              shaderCallback: (Rect bounds) {
                                final Rect rect =
                                Rect.fromLTRB(0, 0, 36.w, 36.h);
                                return LinearGradient(
                                    colors:
                                    themeConfig.primaryGradientColor)
                                    .createShader(rect);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 1542.w,
                      child: Column(
                        children: [
                          SizedBox(
                              width: 1542.w,
                              height: 304.h,
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        width: 1542.w,
                                        height: 262.h,
                                        alignment: Alignment.topCenter,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(30.sp)),
                                        child: Text(
                                          'Scores',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36.sp,
                                              fontFamily: 'Tajawal',
                                              color: Color.fromARGB(
                                                  255, 112, 112, 112)),
                                        ),
                                      ),
                                      Container(
                                        width: 1542.w,
                                        height: 312.h,
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          width: 1542.w,
                                          height: 312.h,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 1542.w,
                                                height: 250.h,
                                                child: user.student[0].score![0].scoreName == "Empty" && user.student[0].score!.length == 1
                                                    ? Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      top: 125.h),
                                                  child: Text(
                                                    "No scores available",
                                                    textAlign:
                                                    TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 50.sp,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      fontFamily:
                                                      'Tajawal',
                                                      color:
                                                      Colors.black45,
                                                    ),
                                                  ),
                                                )
                                                    : CarouselSlider.builder(
                                                  carouselController:
                                                  _controller,
                                                  options:
                                                  CarouselOptions(
                                                      enlargeCenterPage:
                                                      true,
                                                      enableInfiniteScroll:
                                                      false,
                                                      height: 1542.w,
                                                      viewportFraction:
                                                      0.19,
                                                      onPageChanged:
                                                          (index,
                                                          reason) {
                                                        setState(() {
                                                          _current =
                                                              index +
                                                                  1;
                                                        });
                                                      }),
                                                  itemCount: user
                                                      .student[0]
                                                      .score!
                                                      .length -
                                                      1,
                                                  itemBuilder:
                                                      (BuildContext
                                                  context,
                                                      int index,
                                                      int realIndex) {
                                                    index++;
                                                    return ScoresSummaryTopCard(
                                                      title: user
                                                          .student[0]
                                                          .score![index]
                                                          .scoreName,
                                                      percent:
                                                      advisorAvgScoreOuteer[
                                                      index],
                                                      color: colors[index %
                                                          colors.length],
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: List.generate(user.student[0].score!.length-1, (index) => index)
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                  setState(() {});
                                                  return GestureDetector(
                                                      onTap: () => _controller
                                                          .animateToPage(
                                                          entry.key),
                                                      child: Container(
                                                          margin:
                                                          EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                          ),
                                                          width: 28.w,
                                                          height: 28.h,
                                                          decoration:
                                                          BoxDecoration(
                                                            shape:
                                                            BoxShape.circle,
                                                            color: Color
                                                                .fromARGB(
                                                                255,
                                                                238,
                                                                238,
                                                                238)
                                                                .withOpacity(
                                                                _current-1 ==
                                                                    entry.key
                                                                    ? 1
                                                                    : 0.7),
                                                          )));
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 47.h,
                          ),
                          user.student[0].score![0].scoreName == "Empty" &&
                              user.student[0].score!.length == 1
                              ? Container(
                            width: 1542.w,
                            height: 526.h,
                            decoration: BoxDecoration(color:Colors.white ,borderRadius: BorderRadius.all(Radius.circular(30.sp))),
                          )
                              : ScoreDescription(
                            score: user.student[0].score![_current],
                            advisorScore: advisorAvgScoreOuteer[_current],
                            color: colors[_current % colors.length],
                            stdList: user.student,
                            current: _current,
                            deleteScore: () {
                              RemoveScoreFromDB(user.student, _current);
                              if (user.student[0].score!.length ==
                                  _current) {
                                _current--;
                              }
                              setState(() {});
                            },
                            themeConfig: themeConfig,
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 76.w,
                  ),
                ],
              )),
        ),
      ],
    );
  }

  void RemoveScoreFromDB(List<Student> students, int current) {
    for (int i = 0; i < students.length; i++) {
      final studentRemoveScoresRef = FirebaseDatabase.instance
          .ref("Student")
          .child(students[i].uid)
          .child("scoreRef")
          .child(students[i].score![current].scoreID!);
      students[i].score!.removeAt(current);
      studentRemoveScoresRef.remove();
    }
  }

  void calculateTotalStudentsScores() {
    double totalStudentsScores = 0;

    for (int i = 0; i < user.student[0].score!.length; i++) {
      for (int s = 0; s < user.student.length; s++) {
        totalStudentsScores += user.student[s].score![i].score!;
      }
      totalStudentsScores = totalStudentsScores / user.student.length;
      advisorAvgScoreOuteer.insert(i, totalStudentsScores);
      totalStudentsScores = 0;
    }
  }

}

class AddScore extends StatefulWidget {
  AddScore(
      {Key? key,
        required this.user,
        required this.allSelectedCoursesTemp,
        required this.coursesPercentageSelectedByAdvisor,
        required this.scoreName,
        required this.scoreDescription,
        required this.Refresh,
        required this.Calculate,
        required this.current,
        required this.inceacesCurrent})
      : super(key: UniqueKey());
  AcademicAdvisor user;
  int current;

  String scoreName;
  String scoreDescription;
  Function(AcademicAdvisor newuser) Refresh;
  VoidCallback Calculate;
  VoidCallback inceacesCurrent;
  List<double> coursesPercentageSelectedByAdvisor;

  List<String> allSelectedCoursesTemp;

  @override
  State<AddScore> createState() => _AddScoreState(
    user: user,
    allSelectedCoursesTemp: allSelectedCoursesTemp,
    coursesPercentageSelectedByAdvisor: coursesPercentageSelectedByAdvisor,
    scoreName: scoreName,
    scoreDescription: scoreDescription,
    Refresh: Refresh,
    Calculate: Calculate,
    current: current,
    inceacesCurrent: inceacesCurrent,
  );
}

class _AddScoreState extends State<AddScore> {
  _AddScoreState(
      {Key? key,
        required this.user,
        required this.allSelectedCoursesTemp,
        required this.coursesPercentageSelectedByAdvisor,
        required this.scoreName,
        required this.scoreDescription,
        required this.Refresh,
        required this.Calculate,
        required this.current,
        required this.inceacesCurrent});

  AcademicAdvisor user;
  int current;
  VoidCallback inceacesCurrent;

  String scoreName;
  String scoreDescription;
  double selectedGoodPercent = 70;
  double selectedBadPercent = 40;
  double scoreAffect = 0;
  double sumOfAllAffect = 0;
  String errorMsg = "";
  Function(AcademicAdvisor newuser) Refresh;
  VoidCallback Calculate;
  List<double> coursesPercentageSelectedByAdvisor;
  List<String> allSelectedCoursesTemp;
  Map<String, double> coursesPercentage = {};
  //=================================
  String scoreCoursePercentTF = '';
  String scoreCourseNameTF = '';
  String scoreCourseNumberTF = '';
  List<String> scoreCoursePercentT = [];
  List<String> scoreCourseNameT = [];
  List<String> scoreCourseNumberT = [];
  List<Course> unFinishedCourses = [];
  //=================================
  late ThemeConfig themeConfig;
  List<Student> calculateScore(List<Student> students) {
    for (int s = 0; s < students.length; s++) {
      for (int i = 0; i < students[s].score![students[s].score!.length - 1].scoreCourses.length; i++) {
        for (int j = 0; j < students[s].finishedCourses.length; j++) {
          if (!students[s].finishedCourses.contains(students[s].score![students[s].score!.length - 1].scoreCourses[i])) {
            unFinishedCourses.add(students[s].score![students[s].score!.length - 1].scoreCourses[i]);
          }
        }
      }
    }

    for (int s = 0; s < students.length; s++) {
      Map<Course, double> matchingCourses = {};

      for (int i = 0; i < students[s].score![students[s].score!.length - 1].scoreCourses.length; i++) {
        for (int j = 0; j < students[s].finishedCourses.length; j++) {
          if (students[s].score![students[s].score!.length - 1].scoreCourses[i].courseID == students[s].finishedCourses[j].courseID) {
            matchingCourses[students[s].finishedCourses[j]] = students[s].score![students[s].score!.length - 1].coursesPercentage[i];
          }
        }
      }

      double totalScore = 0;

      for (int unFinishedCoursesIndex = 0; unFinishedCoursesIndex < unFinishedCourses.length; unFinishedCoursesIndex++) {
        matchingCourses.remove(unFinishedCourses[unFinishedCoursesIndex]);
      }

      for (int matchingCoursesIndex = 0; matchingCoursesIndex < matchingCourses.length; matchingCoursesIndex++) {
        totalScore += (matchingCourses.keys.toList()[matchingCoursesIndex].grade * matchingCourses.values.toList()[matchingCoursesIndex]);
      }

      students[s].score![students[s].score!.length - 1].score = totalScore / 100;

      totalScore = 0;
    }

    return students;
  }

  double shapePointerValue = 30;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
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
                Container(padding: EdgeInsets.only(top: 10.h),alignment: Alignment.center,child: Text('Dr.${user.firstName} ${user.lastName}',style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'Tajawal',
                    color: themeConfig.servicesTitleColor),),),
              ],
            ),
          ),
          body: Container(
              alignment: Alignment.topCenter,
              width: 1920.w,
              child: Container(
                width: 1542.w,
                height: 877.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 20.h),
                            alignment: Alignment.center,
                            child: Text(
                              'Add Score',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 59.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1428.w,
                      child: Column(
                        children: [
                          Container(
                            width: 1428.w,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Display Info.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontFamily: 'Tajawal',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Form(
                      key: _key,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 71.h,
                            width: 308.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.sp)),
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value!.isEmpty || value==null){
                                  return 'Score Name is empty!';
                                }
                                return null;
                              },
                              onChanged: (scoreNameValue) {
                                scoreName = scoreNameValue;
                              },
                              decoration: InputDecoration(
                                labelText: "scoreName",
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: themeConfig.primaryColor)),
                                hintText: "English",
                                fillColor: Colors.white,
                                floatingLabelStyle:
                                TextStyle(color: themeConfig.primaryColor),
                              ),
                              autofocus: false,
                            ),
                          ),
                          SizedBox(
                            width: 100.h,
                          ),
                          Container(
                            height: 71.h,
                            width: 308.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.sp)),
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value!.isEmpty || value==null){
                                  return 'Score Description is empty!';
                                }
                                return null;
                              },
                              onChanged: (scoreDescriptionValue) {
                                scoreDescription = scoreDescriptionValue;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: themeConfig.primaryColor)),
                                labelText: "scoreDescription",
                                hintText: "English score description",
                                fillColor: Colors.white,
                                floatingLabelStyle:
                                TextStyle(color: themeConfig.primaryColor),
                              ),
                              autofocus: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Container(
                      width: 1428.w,
                      child: Column(
                        children: [
                          Container(
                            width: 1428.w,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Indicators Info.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontFamily: 'Tajawal',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      width: 1428.w,
                      child: Text(
                        'Specify bad, good and excellent score:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 1428.w,
                      child: SfLinearGauge(
                        minimum: 0.0,
                        maximum: 100.0,
                        ranges: [
                          LinearGaugeRange(
                            startValue: 0,
                            endValue: 100,
                            color: Color.fromARGB(255, 152, 226, 103),
                          ),
                        ],
                        markerPointers: [
                          LinearShapePointer(
                            value: selectedGoodPercent,
                            onChanged: (value) {
                              if (value > (selectedBadPercent + 2.5)) {
                                setState(() {
                                  selectedGoodPercent = value;
                                });
                              }
                            },
                            color: Color.fromARGB(255, 169, 209, 142),
                          ),
                          LinearShapePointer(
                              value: selectedBadPercent,
                              color: Color.fromARGB(255, 209, 142, 142),
                              onChanged: (value) {
                                if (value < (selectedGoodPercent - 2.5)) {
                                  setState(() {
                                    selectedBadPercent = value;
                                  });
                                }
                              }),
                        ],
                        barPointers: [
                          LinearBarPointer(
                            value: selectedGoodPercent,
                            color: Color.fromARGB(255, 169, 209, 142),
                          ),
                          LinearBarPointer(
                            value: selectedBadPercent,
                            color: Color.fromARGB(255, 209, 142, 142),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      width: 400.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Bad',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 12.sp,
                                      color: Colors.black),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 5.w, bottom: 2.h),
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      color:
                                      Color.fromARGB(255, 209, 142, 142)),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Good',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 12.sp,
                                      color: Colors.black),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 5.w, bottom: 2.h),
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      color:
                                      Color.fromARGB(255, 169, 209, 142)),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Excellent',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 12.sp,
                                      color: Colors.black),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 5.w, bottom: 2.h),
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      color:
                                      Color.fromARGB(255, 152, 226, 103)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 1428.w,
                      child: Column(
                        children: [
                          Container(
                            width: 1428.w,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Score Details.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontFamily: 'Tajawal',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                    //============================
                    SizedBox(
                      height: 20.h,
                    ),
                    //==============================
                    Container(
                      width: 1428.w,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200.h,
                            width: 650.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.sp)),
                            ),
                            child: SingleChildScrollView(
                              child: Table(
                                columnWidths: {1:FractionColumnWidth(0.2),2:FractionColumnWidth(0.1),3:FractionColumnWidth(0.1),4:FractionColumnWidth(0.1),5:FractionColumnWidth(0.1),},
                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                border: TableBorder.all(
                                    borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                                    width: 1.sp, color: Colors.black),
                                children: user.planCourses.asMap().entries.map((e) {
                                  return TableRow(
                                      children: [
                                        Text("${user.planCourses[e.key].courseTitle}",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                                        Text("${user.planCourses[e.key].courseCode}",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                                        Text("${user.planCourses[e.key].courseNumber}",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                                        Text("${user.planCourses[e.key].courseHour}",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: themeConfig.primaryColor,
                                          value: coursesPercentage.containsKey(
                                              user.planCourses[e.key].courseID),
                                          onChanged: (bool? selectedCouresValue) {
                                            setState(() {
                                              if (selectedCouresValue!) {
                                                if (!coursesPercentage.containsKey(
                                                    user.planCourses[e.key]
                                                        .courseID)) {
                                                  coursesPercentage[user
                                                      .planCourses[e.key]
                                                      .courseID] = 0.0;
                                                  selectedCouresValue = true;
                                                } else {
                                                  print("does contain");
                                                }
                                              } else if (coursesPercentage
                                                  .containsKey(user
                                                  .planCourses[e.key].courseID)) {
                                                coursesPercentage.remove(
                                                    user.planCourses[e.key].courseID);

                                                selectedCouresValue = false;
                                              } else {
                                                print("doesn't contain");
                                              }
                                              allSelectedCoursesTemp =
                                                  coursesPercentage.keys.toList();
                                            });
                                          },
                                        ),
                                      ]);
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Container(
                            height: 200.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                            ),
                            child: DynamicHeightGridView(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                itemCount: coursesPercentage.keys.length,
                                builder: (BuildContext context, int index) {

                                  return Container(
                                    margin: EdgeInsets.only(left: 5.w),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (scoreAffectValue) {
                                        setState(() {
                                          scoreAffect =
                                          double.tryParse(scoreAffectValue)!;

                                          coursesPercentage[
                                          allSelectedCoursesTemp[index]] =
                                              scoreAffect;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelText: allSelectedCoursesTemp[index],
                                        hintText: "E.g. 45",
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: themeConfig.primaryColor)),
                                        floatingLabelStyle: TextStyle(
                                            color: themeConfig.primaryColor),
                                      ),
                                      autofocus: false,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 1428.w,
                      child: Divider(
                        height: 1.h,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      child: Text(
                        '${errorMsg}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 161.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            gradient: LinearGradient(
                                colors: themeConfig.primaryGradientColor),
                            border: Border.all(
                                color: Color.fromARGB(255, 112, 112, 112)),
                          ),
                          child: RawMaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {

                              coursesPercentageSelectedByAdvisor =
                                  coursesPercentage.values.toList();
                              for (int i = 0;
                              i < coursesPercentageSelectedByAdvisor.length;
                              i++) {
                                sumOfAllAffect +=
                                coursesPercentageSelectedByAdvisor[i];
                              }
                              _key.currentState!.validate();
                              if (sumOfAllAffect < 100 || sumOfAllAffect > 100) {
                                errorMsg = "The sum of all the affects must be exactly 100%!";
                                sumOfAllAffect = 0;
                              }

                              if (sumOfAllAffect == 100 && _key.currentState!.validate()) {

                                SetScore(
                                    user.student,
                                    scoreName,
                                    scoreDescription,
                                    selectedBadPercent.floor(),
                                    selectedGoodPercent.floor(),
                                    allSelectedCoursesTemp,
                                    coursesPercentageSelectedByAdvisor);
                              }
                              sumOfAllAffect = 0;
                              inceacesCurrent();

                              setState(() {});
                            },
                            child: Text(
                              'add',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        Container(
                          width: 161.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: Color.fromARGB(255, 252, 85, 119),
                            border: Border.all(
                                color: Color.fromARGB(255, 112, 112, 112)),
                          ),
                          child: RawMaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                //CloseAddScoreP
                                Navigator.pop(context);
                              });
                            },
                            child: Text(
                              'close',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  void SetScore(
      List<Student> students,
      String scoreName,
      String scoreDescription,
      int badPercent,
      int goodPercent,
      List<String> coursesSelectedByAdvisor,
      List<double> coursesPercentageSelectedByAdvisor) {
    current++;
    Score studentScore = Score(
      scoreName: scoreName,
      scoreCourses: [],
      coursesPercentage: [],
      scoreDescription: scoreDescription,
      goodPercent: goodPercent,
      badPercent: badPercent,
    );

    if (coursesSelectedByAdvisor.length >= 1 &&
        coursesPercentageSelectedByAdvisor.length >= 1 &&
        coursesSelectedByAdvisor.length ==
            coursesPercentageSelectedByAdvisor.length &&
        scoreName.isNotEmpty &&
        scoreDescription.isNotEmpty &&
        goodPercent >= 1 &&
        badPercent >= 1 &&
        sumOfAllAffect == 100) {
      for (int j = 0; j < coursesSelectedByAdvisor.length; j++) {
        studentScore.scoreCourses.insert(
            j,
            Course(
                courseTitle: '',
                courseNumber: 0,
                courseCode: '',
                courseHour: 0,
                courseID: coursesSelectedByAdvisor[j],
                level: 0,
                grade: 0));
        studentScore.coursesPercentage
            .insert(j, coursesPercentageSelectedByAdvisor[j]);
      }

      for (int i = 0; i < students.length; i++) {
        var studentScoresRef = FirebaseDatabase.instance
            .ref("Student")
            .child(students[i].uid)
            .child("scoreRef");
        DatabaseReference scoreCreatedkey = studentScoresRef.push();
        Map<String, dynamic> score = {
          'badPercent': badPercent,
          'goodPercent': goodPercent,
          'scoreDescription': scoreDescription,
          'scoreID': scoreCreatedkey.key.toString(),
          'scoreName': scoreName,
          'PLO': {},
          'score': 0,
        };
        for (int i = 0; i < coursesSelectedByAdvisor.length; i++) {
          score["PLO"][i] = {
            'CourseID': coursesSelectedByAdvisor[i],
            'affect': coursesPercentageSelectedByAdvisor[i],
          };
        }
        students[i].score!.add(studentScore);
        scoreCreatedkey.set(score);

        user.student = calculateScore(students);
        studentScoresRef = FirebaseDatabase.instance
            .ref("Student")
            .child(students[i].uid)
            .child("scoreRef")
            .child(scoreCreatedkey.key.toString());

        studentScoresRef.update({
          'score':
          user.student[i].score![user.student[i].score!.length - 1].score
        });
      }

      Navigator.pop(context);
      scoreName = "";
      scoreDescription = "";
      goodPercent = 0;
      badPercent = 0;
      sumOfAllAffect = 0;
      Refresh(user);
      setState(() {});
    }
  }
}
