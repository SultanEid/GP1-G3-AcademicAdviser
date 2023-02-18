import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelTimeLineDB extends StatelessWidget  {
  LevelTimeLineDB({Key? key, required this.student, required this.themeConfig}) : super(key: key);
  Student student;
  ThemeConfig themeConfig;
  DateTime startDate = DateTime(2018,10,1); // to be edited

  int calculateCurrentStudentLevel(int creditHours){
    return (creditHours/10).floor();
  }

  int calculateExpectedStudentLevel(DateTime startDate){
    return ((DateTime.now().difference(startDate).inDays/365)*3).floor();
  }

  String specifyStudentStatus(int creditHours , DateTime startDate){
    int currentLevel= calculateCurrentStudentLevel(creditHours);
    int expectedLevel = calculateExpectedStudentLevel(startDate);
    String status ="";

    if(currentLevel<expectedLevel){
      status="Off plan";
    }else if(currentLevel>expectedLevel){
      status="Advanced";
    }else if(currentLevel==expectedLevel){
      status="On plan";
    }

    return status;
  }

  int calculateExpectedGraduationYear(int creditHours , DateTime startDate){
    int currentLevel = calculateCurrentStudentLevel(creditHours);
    int studyingDuration = DateTime.now().difference(startDate).inDays;

    int expectedStudyingDuration = ((studyingDuration * 15)/currentLevel).floor();
    DateTime date = startDate.add(Duration(days: expectedStudyingDuration));
    int result = date.year;

    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        width: 649.w,
        height: 149.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.sp), color: Colors.white),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12.h),
              width: 649.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'Level Timeline',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h,right: 17.w),
                      width: 165.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(7.sp)
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10.w,left: 10.w,top: 5.h),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Level',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${calculateCurrentStudentLevel(student.totalHours)}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10.w,left: 10.w,top: 5.h),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Expected Level',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${calculateExpectedStudentLevel(startDate)}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Status',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${specifyStudentStatus(student.totalHours, startDate)}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Expected Graduation Year',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${calculateExpectedGraduationYear(student.totalHours, startDate)}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  )
                ],
              ),
            ),
            TimelineWidgetDB(
                Currentlevel: calculateCurrentStudentLevel(student.totalHours),
                lateLevel: calculateExpectedStudentLevel(startDate),
                Status: specifyStudentStatus(student.totalHours, startDate),
                ExpectedGraduation: calculateExpectedGraduationYear(student.totalHours, startDate), themeConfig: themeConfig,),
          ],
        )
    );
  }
}

class TimelineWidgetDB extends StatelessWidget {
  TimelineWidgetDB(
      {Key? key,
      required this.Currentlevel,
      required this.lateLevel,
      required this.Status,
      required this.ExpectedGraduation, required this.themeConfig})
      : super(key: key);
  final ThemeConfig themeConfig;
  final int Currentlevel;
  final int lateLevel;
  final String Status;
  final int ExpectedGraduation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 636.w,
      height: 63.7.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: 616.w,
                height: 3.h,
                color: Color.fromARGB(255, 112, 112, 112),
              ),
              Container(
                width: lateLevel > 14? (44 * 14).w :  (44 * lateLevel).w,
                height: 3.h,
                color: Color.fromARGB(255, 220, 96, 96),
              ),
              Container(
                width: Currentlevel > 14? (44 * 14).w :  (44 * Currentlevel).w,
                height: 3.h,
                decoration:
                BoxDecoration(gradient: LinearGradient(colors: themeConfig.primaryGradientColor)),
              ),
            ],
          ),
          Container(
            width: 636.w,
            child: Row(
                children: List.generate(15, (index) => index).asMap().entries.map((e) {
                  BoxDecoration CustomInnerDot;
                  BoxDecoration CustomOuterDot;
                  if(e.key < Currentlevel){
                    CustomInnerDot = BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: themeConfig.primaryGradientColor
                        )
                    );
                    CustomOuterDot = BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: themeConfig.primaryGradientColor
                        )
                    );
                  }else if(e.key <lateLevel){
                    CustomInnerDot = BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 220, 96, 96),
                    );
                    CustomOuterDot = BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent
                    );
                  }else{
                    CustomInnerDot = BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 112, 112, 112),
                    );
                    CustomOuterDot = BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent
                    );
                  }
                  Color upperLabelColor = Colors.transparent;
                  Color upperLabelTextColor = Colors.transparent;
                  switch(e.key){
                    case 0:
                      upperLabelColor = Color.fromARGB(255, 112, 112, 112);
                      upperLabelTextColor = Colors.white;
                      break;
                    case 14:
                      upperLabelColor = Color.fromARGB(255, 112, 112, 112);
                      upperLabelTextColor = Colors.white;
                      break;
                  }
                  Container LevelLabel = Container(
                    width: 20.w,
                    height: 19.h,
                  );
                  if((e.key + 1) == Currentlevel){
                    LevelLabel = Container(
                      width: 20.w,
                      height: 19.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        gradient: LinearGradient(
                          colors: (e.key+1) == Currentlevel? themeConfig.primaryGradientColor : [Colors.transparent,Colors.transparent],
                        ),
                      ),
                      child: Text(
                        (e.value+1).toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: ((e.key+1) == Currentlevel || (e.key+1) == lateLevel)? Colors.white:Colors.transparent,
                            fontFamily: 'Tajawl'
                        ),
                      ),
                    );
                  }else if(((e.key + 1) == lateLevel) && (lateLevel>Currentlevel)){
                    LevelLabel = Container(
                      width: 20.w,
                      height: 19.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: Color.fromARGB(255, 220, 96, 96),
                      ),
                      child: Text(
                        (e.value+1).toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontFamily: 'Tajawl'
                        ),
                      ),
                    );
                  }
                  return Container(
                    margin: e.key != 14? EdgeInsets.only(right: 24.w):EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20.w,
                          height: 19.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            color: upperLabelColor,
                          ),
                          child: Text(
                            (e.value+1).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: upperLabelTextColor,
                                fontFamily: 'Tajawl'
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 3.3.h),
                          width: 14.w,
                          height: 14.h,
                          alignment: Alignment.center,
                          decoration: CustomOuterDot,
                          child:
                          Container(
                            width: 11.2.w,
                            height: 11.2.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                            child: Container(
                              width: 7.w,
                              height: 7.h,
                              alignment: Alignment.center,
                              decoration: CustomInnerDot,
                            ),
                          ),
                        ),
                        LevelLabel,
                      ],
                    ),
                  );
                }).toList()
            ),
          ),
        ],
      ),
    );
  }
}