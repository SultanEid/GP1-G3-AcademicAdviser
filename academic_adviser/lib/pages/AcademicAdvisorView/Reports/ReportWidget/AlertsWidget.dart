import 'package:academic_adviser/Models/Alert.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AlertsWidgetR extends StatefulWidget {
   AlertsWidgetR({Key? key , required this.student}) : super(key: key);
  Student student;

  @override
  State<AlertsWidgetR> createState() => _AlertsWidgetR(student: student);
}

class _AlertsWidgetR extends State<AlertsWidgetR> {
  _AlertsWidgetR({required this.student});
  Student student;
  // List<Alert> stdAlert = [
  //   Alert(
  //       alertContent: 'Miss Final Exam',
  //       alertDate: DateTime.utc(2022, 6, 6),
  //       alertDegree: 3,
  //       content: 'CS471'),
  //   Alert(
  //       alertContent: '20% Absents',
  //       alertDate: DateTime.utc(2022, 6, 20),
  //       alertDegree: 2,
  //       content: 'CS451'),
  //   Alert(
  //       alertContent: 'Drop GPA',
  //       alertDate: DateTime.utc(2022, 6, 6),
  //       alertDegree: 2,
  //       content: 'Level 10'),
  // ];




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
      width: 325.w,
      height: 306.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.sp)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              'ALERTS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                fontFamily: 'Tajawal',
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: 292.w,
            height: 234.h,
            child: ListView.builder(
                itemCount: student.alerts?.length,
                itemBuilder: (context, index) {
                  return AlertCardWidgtDB(
                    alert:  student.alerts![index],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class AlertCardWidgtDB extends StatelessWidget {
  AlertCardWidgtDB({Key? key, required this.alert}) : super(key: key);

  final Alert alert;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        width: 292.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              alert.alertDegree == 2
                  ? Color.fromARGB(255, 254, 202, 113)
                  : Color.fromARGB(255, 225, 107, 107),
              alert.alertDegree == 2
                  ? Color.fromARGB((255 / 3).toInt(), 254, 202, 113)
                  : Color.fromARGB((255 / 3).toInt(), 225, 107, 107),
              alert.alertDegree == 2
                  ? Color.fromARGB(0, 254, 202, 113)
                  : Color.fromARGB(0, 225, 107, 107)
            ]),
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 7.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        alert.alertTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        alert.alertContent +
                            ' | ' +
                            alert.alertDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              width: 20.w,
              height: 20.h,
              decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              alignment: Alignment.centerLeft,
              child: Icon(
                AAA_Icons_Pack.info,
                color: alert.alertDegree == 2
                    ? Color.fromARGB(255, 254, 202, 113)
                    : Color.fromARGB(255, 225, 107, 107),
                size: 20.sp,
              ),
            )
          ],
        ),);
  }
}
