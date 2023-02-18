import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
class ProfileWidgetR extends StatelessWidget {
   ProfileWidgetR({Key? key, required this.student, required this.width, required this.height}) : super(key: key);
  final double width;
  final double height;
  Student student;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular((width/20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width / 2.9761358176285302439805669745342,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 75, 75, 75),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular((width/20)),
                    bottomLeft: Radius.circular((width/20)))),
            child:Icon(
              AAA_Icons_Pack.profile,
              color: Colors.white,
              size: (width/5),
            ),
          ),
          Container(
            width: width  - (width / 2.9761358176285302439805669745342),
            padding: EdgeInsets.only(left: (width / 28.013065326633165829145728643216), top: (height / 7.5316)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${student.firstName.toUpperCase()} ${student.lastName.toUpperCase()}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: (width /20),
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 74, 73, 73),
                  ),
                ),
                Text(
                  student.profile.role + ' | ' +  student.gpa.toStringAsFixed(2),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: (width/30),
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 74, 73, 73),
                  ),
                ),
                Container(
                  width: (width  - (width / 2.9761358176285302439805669745342)) - ((width / 28.013065326633165829145728643216) * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.phone,
                                        size: ( width / 50),
                                      ),
                                    ),
                                    Text(
                                      '${student.phone}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: ( width / 50),
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 74, 73, 73),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.email,
                                        size: ( width / 50),
                                      ),
                                    ),
                                    Text(
                                      '${student.academicEmail}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: ( width / 50),
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 74, 73, 73),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        AAA_Icons_Pack.report,
                                        size: ( width / 50),
                                      ),
                                    ),
                                    Text(
                                      ' ${student.registeredHours} Registered Hours',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: ( width / 50),
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 74, 73, 73),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        AAA_Icons_Pack.report,
                                        size: ( width / 50),
                                      ),
                                    ),
                                    Text(
                                      ' ${student.totalHours} Completed Hours',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: ( width / 50),
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 74, 73, 73),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        AAA_Icons_Pack.report,
                                        size: ( width / 50),
                                      ),
                                    ),
                                    Text(
                                      ' ${student.registeredHours - student.totalHours} Semester Hours',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: ( width / 50),
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 74, 73, 73),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        AAA_Icons_Pack.report,
                                        size: ( width / 50),
                                      ),
                                    ),
                                    Text(
                                      ' Student ID ${student.academicID}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: ( width / 50),
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 74, 73, 73),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
