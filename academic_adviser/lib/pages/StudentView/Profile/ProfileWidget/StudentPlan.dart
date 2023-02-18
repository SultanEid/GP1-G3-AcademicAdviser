import 'package:academic_adviser/Models/Student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class studentPlan extends StatelessWidget {
  const studentPlan({Key? key, required this.user}) : super(key: key);
  final Student user;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1539.w,
        height: (406 + 15 + 438).h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.w)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: 35.h),
            alignment: Alignment.centerLeft,
            width: 1483.w,
            height: 20.h,
            child: Text(
              'Student Plan',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w300,
                  fontSize: 27.sp,
                  color: Color.fromARGB(255, 87, 87, 87)),
            ),
          ),
          Divider(
            endIndent: 28.w,
            indent: 28.w,
          ),
          DataTable(
            border: TableBorder.symmetric(
              inside: BorderSide(
                color: Colors.black,
                width: 1
              )
            ),
            columnSpacing: 200.w,
              columns: [
            DataColumn(
                label: Text(
              'Year 1',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal),
            ),
            ),
            DataColumn(
                label: Text(
              'Year 2',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal),
            )),
            DataColumn(
                label: Text(
              'Year 3',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal),
            )),
            DataColumn(
                label: Text(
              'Year 4',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal),
            )),
            DataColumn(
                label: Text(
              'Year 5',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal),
            ))
          ],
              rows: [
            DataRow(cells: [
              DataCell(
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                            text: 'Register Hours\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: '${user.registeredHours}',
                        )
                      ]),
                ),
              ),
              DataCell(
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                            text: 'Remain Hours\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: '${user.registeredHours - user.totalHours}',
                        )
                      ]),
                ),
              ),
              DataCell(RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal),
                    children: [
                      TextSpan(
                          text: 'Warnings no.\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: '${user.warningsNumber}',
                      )
                    ]),
              )),
              DataCell(
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                            text: 'Remain Hours\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: '${user.registeredHours - user.totalHours}',
                        )
                      ]),
                ),
              ),
              DataCell(RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal),
                    children: [
                      TextSpan(
                          text: 'Warnings no.\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: '${user.warningsNumber}',
                      )
                    ]),
              )),
            ]),
          ])
        ]));
  }
}
