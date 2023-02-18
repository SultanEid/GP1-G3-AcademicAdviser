
import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Note.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../StudentView/Notes/Note.dart';
import '../../Notes/Note.dart';
class NotesWidgetDB extends StatefulWidget {
  NotesWidgetDB({Key? key ,required this.student, this.margin, this.selectedStudent,this.advisor,required this.isAdvisorView}) : super(key: key);
  Student student;
  AcademicAdvisor? advisor;
  double? margin;
  int? selectedStudent;
  bool isAdvisorView;
  @override
  State<NotesWidgetDB> createState() => _NotesWidgetDB(student: student,margin: margin,advisor:advisor);
}

class _NotesWidgetDB extends State<NotesWidgetDB> {
  _NotesWidgetDB({required this.student, this.margin,this.advisor});
  Student student;
  double? margin;
  bool readData = true;
 static Map<String, dynamic> studentNotes = {};
AcademicAdvisor? advisor;
 static List<String> noteKeys = [];
  void ReadNote() async {
    noteKeys.clear();
    studentNotes.clear();
    student.notes!.clear();
    await FirebaseDatabase.instance
        .ref("Student")
        .child(student.uid)
        .child("StudentNotes").once().then((Event) {

      Map<String, dynamic>? stuNotes =
      Event.snapshot.value as Map<String, dynamic>?;
      studentNotes = Map.fromEntries(
          stuNotes!.entries.map((e) => MapEntry(e.key, e.value)));


      noteKeys = studentNotes.keys.toList();

      for(int i=0;i<noteKeys.length;i++){
        student.notes!.insert(i,Note(noteID: studentNotes[noteKeys[i]]["NoteID"], receiver: studentNotes[noteKeys[i]]["Reciver"], noteContent: studentNotes[noteKeys[i]]["Text"]));
      }
      student.notes!.removeAt(0);
    });
  }

  void RemoveAdvisorNotes(){
    List<Note> onlyStudentNotes = [];
    for(int i =0;i<student.notes!.length;i++){
      if(student.notes![i].receiver=="Student"){
        onlyStudentNotes.add(student.notes![i]);
      }
    }
    student.notes=onlyStudentNotes;
  }
  @override
  Widget build(BuildContext context) {
    if(readData && widget.isAdvisorView){

      Future.delayed(Duration(milliseconds: 10), () {
        setState(() {
          ReadNote();
          readData = false;
        });
      });
    }
    if(!widget.isAdvisorView){
      RemoveAdvisorNotes();
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin == null? 15.w:margin!.w),
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
                child: TextButton(
                  onPressed: () {
                    if(widget.isAdvisorView){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notes(user: advisor!,selectedStudent: widget.selectedStudent,)),
                      );
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentNotes(user: student,)),);
                    }
                  }, // add navigate here-------------------
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
              ),
              Container(
                width: 292.w,
                height: 234.h,
                child: ListView.builder(
                    itemCount: student.notes!.length,
                    itemBuilder: (context, index) {
                      return NoteCardWidgtDB(note: student.notes![index],);
                    }),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 15.w,bottom: 15.h),
            alignment: Alignment.bottomRight,
          ),
        ],
      )
    );
  }
}

class NoteCardWidgtDB extends StatelessWidget {
  NoteCardWidgtDB({Key? key,required this.note}) : super(key: key);
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
                        note.noteContent,
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
