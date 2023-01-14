import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScoreDescription extends StatelessWidget {
  const ScoreDescription(
      {Key? key,
      required this.score,
      required this.color,
      required this.stdList,
      required this.current})
      : super(key: key);
  final Score score;
  final Color color;
  final List<Student> stdList;

  final int current;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1542.w,
      height: 526.h,
      child: Row(
        children: [
          Container(
            width: 1006.w,
            height: 526.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    bottomLeft: Radius.circular(30.sp))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 20.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          score.scoreName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 65.sp,
                            fontFamily: 'Tajawal',
                            color: color,
                          ),
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 76, 76),
                            border: Border.all(
                                color: Color.fromARGB(255, 112, 112, 112),
                                width: 1.5.sp),
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            AAA_Icons_Pack.delete,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 96, 220, 220),
                              Color.fromARGB(255, 114, 72, 185),
                            ]),
                            border: Border.all(
                                color: Color.fromARGB(255, 112, 112, 112),
                                width: 1.5.sp),
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            AAA_Icons_Pack.edit,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 601.w,
                            child: Text(
                              score.scoreDescription.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontFamily: 'Tajawal',
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 18.h),
                            width: 601.w,
                            child: Text(
                              'List of courses:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: 'Tajawal',
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: 360.w,
                            height: 226.h,
                            alignment: Alignment.centerLeft,
                            child: ListView.builder(
                                itemCount: score.scoreCourses.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10.h),
                                    width: 360.w,
                                    height: 36.h,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${score.scoreCourses[index].courseCode}${score.scoreCourses[index].courseNumber}',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 26.sp,
                                                  fontFamily: 'Tajawal',
                                                  color: Color.fromARGB(
                                                      255, 112, 112, 112),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                score.coursesPercentage[index]
                                                        .toStringAsFixed(0) +
                                                    "%",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 26.sp,
                                                  fontFamily: 'Tajawal',
                                                  color: Color.fromARGB(
                                                      255, 112, 112, 112),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 360.w,
                                          height: 2.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                Color.fromARGB(
                                                    255, 96, 220, 220),
                                                Color.fromARGB(
                                                    255, 114, 72, 185)
                                              ])),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      Container(
                        width: 282.w,
                        height: 282.h,
                        child: SfRadialGauge(
                          axes: [
                            RadialAxis(
                                ranges: <GaugeRange>[
                                  GaugeRange(
                                      startValue: 0,
                                      endValue: 100,
                                      startWidth: 15.sp,
                                      endWidth: 15.sp,
                                      rangeOffset: 7,
                                      color: Color.fromARGB(255, 112, 112, 122))
                                ],
                                endAngle: 360,
                                startAngle: 0,
                                minimum: 0,
                                maximum: 100,
                                showLabels: false,
                                showTicks: false,
                                axisLineStyle: AxisLineStyle(
                                    thickness: 7.sp, color: Colors.transparent),
                                pointers: [
                                  RangePointer(
                                    value: score.score!,
                                    width: 15.sp,
                                    color: color,
                                  )
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                    positionFactor: 0.2,
                                    angle: 90,
                                    widget: Text(
                                      score.score!
                                          .toStringAsFixed(0)
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 138.sp),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          VerticalDivider(
            thickness: 1.w,
            width: 1.w,
            color: Color.fromARGB(255, 112, 112, 112),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 7.w),
            width: 534.w,
            height: 526.h,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.sp),
                    bottomRight: Radius.circular(30.sp))),
            child: ListView.builder(
                itemCount: stdList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 501.w,
                    height: 83.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${stdList[index].firstName} ${stdList[index].lastName}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontFamily: 'Tajawal',
                              color: Color.fromARGB(255, 74, 74, 74),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 140.w,
                          height: 47.h,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 113, 99, 192),
                              borderRadius: BorderRadius.circular(25.sp)),
                          child: Text(
                            stdList[index]
                                    .score![current]
                                    .score!
                                    .toStringAsFixed(0) +
                                '%',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                              fontFamily: 'Tajawal',
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
