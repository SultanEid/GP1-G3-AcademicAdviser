import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/pages/Scores/ScoresWidget/ScoreDescription.dart';
import 'package:academic_adviser/pages/Scores/ScoresWidget/ScoresSummaryTopCard.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Models/Student.dart';

class Scores extends StatefulWidget {
  const Scores({Key? key}) : super(key: key);

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  int _current = 0;
  List<Student> stdList = [
    Student(name: 'Mohammed Alhusayni',myScores: [54,71]),
    Student(name: 'Yamin Ahmed',myScores: [66,69]),
    Student(name: 'Hakem Esam',myScores: [83,97]),
  ];
  List<Score> list = [
    Score(
      scoreTag: 'Programming',
      scoreDescription: 'Programming indicator score is measuring programming skills and scores.',
      plo: [
        CourseDegreePLO(
          courseName: 'CS 103',
          courseDgree: 95,
          PLOPercent: 10,
        ),
        CourseDegreePLO(
          courseName: 'CS 111',
          courseDgree: 90,
          PLOPercent: 30,
        ),
        CourseDegreePLO(
          courseName: 'CS 112',
          courseDgree: 99,
          PLOPercent: 20,
        ),
        CourseDegreePLO(
          courseName: 'CS 211',
          courseDgree: 95,
          PLOPercent: 40,
        )
      ],
    ),
    Score(
      scoreTag: 'English',
      scoreDescription: 'English indicator score is measuring English skills and scores',
      plo: [
        CourseDegreePLO(
          courseName: 'ENG 101',
          courseDgree: 90,
          PLOPercent: 25,
        ),
        CourseDegreePLO(
          courseName: 'ENG 102',
          courseDgree: 87,
          PLOPercent: 25,
        ),
        CourseDegreePLO(
          courseName: 'ENGL 103',
          courseDgree: 91,
          PLOPercent: 17,
        ),
        CourseDegreePLO(
          courseName: 'ENGL 104',
          courseDgree: 96,
          PLOPercent: 17,
        ),
        CourseDegreePLO(
          courseName: 'ENGL 214',
          courseDgree: 100,
          PLOPercent: 16,
        )
      ],
    ),
  ];

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
                                        itemCount: list.length,
                                        itemBuilder: (BuildContext context,
                                            int index, int realIndex) {
                                          return ScoresSummaryTopCard(
                                            title: list[index].scoreTag,
                                            percent: list[index].percent,
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
                                          list.asMap().entries.map((entry) {
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
                ScoreDescription(score: list[_current], color: colors[_current % colors.length],stdList: stdList,current: _current),
              ],
            )),
      ],
    );
  }
}
