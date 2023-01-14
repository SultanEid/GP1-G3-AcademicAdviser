import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidgetDB extends StatelessWidget {
  ProfileWidgetDB({required this.student});

  Student student;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      width: 420.w,
      height: 485.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.sp))),
      child: Column(
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            margin: EdgeInsets.only(top: 20.h),
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 114, 72, 185),
              radius: 100.sp,
              child: student.profile.profileAvatar == null
                  ? CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 75, 75, 75),
                      radius: 95.sp,
                      child: Icon(
                        AAA_Icons_Pack.profile,
                        size: 95.sp,
                        color: Colors.white,
                      ))
                  : CircleAvatar(
                      backgroundImage:
                          AssetImage(student.profile.profileAvatar!),
                      backgroundColor: Colors.white10,
                      radius: 95.sp,
                    ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            alignment: Alignment.center,
            child: Text(
              '${student.firstName.toUpperCase()} ${student.lastName.toUpperCase()}',
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
          ),
          Text(
            student.gpa.toStringAsFixed(2) + ' | ' + student.profile.role,
            style: TextStyle(
                fontFamily: 'Tajawal',
                color: Color.fromARGB(255, 114, 72, 185),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            alignment: Alignment.center,
            width: 250.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      info('Finished Credits', student.totalHours.toString()),
                      info('Registered Credits',
                          student.registeredHours.toString()),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        info('ID', student.academicID),
                        info('Total Credits', student.totalHours.toString()),
                      ]),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            width: 96.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                            color: Color.fromARGB(255, 112, 112, 112),
                            width: 2)),
                    child: Builder(
                        builder: (context) => IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.phone,
                                size: 20.sp,
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: student.phone));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    student.phone + ' Copied!',
                                    style: TextStyle(fontFamily: 'Tajawal'),
                                  ),
                                ));
                              },
                            )),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                            color: Color.fromARGB(255, 112, 112, 112),
                            width: 2)),
                    child: Builder(
                        builder: (context) => IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Center(
                                child: Icon(
                                  Icons.email,
                                  size: 20.sp,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                ),
                              ),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: student.academicEmail));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    student.academicEmail + ' Copied!',
                                    style: TextStyle(fontFamily: 'Tajawal'),
                                  ),
                                ));
                              },
                            )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            width: 60.w,
            height: 20.h,
            child: RawMaterialButton(
              onPressed: () {},
              child: Text(
                'Read More',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 114, 72, 185),
                    fontSize: 11.sp),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            child: Divider(
              indent: 60.w,
              endIndent: 60.w,
              height: 1,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class info extends StatelessWidget {
  String text;
  String value;

  info(String this.text, String this.value);

  @override
  Widget build(BuildContext context) {
    var short =
        text.split(' ').length > 1 ? text[0] + text.split(' ')[1][0] : text;
    return Tooltip(
      preferBelow: true,
      verticalOffset: -5.h,
      message: text + ': ' + value,
      child: Text(
        short + ' : ' + value,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: 'Tajawal',
            color: Color.fromARGB(255, 112, 112, 112),
            fontSize: 20.sp),
      ),
    );
  }
}
