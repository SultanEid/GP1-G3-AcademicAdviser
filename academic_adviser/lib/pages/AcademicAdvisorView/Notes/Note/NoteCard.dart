import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteCard extends StatefulWidget {
  NoteCard({
    Key? key,
    required this.color,
    required this.user,
    required this.selectedName,
    required this.index,
    required this.noteIndexMap,
    required this.userNoteMap,
    required this.userID,
    required this.retriveAfterDelete,
  }) : super(key: UniqueKey());
  Color? color;
  AcademicAdvisor user;
  int selectedName;
  int index;
  Map<String, dynamic> noteIndexMap;
  Map<String, dynamic> userNoteMap;
  String userID;
  VoidCallback retriveAfterDelete;

  @override
  State<NoteCard> createState() => _NotesState(
    color: color,
    user: user,
    selectedName: selectedName,
    index: index,
    noteIndexMap: noteIndexMap,
    userNoteMap: userNoteMap,
    userID: userID,
    retriveAfterDelete: retriveAfterDelete,
  );
}

class _NotesState extends State<NoteCard> {
  _NotesState({
    Key? key,
    required this.color,
    required this.user,
    required this.selectedName,
    required this.index,
    required this.noteIndexMap,
    required this.userNoteMap,
    required this.userID,
    required this.retriveAfterDelete,
  });
  Color? color;
  AcademicAdvisor user;
  int selectedName;
  int index;
  Key key = UniqueKey();
  Map<String, dynamic> noteIndexMap;
  Map<String, dynamic> userNoteMap;
  String userID;
  String? noteInput;
  VoidCallback retriveAfterDelete;
  int emptyNotes=0;
  String? _selectedNotetype;

  Future<String> DeleteNote(String NoteID) async {
    await FirebaseDatabase.instance
        .ref("Student")
        .child(user.student[selectedName].uid)
        .child("StudentNotes")
        .child(NoteID)
        .remove();
    if(userNoteMap.length+1==1){
      emptyNotes=1;
    }
    return "Deleteddddddddddddddddddddddddddddddddddddddddddddd";
  }

  @override
  Widget build(BuildContext context) {
    noteInput = noteIndexMap["Text"].toString();
    _selectedNotetype =noteIndexMap["Reciver"].toString();

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
          hoverElevation: 0,
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
                        noteIndexMap["Reciver"].toString(),
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
                        onPressed: () {
                          DeleteNote(noteIndexMap["NoteID"].toString());
                          setState(() {
                            retriveAfterDelete();
                          });

                        },
                        icon: Icon(
                          AAA_Icons_Pack.delete,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                  child: Container(
                    width: 459.w,
                    height: 77.h,
                    child: Text(
                      noteIndexMap["Text"],
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
                    noteIndexMap["Reciver"],
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
                    onPressed: () {

                      DeleteNote(noteIndexMap["NoteID"].toString());
                      setState(() {
                        retriveAfterDelete();
                      });
                      Navigator.pop(context);


                    },
                    icon: Icon(
                      AAA_Icons_Pack.delete,
                      color: Colors.white,
                      size: 20.sp,
                    ),
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
                        noteIndexMap["Text"],
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
