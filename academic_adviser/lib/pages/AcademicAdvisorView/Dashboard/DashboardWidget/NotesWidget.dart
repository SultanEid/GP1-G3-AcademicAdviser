
import 'package:academic_adviser/Models/Note.dart';
<<<<<<< Updated upstream
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

=======
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../Models/Student.dart';
>>>>>>> Stashed changes
class NotesWidgetDB extends StatefulWidget {
   NotesWidgetDB({Key? key ,required this.student}) : super(key: key);
  Student student;
  @override
  State<NotesWidgetDB> createState() => _NotesWidgetDB(student: student);
}

class _NotesWidgetDB extends State<NotesWidgetDB> {
  _NotesWidgetDB({required this.student});
  Student student;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      width: 351.w,
      height: 306.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.sp)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  'NOTES',
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
                    itemCount: student.notes!.length,
                    itemBuilder: (context, index) {
                      return NoteCardWidgtDB(note: student.notes![index]);
                    }),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 15.w,bottom: 15.h),
            alignment: Alignment.bottomRight,
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 96, 220, 220),
                    Color.fromARGB(255, 114, 72, 185),
                  ]
                )
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverElevation: 0,
                highlightElevation: 0,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                ),
                onPressed: () {},
                child: Icon(
                    Icons.add,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
            )
          ),
        ],
      )
    );
  }
}

class NoteCardWidgtDB extends StatelessWidget {
  NoteCardWidgtDB({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        width: 292.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: note.receiver == 'Myself'
                ? Color.fromARGB(255, 180, 145, 250)
                : Color.fromARGB(255, 254, 200, 113),
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
              Container(
                  margin: EdgeInsets.only(left: 10.w, top: 3.h, bottom: 3.h),
                  width: 161.w,
                  child: RichText(
                    overflow: TextOverflow.fade,
                    text: TextSpan(
                      text: note.noteContent,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                  )),
              Expanded(
                child: Center(
                  child: Text(
                    note.receiver,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.sp),
                child: Icon(
                  AAA_Icons_Pack.notification,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ));
  }

  Future openDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: note.receiver == 'Myself'
                ? Color.fromARGB(255, 180, 145, 250)
                : Color.fromARGB(255, 254, 200, 113),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    note.receiver,
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
                  width: 35.w,
                  height: 35.h,
                  child: Icon(
                    AAA_Icons_Pack.notification,
                    color: Colors.white,
                    size: 20.sp,
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
                        note.noteContent!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
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
