import 'package:academic_adviser/Models/Score.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../Models/Course.dart';

class ScoreDescription extends StatelessWidget {
  ScoreDescription(
      {Key? key,
        required this.score,
        required this.color,
        required this.user,
        required this.current})
      : super(key: key);
  final Score score;
  final Color color;
  final Student user;
  final int current;
  List<List<Course>> studentUnfinishedCourses=List.generate(7, (index) => []);

  double calculateCourseUsage(int grade, double percent){
    return (grade/100)*percent;
  }

  void AssignStudentCoursesGrades(){
    for(int j=0;j<user.score!.length;j++){
      for(int courses=0;courses<user.score![j].scoreCourses.length;courses++){
        for(int i=0;i<user.finishedCourses.length;i++){
          if(user.finishedCourses[i].courseID==user.score![j].scoreCourses[courses].courseID){
            user.score![j].scoreCourses[courses].grade=user.finishedCourses[i].grade;
          }
        }
      }
    }
    checkStudentUnfinishedCourses();
  }


  void checkStudentUnfinishedCourses(){
    for(int scoreCourse = 0 ;scoreCourse<user.score!.length;scoreCourse++){
      for(int i=0;i<user.score![scoreCourse].scoreCourses.length;i++){
        if(user.score![scoreCourse].scoreCourses[i].grade==0){
          studentUnfinishedCourses[scoreCourse].add(user.score![scoreCourse].scoreCourses[i]);
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    AssignStudentCoursesGrades();

    return Container(
      width: 1542.w,
      height: 526.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.sp)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 20.h),
            alignment: Alignment.centerLeft,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                  width: 601.w,
                  height: 100.h,
                  child: SingleChildScrollView(
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
                                          '${score.scoreCourses[index].courseID}',
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
                                              Color.fromARGB(255, 96, 220, 220),
                                              Color.fromARGB(255, 114, 72, 185),
                                            ])),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: user.score![current].scoreCourses.asMap().entries.map((e){
                            return Container(
                                margin: EdgeInsets.symmetric(horizontal:(((670/user.score![current].scoreCourses.length)-60)/2).floor().w),
                                child: culumnChart(calculateCourseUsage(user.score![current].scoreCourses[e.key].grade != 0 ? user.score![current].scoreCourses[e.key].grade  : 1,user.score![current].coursesPercentage[e.key]),user.score![current].coursesPercentage[e.key])
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        width: 670.w,
                        height: 1.h,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 150, 150, 150),
                            borderRadius: BorderRadius.circular(5.sp)
                        ),
                      ),
                      Container(
                        child: Row(
                          children: user.score![current].scoreCourses.asMap().entries.map((e){
                            return Container(
                              alignment: Alignment.centerRight,
                              width: (60).w,
                              margin: EdgeInsets.symmetric(horizontal:(((670/user.score![current].scoreCourses.length)-60)/2).floor().w ),
                              child: Text(
                                '${user.score![current].scoreCourses[e.key].courseID}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal',
                                  color: Color.fromARGB(255, 112, 112, 112),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Text(
                        'Courses\' List Scores Graph',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                          fontFamily: 'Tajawal',
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        width: 200.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Score',
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
                                        color: Color.fromARGB(255, 112, 112, 112),
                                      )
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
                                        gradient: LinearGradient(colors: [
                                          Color.fromARGB(255, 96, 220, 220),
                                          Color.fromARGB(255, 114, 72, 185),
                                        ]),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
                              endValue: user.score![current].excellentPercent.toDouble(),
                              startWidth: 15.sp,
                              endWidth: 15.sp,
                              rangeOffset: 7,
                              color: Color.fromARGB(255, 152, 226, 103),),
                            GaugeRange(
                              startValue: 0,
                              endValue: user.score![current].goodPercent.toDouble(),
                              startWidth: 15.sp,
                              endWidth: 15.sp,
                              rangeOffset: 7,
                              color: Color.fromARGB(255, 169, 209, 142),),
                            GaugeRange(
                                startValue: 0,
                                endValue: user.score![current].badPercent.toDouble(),
                                startWidth: 15.sp,
                                endWidth: 15.sp,
                                rangeOffset: 7,
                                color: Color.fromARGB(255, 209, 142, 142)),

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
                            ),
                            MarkerPointer(
                              value: score.score!,
                              color: color,
                              markerOffset: -20.sp,
                            ),
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
    );
  }
  Widget culumnChart(double actuallScoree,double totalScore) {
    return Container(
      width: 60.w,
      height: 217.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 25.w,
            height: (totalScore/100)*(217.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4.sp),
                  topLeft: Radius.circular(4.sp)
              ),
              color: Color.fromARGB(255, 112, 112, 112),
            ),
            alignment: Alignment.topCenter,
            child: Text(
              '${totalScore.floor()}%',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                fontFamily: 'Tajawal',
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 25.w,
              height: ((actuallScoree<5? 5:actuallScoree)/100)*(217.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.sp),
                      topLeft: Radius.circular(4.sp)
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 96, 220, 220),
                      Color.fromARGB(255, 114, 72, 185),
                    ],
                  )
              ),
              alignment: Alignment.topCenter,
              child: Text(
                '${actuallScoree.floor()}%',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  fontFamily: 'Tajawal',
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}