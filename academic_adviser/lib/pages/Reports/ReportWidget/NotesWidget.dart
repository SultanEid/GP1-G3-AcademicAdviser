import 'package:academic_adviser/Models/Alert.dart';
import 'package:academic_adviser/Models/Note.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../Models/Note.dart';
import '../../../Models/Student.dart';

class NotesWidgetR extends StatefulWidget {
   NotesWidgetR({Key? key , required this.student}) : super(key: key);
  Student student;
  @override
  State<NotesWidgetR> createState() => _NotesWidgetR(student: student);
}

class _NotesWidgetR extends State<NotesWidgetR> {
  _NotesWidgetR({required this.student});
  Student student;
  // List<Note> stdnotes = [
  //   Note(
  //       reciver: 'Myself',
  //       noteContent:
  //           'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
  //   Note(
  //       reciver: 'Student',
  //       noteContent:
  //           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
  //   Note(
  //       reciver: 'Myself',
  //       noteContent:
  //           'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      width: 325.w,
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
            color:  note.receiver == 'Myself'
                ? Color.fromARGB(255, 180, 145, 250)
                : Color.fromARGB(255, 254, 200, 113),
            borderRadius: BorderRadius.circular(10.sp)),
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
      ),);
  }

}
