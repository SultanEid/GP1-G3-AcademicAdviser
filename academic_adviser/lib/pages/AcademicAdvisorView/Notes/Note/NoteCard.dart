import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/LoadingWidget.dart';
import 'package:academic_adviser/Models/Note.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NoteCard extends StatefulWidget {
   NoteCard(
      {Key? key,
        required this.color,
        required this.user,
        required this.selectedName,
        required this.index,
        required this.onPress,
         this.note,
        required this.noteContent,
        required this.reciver,
      })
      : super(key: UniqueKey());
   Color? color;
  Note? note;
  AcademicAdvisor user;
  int selectedName;
   int index;
  VoidCallback onPress;
  String reciver;
  String noteContent;


  @override
  State<NoteCard> createState() => _NotesState(color: color , user: user , selectedName: selectedName , index: index,onPress: onPress,reciver: reciver,noteContent: noteContent,);
}

class _NotesState extends State<NoteCard> {
  _NotesState(
      {Key? key,
        required this.color,
        required this.user,
        required this.selectedName,
        required this.index,
        required this.onPress,
         this.note,
        required this.noteContent,
        required this.reciver,
      });
   Color? color;
  Note? note;
  AcademicAdvisor user;
  int selectedName;
  int index;
  VoidCallback onPress;
  String noteContent;
  String? text;
  String reciver;
  bool? NoteState=false;
  String? NoteID;
  Key key= UniqueKey();


    DatabaseReference DBR =  FirebaseDatabase.instance.ref("Student");

  //  void AddNote(String uid){
  //
  //  DBR.child(uid).child("UserNotes").once().then((DataSnapshot) {
  //     Map<String,dynamic>? data = DataSnapshot.snapshot.value as Map<String, dynamic>?;
  //     List<dynamic>? keyList = List.from(data!.keys);
  //     print(keyList);
  //   });
  // }

  //  void AddNote(String uid){
  //
  //    Query query = FirebaseDatabase.instance.ref("Student").child(uid).child("UserNotes").orderByKey();
  //    query.once().then((DataSnapshot snapshot) {
  //    });
  // }


  @override
  Widget build(BuildContext context) {
    print("A");
    print(index);
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        width: 479.w,
        height: 153.h,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(6.sp)),
        child: RawMaterialButton(
          fillColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverElevation:0,
          highlightElevation: 0,
          elevation: 0,
          onPressed: () {
            openDialog(context);
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        reciver,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 76, 76),
                          shape: BoxShape.circle),
                      child: IconButton(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            // user.student[selectedName].notes?.removeAt(index);
                            // AddNote(user.student[selectedName].uid);
                            // String indexPath = index.toString();
                            // FirebaseDatabase.instance.ref("Student").child(user.student[selectedName].uid).child("UserNotes").child(indexPath).remove();
                            // Map<dynamic ,dynamic> studentNote = {
                            //   'NoteID': "S1",
                            //   'NoteState' :true,
                            //   'Reciver':"Student",
                            //   'Text': "Hi adding from code",
                            // };
                            // DatabaseReference DBR =  FirebaseDatabase.instance.ref("Student").child(user.student[selectedName].uid).child("UserNotes").child("1").push();
                            //
                            // // DatabaseReference DBR =  FirebaseDatabase.instance.ref("Student").child(user.student[selectedName].uid).child("UserNotes").push();
                            // DBR.set({
                            //   'NoteID': "S1",
                            //   'NoteState' :true,
                            //   'Reciver':"Student",
                            //   'Text': "Hi adding from code",
                            // });
                            print(DBR.key);
                            onPress();
                          });
                        },
                        icon: Icon(
                          AAA_Icons_Pack.delete,
                          color: Colors.white,
                          size: 14.sp,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Icon(
                        AAA_Icons_Pack.notification,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                  child: Container(
                    width: 459.w,
                    height: 90.h,
                    child: Text(
                      noteContent,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
  Future openDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: color,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    reciver,
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
                        noteContent,
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
