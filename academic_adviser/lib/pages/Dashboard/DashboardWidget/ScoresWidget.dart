import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScoresDB extends StatelessWidget {
  ScoresDB({Key? key , required this.student}) : super(key: key);
  Student student;

  // List<Score> list = [
  //   Score(
  //     goodPercent: 67,
  //     badPercent: 40,
  //     scoreTag: 'Programming',
  //     scoreDescription:
  //         'Programming indicator score is measuring programming skills and scores.',
  //     plo: [
  //       CourseDegreePLO(
  //         courseName: 'CS 103',
  //         courseDgree: 95,
  //         PLOPercent: 10,
  //       ),
  //       CourseDegreePLO(
  //         courseName: 'CS 111',
  //         courseDgree: 90,
  //         PLOPercent: 30,
  //       ),
  //       CourseDegreePLO(
  //         courseName: 'CS 112',
  //         courseDgree: 99,
  //         PLOPercent: 20,
  //       ),
  //       CourseDegreePLO(
  //         courseName: 'CS 211',
  //         courseDgree: 95,
  //         PLOPercent: 40,
  //       )
  //     ],
  //   ),
  // ];

  List<Color> colorsPlus = [
    Color.fromARGB(255, 114, 72, 185),
    Color.fromARGB(255, 96, 220, 220),
    Color.fromARGB(255, 232, 135, 50),
    Color.fromARGB(255, 72, 185, 154),
    Color.fromARGB(255, 159, 72, 185),
    Color.fromARGB(255, 158, 177, 72),
  ];
  List<Color> colors = [
    Color.fromARGB(255, 96, 220, 220),
    Color.fromARGB(255, 114, 72, 185),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      padding: EdgeInsets.only(top: 15.h),
      width: 649.w,
      height: 306.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: student.score!.asMap().entries.map((e) {
              return Expanded(
                  child: Column(
                children: [
                  SingleScoreRadial(
                    title: student.score![e.key].scoreName,
                    color: colorsPlus[e.key % colorsPlus.length],
                    percent: student.score![e.key].score!
                  ),
                  SizedBox(height: 15.h,),
                  culumnChart(student.score![e.key].score!,student.score![e.key].goodPercent,student.score![e.key].badPercent),
                ],
              ));
            }).toList(),
          ),
          Container(
            width: 600.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 112, 112, 112),
              borderRadius: BorderRadius.circular(10.sp)
            ),
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
                        'Excellent',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 12.sp,
                            color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w, bottom: 2.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.sp),
                            color: Color.fromARGB(255, 152, 226, 103)),
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
                        margin: EdgeInsets.only(left: 5.w, bottom: 2.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.sp),
                            color: Color.fromARGB(255, 169, 209, 142)),
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
                        'Bad',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 12.sp,
                            color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w, bottom: 2.h),
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.sp),
                            color: Color.fromARGB(255, 209, 142, 142)),
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
                        'Actual Score',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 12.sp,
                            color: Colors.black),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 5.w, bottom: 2.h),
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.sp),
                            gradient: LinearGradient(colors: colors),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget culumnChart(double percnt,goodPercent,badPercent) {
    return Container(
      width: 18.w,
      height: 160.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 9.w,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4.sp),
                topLeft: Radius.circular(4.sp)
              ),
              color: Color.fromARGB(255, 152, 226, 103),
            ),
          ),
          Container(
            width: 9.w,
            height: (goodPercent/100)*(160.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.sp),
                    topLeft: Radius.circular(4.sp)
                ),
                color: Color.fromARGB(255, 169, 209, 142),
            ),
          ),
          Container(
            width: 9.w,
            height: (badPercent/100)*(160.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.sp),
                    topLeft: Radius.circular(4.sp)
                ),
                color: Color.fromARGB(255, 209, 142, 142)
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 9.w,
              height: (percnt/100)*(160.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.sp),
                      topLeft: Radius.circular(4.sp)
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors,
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SingleScoreRadial extends StatelessWidget {
  const SingleScoreRadial(
      {Key? key,
      required this.title,
      required this.percent,
      required this.color})
      : super(key: key);
  final String title;
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w),
        height: 75.h,
        width: 80.w,
        child: Column(
          children: [
            Container(
              height: (55).h,
              width: (55).w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 7.sp)),
              padding: EdgeInsets.only(top: 5.h),
              margin: EdgeInsets.only(bottom: 5.h),
              alignment: Alignment.center,
              child: Text(
                percent.toInt().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: color),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: color),
            ),
          ],
        ));
  }
}
