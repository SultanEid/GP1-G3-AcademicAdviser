
import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/ScoresWidget/ScoreDescription.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/ScoresWidget/ScoresSummaryTopCard.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ScoresWidget extends StatefulWidget {
  const ScoresWidget({Key? key, required this.user}) : super(key: key);
  final AcademicAdvisor user;
  @override
  State<ScoresWidget> createState() => _ScoresState(user: user);
}

class _ScoresState extends State<ScoresWidget> {
  _ScoresState({Key? key, required this.user});
  final AcademicAdvisor user;
  int _current = 0;

  /*
  List<Student> stdList = [
    Student(
        firstName: 'Mohammed',
        lastName: 'Alhusayni',
        score:[
      Score(
        scoreName: 'Programming',
        scoreDescription: 'Programming indicator score is measuring programming skills and scores.',
        PLOs: [
          Course(
            courseTitle:  'Programming 1',
            courseCode:'CS',
            courseNumber: 103,
            grade: 95, courseHour: 4, attendance: [], appointment: [],
          ),
        ], score: 95, PLOPercentage: [54,23], badPercent: 45, goodPercent: 78,
      ),
    ], Notes: [], currentStudyCourses: [], finishedCourses: [] ),
  ];

   */

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
    return ScaffoldPlus(
      [
        Container(
            alignment: Alignment.topCenter,
            width: 1920.w,
            child: Column(
              children: [
                SizedBox(
                    width: 1690.w,
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
                                  borderRadius: BorderRadius.circular(30.sp)),
                              child: Text(
                                'Scores',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36.sp,
                                    fontFamily: 'Tajawal',
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                            ),
                            Container(
                              width: 1690.w,
                              height: 304.h,
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 1542.w,
                                height: 250.h,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CarouselSlider.builder(
                                        carouselController: _controller,
                                        options: CarouselOptions(
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: false,
                                            height: 1542.w,
                                            viewportFraction: 0.19,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                _current = index;
                                              });
                                            }),
                                        itemCount: user.student[0].score?.length,
                                        itemBuilder: (BuildContext context,
                                            int index, int realIndex) {
                                          return ScoresSummaryTopCard(
                                            title: user.student[0].score![index].scoreName,
                                            percent: user.student[0].score![index].score!,
                                            color:
                                                colors[index % colors.length],
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
                                      children:
                                      user.student[0].score!.asMap().entries.map((entry) {
                                        return GestureDetector(
                                            onTap: () => _controller.animateToPage(entry.key),
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                width: 28.w,
                                                height: 28.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                          255, 238, 238, 238)
                                                      .withOpacity(
                                                          _current == entry.key
                                                              ? 1
                                                              : 0.7),
                                                )));
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(height: 47.h,),
                ScoreDescription(score: user.student[0].score![_current], color: colors[_current % colors.length],stdList: user.student,current: _current),
              ],
            )),
      ],
    );
  }
}
