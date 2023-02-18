import 'package:academic_adviser/Models/Student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines/timelines.dart';

class LevelTimeLineR extends StatelessWidget {
  LevelTimeLineR({Key? key,}) : super(key: key);
  int Currentlevel = 10;
  int lateLevel = 12;
  String Status = 'On Plan';
  int ExpectedGraduation = 2023;
  List<String> labels = ['Level','Status', 'Expected Graduation'];

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
                                        labels[0],
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
                                        Currentlevel.toString(),
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
                                        labels[1],
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
                                        Status,
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
                                        labels[2],
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
                                        ExpectedGraduation.toString(),
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
            TimelineWidgetR(
                Currentlevel: Currentlevel,
                lateLevel: lateLevel,
                Status: Status,
                ExpectedGraduation: ExpectedGraduation),
          ],
        )
    );
  }
}

class TimelineWidgetR extends StatelessWidget {
  TimelineWidgetR(
      {Key? key,
      required this.Currentlevel,
      required this.lateLevel,
      required this.Status,
      required this.ExpectedGraduation})
      : super(key: key);
  final int Currentlevel;
  final int lateLevel;
  final String Status;
  final int ExpectedGraduation;

  List<Color> colors = [
    Color.fromARGB(255, 96, 220, 220),
    Color.fromARGB(255, 114, 72, 185),
  ];

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
                BoxDecoration(gradient: LinearGradient(colors: colors)),
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
                            colors: colors
                        )
                    );
                    CustomOuterDot = BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: colors
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
                          colors: (e.key+1) == Currentlevel? colors : [Colors.transparent,Colors.transparent],
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