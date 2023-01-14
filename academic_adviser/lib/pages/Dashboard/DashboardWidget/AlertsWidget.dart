import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../Models/Alert.dart';
import '../../../Models/Student.dart';

class AlertsWidgetDB extends StatefulWidget {
   AlertsWidgetDB({Key? key ,required this.students}) : super(key: key);
   Student students;
  @override
  State<AlertsWidgetDB> createState() => _AlertsWidgetDB(students: students);
}

class _AlertsWidgetDB extends State<AlertsWidgetDB> {
  _AlertsWidgetDB({required this.students});
  // List<Alert> stdAlert = [
  //   Alert(
  //       alertContent: '20% Absents',
  //       alertDate: DateTime.utc(2022, 6, 20).toString(),
  //       alertDegree: 2,
  //       content: 'CS451', ),
  // ];
   Student students;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
      width: 351.w,
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
                itemCount: students.alerts?.length,
                itemBuilder: (context, index) {
                  return AlertCardWidgtDB(
                    alert: students.alerts![index],
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
        child: RawMaterialButton(
          fillColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverElevation: 0,
          highlightElevation: 0,
          elevation: 0,
          onPressed: () {
            openDialog(context);
          },
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
          ),
        ));
  }

  Future openDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: alert.alertDegree == 2
                ? Color.fromARGB(255, 254, 202, 113)
                : Color.fromARGB(255, 225, 107, 107),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    alert.alertTitle!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 35.w,
                  height: 35.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 248, 76, 76),
                      shape: BoxShape.circle),
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      AAA_Icons_Pack.delete,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    AAA_Icons_Pack.info,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
            content: Container(
                width: 479.w,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        alert.alertTitle +
                            ' in ' +
                            alert.alertContent +
                            ' at ' +
                           alert.alertDate,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Tajawal',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'done',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        });
  }
}
