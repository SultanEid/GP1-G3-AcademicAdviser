<<<<<<< Updated upstream
import 'package:academic_adviser/Models/Appointment.dart';
import 'package:academic_adviser/Models/Course.dart';
=======
>>>>>>> Stashed changes
import 'package:academic_adviser/Models/Student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<< Updated upstream
=======
import '../../../../Models/Appointment.dart';
import '../../../../Models/Course.dart';

>>>>>>> Stashed changes

class ScheduleWidgetDB extends StatelessWidget {
  ScheduleWidgetDB({Key? key , required this.student}) : super(key: key);
  Student student;
  //
  // List<Course> list = [
  //   Course(
  //     courseTitle: 'Computer Graphics',
  //     courseCode: 'CS',
  //     courseNumber: 451,
  //     courseHour: 4,
  //     appointment: [
  //       Appointment(TimeOfDay(hour: 14,minute: 40), TimeOfDay(hour: 16,minute: 10), 'G84', 'B115',2),
  //       Appointment(TimeOfDay(hour: 15,minute: 0), TimeOfDay(hour: 17,minute: 00), 'Lab9', 'B115',3),
  //       Appointment(TimeOfDay(hour: 14,minute: 40), TimeOfDay(hour: 16,minute: 10), 'G84', 'B115',4)
  //     ]
  //   ),
  //   Course(
  //       courseTitle: 'Information Retrieval',
  //       courseCode: 'CS',
  //       courseNumber: 471,
  //       courseHour: 3,
  //       appointment: [
  //         Appointment(TimeOfDay(hour: 14,minute: 40), TimeOfDay(hour: 16,minute: 10), 'G32', 'B115',1),
  //         Appointment(TimeOfDay(hour: 14,minute: 40), TimeOfDay(hour: 16,minute: 10), 'G32', 'B115',5),
  //       ]
  //   ),
  //   Course(
  //       courseTitle: 'Graduation Project(1)',
  //       courseCode: 'CS',
  //       courseNumber: 491,
  //       courseHour: 1,
  //       appointment: <Appointment>[]
  //   ),
  //   Course(
  //       courseTitle: 'Introduction To Oriental',
  //       courseCode: 'ORNT',
  //       courseNumber: 101,
  //       courseHour: 2,
  //       appointment: [
  //         Appointment(TimeOfDay(hour: 9,minute: 00), TimeOfDay(hour: 10,minute: 00), 'Blackboard', '',2),
  //         Appointment(TimeOfDay(hour: 10,minute: 00), TimeOfDay(hour: 11,minute: 00), 'Blackboard', '',2),
  //       ]
  //   ),
  //   Course(
  //       courseTitle: 'Islamic Studies',
  //       courseCode: 'GS',
  //       courseNumber: 101,
  //       courseHour: 2,
  //       appointment: [
  //         Appointment(TimeOfDay(hour: 9,minute: 00), TimeOfDay(hour: 10,minute: 00), 'Blackboard', '',3),
  //         Appointment(TimeOfDay(hour: 10,minute: 00), TimeOfDay(hour: 11,minute: 00), 'Blackboard', '',3),
  //       ]
  //   ),
  //   Course(
  //       courseTitle: 'Calculus(1)',
  //       courseCode: 'MATH',
  //       courseNumber: 203,
  //       courseHour: 3,
  //       appointment: [
  //         Appointment(TimeOfDay(hour: 13,minute: 00), TimeOfDay(hour: 14,minute: 30), 'G32', 'B115',1),
  //         Appointment(TimeOfDay(hour: 13,minute: 00), TimeOfDay(hour: 14,minute: 30), 'G32', 'B115',5),
  //       ]
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 732.w,
      height: 553.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.sp)
      ),
      padding: EdgeInsets.only(right: 23.w,left: 23.w,top: 10.h),
      margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Total Hours: ' + "15E",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      fontFamily: 'Tajawal',
                      color: Color.fromARGB(255, 112, 112, 112),
                    ),
                  ),
              ),
              Container(
                width: 546.w,
                height: 46.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 96, 220, 220),
                      Color.fromARGB(255, 114, 72, 185),
                    ]
                  )
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          'Sunday',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: 'Tajawal',
                            color: Colors.white,
                          ),
                        ),
                    ),
                    Expanded(
                        child: Text(
                          'Monday',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: 'Tajawal',
                            color: Colors.white,
                          ),
                        ),
                    ),
                    Expanded(
                        child: Text(
                          'Tuesday',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: 'Tajawal',
                            color: Colors.white,
                          ),
                        ),
                    ),
                    Expanded(
                        child: Text(
                          'Wednesday',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: 'Tajawal',
                            color: Colors.white,
                          ),
                        ),
                    ),
                    Expanded(
                        child: Text(
                          'Thursday',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontFamily: 'Tajawal',
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              width: 687.w,
              height: 480.h,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: student.currentStudyingCourses.length,
                itemBuilder: (context, index){
                  return ScheduleCardWidgetDB(course: student.currentStudyingCourses[index],);
                }
            )
          )
        ],
      )
    );
  }
}

class ScheduleCardWidgetDB extends StatelessWidget {
  ScheduleCardWidgetDB({Key? key, required this.course}) : super(key: key);

  Course course;
  List<List<Appointment>> weekDay = [[], [], [], [], [],];
  sperateAppointments(){
    List<Appointment>? appointments = course.appointment;
    for(int index = 0; index < appointments!.length; index++){
      switch(appointments[index].day){
        case 1:
          weekDay[0].add(appointments[index]);
          break;
        case 2:
          weekDay[1].add(appointments[index]);
          break;
        case 3:
          weekDay[2].add(appointments[index]);
          break;
        case 4:
          weekDay[3].add(appointments[index]);
          break;
        case 5:
          weekDay[4].add(appointments[index]);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    sperateAppointments();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      width: 687.w,
      height: 86.h,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 228, 228, 228), borderRadius: BorderRadius.circular(10.sp)
      ),
      child: Row(
        children: [
          Container(
            width: 30.w,
            alignment: Alignment.center,
            child: RotatedBox(
              child: Text(
                course.courseHour.toString() + ' Hours',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  fontFamily: 'Tajawal',
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
              ), quarterTurns: 1,
            ),
          ),
          VerticalDivider(
            endIndent: 7.h,
            indent: 7.h,
            width: 1.5.w,
            thickness: 1.5.w,
            color: Color.fromARGB(255, 175, 175, 175),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            width: 109.w,
            child: Text(
              course.courseTitle + ' ' + course.courseCode + course.courseNumber.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                fontFamily: 'Tajawal',
                color: Color.fromARGB(255, 112, 112, 112),
              ),
            ),
          ),
          VerticalDivider(
            endIndent: 7.h,
            indent: 7.h,
            width: 1.5.w,
            thickness: 1.5.w,
            color: Color.fromARGB(255, 175, 175, 175),
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              children: weekDay[0].asMap().entries.map((entry) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    width: 93.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color: Color.fromARGB(255, 112, 112, 112))
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${weekDay[0][entry.key].startTime.hour}:${weekDay[0][entry.key].startTime.minute} ${weekDay[0][entry.key].startTime.period.toString().split('.')[1]} - ${weekDay[0][entry.key].endTime.hour}:${weekDay[0][entry.key].endTime.minute} ${weekDay[0][entry.key].endTime.period.toString().split('.')[1]}\n'
                          + (weekDay[0][entry.key].classRoom == 'Blackboard'?'${weekDay[0][entry.key].classRoom}':'${weekDay[0][entry.key].classRoom} - ${weekDay[0][entry.key].Building}'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        fontFamily: 'Tajawal',
                        color: Color.fromARGB(255, 112, 112, 112),
                      ),
                    ),
                  ),
                );
              }).toList()
            ),
          ),
          VerticalDivider(
              width: 1.5.w,
              thickness: 1.5.w,
              color: Colors.white
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:weekDay[1].asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      width: 93.w,
                      height: 31.h,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(color: Color.fromARGB(255, 112, 112, 112))
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${weekDay[1][entry.key].startTime.hour}:${weekDay[1][entry.key].startTime.minute} ${weekDay[1][entry.key].startTime.period.toString().split('.')[1]} - ${weekDay[1][entry.key].endTime.hour}:${weekDay[1][entry.key].endTime.minute} ${weekDay[1][entry.key].endTime.period.toString().split('.')[1]}\n'
                            + (weekDay[1][entry.key].classRoom == 'Blackboard'?'${weekDay[1][entry.key].classRoom}':'${weekDay[1][entry.key].classRoom} - ${weekDay[1][entry.key].Building}'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          fontFamily: 'Tajawal',
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                    ),
                  );
                }).toList()
            ),
          ),
          VerticalDivider(
              width: 1.5.w,
              thickness: 1.5.w,
              color: Colors.white
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: weekDay[2].asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      width: 93.w,
                      height: 31.h,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(color: Color.fromARGB(255, 112, 112, 112))
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${weekDay[2][entry.key].startTime.hour}:${weekDay[2][entry.key].startTime.minute} ${weekDay[2][entry.key].startTime.period.toString().split('.')[1]} - ${weekDay[2][entry.key].endTime.hour}:${weekDay[2][entry.key].endTime.minute} ${weekDay[2][entry.key].endTime.period.toString().split('.')[1]}\n'
                            + (weekDay[2][entry.key].classRoom == 'Blackboard'?'${weekDay[2][entry.key].classRoom}':'${weekDay[2][entry.key].classRoom} - ${weekDay[2][entry.key].Building}'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          fontFamily: 'Tajawal',
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                    ),
                  );
                }).toList()
            ),
          ),
          VerticalDivider(
              width: 1.5.w,
              thickness: 1.5.w,
              color: Colors.white
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: weekDay[3].asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      width: 93.w,
                      height: 31.h,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(color: Color.fromARGB(255, 112, 112, 112))
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${weekDay[3][entry.key].startTime.hour}:${weekDay[3][entry.key].startTime.minute} ${weekDay[3][entry.key].startTime.period.toString().split('.')[1]} - ${weekDay[3][entry.key].endTime.hour}:${weekDay[3][entry.key].endTime.minute} ${weekDay[3][entry.key].endTime.period.toString().split('.')[1]}\n'
                            + (weekDay[3][entry.key].classRoom == 'Blackboard'?'${weekDay[3][entry.key].classRoom}':'${weekDay[3][entry.key].classRoom} - ${weekDay[3][entry.key].Building}'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          fontFamily: 'Tajawal',
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                    ),
                  );
                }).toList()
            ),
          ),
          VerticalDivider(
              width: 1.5.w,
              thickness: 1.5.w,
              color: Colors.white
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                weekDay[4].asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      width: 93.w,
                      height: 31.h,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(color: Color.fromARGB(255, 112, 112, 112))
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${weekDay[4][entry.key].startTime.hour}:${weekDay[4][entry.key].startTime.minute} ${weekDay[4][entry.key].startTime.period.toString().split('.')[1]} - ${weekDay[4][entry.key].endTime.hour}:${weekDay[4][entry.key].endTime.minute} ${weekDay[4][entry.key].endTime.period.toString().split('.')[1]}\n'
                            + (weekDay[4][entry.key].classRoom == 'Blackboard'?'${weekDay[4][entry.key].classRoom}':'${weekDay[4][entry.key].classRoom} - ${weekDay[4][entry.key].Building}'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          fontFamily: 'Tajawal',
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
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
