import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Course.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Models/Student.dart';

class StudentPlanWidget extends StatefulWidget {
  StudentPlanWidget({Key? key, required this.user ,required this.advisor,required this.themeConfig}) : super(key: key);
  final Student user;
  AcademicAdvisor advisor;
  ThemeConfig themeConfig;
  @override
  State<StudentPlanWidget> createState() => _StudentPlanWidgetState(user: user,advisor: advisor);
}

class _StudentPlanWidgetState extends State<StudentPlanWidget> {
  _StudentPlanWidgetState({required this.user,required this.advisor});
  final Student user;
  List<List<Course>> planCourses =List.generate(15, (index) => []);
  AcademicAdvisor advisor;

  void ConvertingPlancourses(){
    planCourses =List.generate(15, (index) => []);
    for(int i=0;i<advisor.planCourses.length;i++){
      int level = advisor.planCourses[i].level-1;
      planCourses[level].add(advisor.planCourses[i]);
    }

  }

  void StudentCoursesgrades(){
    for(int i=0;i<user.finishedCourses.length;i++){
      for(int j=0;j<advisor.planCourses.length;j++){
        if(user.finishedCourses[i].courseID==advisor.planCourses[j].courseID){
          advisor.planCourses[j].grade=user.finishedCourses[i].grade;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ConvertingPlancourses();
    StudentCoursesgrades();
    return Container(
      width: 1542.w,
      height: 858.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.w)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            alignment: Alignment.topCenter,
            child: Text(
              'Student Plan'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal'),
            ),
          ),
          Divider(
            endIndent: 45.w,
            indent: 45.w,
            color: Color.fromARGB((255 / 2).toInt(), 0, 0, 0),
            height: 4.h,
          ),
          //Table Header
          Container(
            width: 1542.w,
            height: 45.h,
            padding: EdgeInsets.symmetric(horizontal: 140.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(41, 0, 0, 0),
                  blurRadius: 10,
                  spreadRadius: 0.0,
                  offset: Offset(0, 10), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                      'Course Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Key',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Credits',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Grade',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Prerequisites',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Table Body
          Container(
            width: 1357.w,
            height: 755.h,
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    width: 1357.w,
                    margin: EdgeInsets.only(top: 30.h,bottom: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //level Header
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Level #${index + 1}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 30.sp,
                                color: Colors.black,
                                fontFamily: 'Tajawal'),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB((255 / 2).toInt(), 0, 0, 0),
                          height: 4.h,
                        ),
                        //Level body
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 1262.w,
                          child: Table(
                            columnWidths: {1:FractionColumnWidth(0.1),2:FractionColumnWidth(0.1),3:FractionColumnWidth(0.1),4:FractionColumnWidth(0.1),5:FractionColumnWidth(0.1),6:FractionColumnWidth(0.1),},
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            border: TableBorder.all(
                                borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                                width: 1.0, color: Colors.black),
                            children: planCourses[index].asMap().entries.map((e) {
                              return TableRow(
                                  children: [
                                    Text("${planCourses[index][e.key].courseTitle}",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                                    Text("${planCourses[index][e.key].courseCode}",textScaleFactor: 1.5,textAlign: TextAlign.center),
                                    Text("${planCourses[index][e.key].courseNumber}",textScaleFactor: 1.5,textAlign: TextAlign.center),
                                    Text("${planCourses[index][e.key].courseHour}",textScaleFactor: 1.5,textAlign: TextAlign.center),
                                    planCourses[index][e.key].grade<60 ? TableCell(
                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(planCourses[index][e.key].grade==0 ? "-" : "${planCourses[index][e.key].grade}",textScaleFactor: 1.5,textAlign: TextAlign.center),
                                        decoration: BoxDecoration(color:planCourses[index][e.key].grade==0 ? Colors.transparent : Color.fromARGB(255, 252, 85, 119)),
                                      ),
                                    ) : TableCell(
                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(planCourses[index][e.key].grade==0 ? "-" : "${planCourses[index][e.key].grade}",textScaleFactor: 1.5,textAlign: TextAlign.center),
                                        decoration: BoxDecoration(color:planCourses[index][e.key].grade==0 ? Colors.transparent : Color.fromARGB(255, 152, 226, 103)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: planCourses[index][e.key].prerequisites?.first=="none" ? Container() : Container(
                                        width: 150.w,
                                        height: 35.h,margin: EdgeInsets.all(5.sp),
                                        decoration: BoxDecoration(
                                          color: widget.themeConfig.studentListButton,
                                          borderRadius: BorderRadius.circular(10.sp),
                                        ),
                                        child: RawMaterialButton(
                                          onPressed: () {
                                            openDialog(context,'${planCourses[index][e.key].courseTitle} - ${planCourses[index][e.key].courseCode}${planCourses[index][e.key].courseNumber}',planCourses[index][e.key].prerequisites);
                                          },
                                          child: Text("Prerequisites",textScaleFactor: 1.2,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ]
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }


  Future openDialog(BuildContext context,String courseName,List<String>? prerequisitesNames) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Container(
              height:  65.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Prerequisites of:',style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('${courseName}',style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),),
                ],
              ),
            ),
            content: Container(
              width: 479.w,
              height: (prerequisitesNames!.length * 40).h,
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: prerequisitesNames!.asMap().entries.map((e){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Text('${e.key + 1}',style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),),
                        Expanded(child: Text('${prerequisitesNames[e.key]}',textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),),)
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            actions: [
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'close',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                    color: Colors.black,
                  ),
                ),
              )
            ],
          );
        });
  }
}

