import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/Models/Note.dart';
<<<<<<< Updated upstream
import 'package:academic_adviser/pages/AcademicAdvisorView/Notes/Note/NoteCard.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Note/NoteCard.dart';



>>>>>>> Stashed changes
class Notes extends StatefulWidget {
  const Notes({Key? key, required this.user}) : super(key: key);
  final AcademicAdvisor user;
  @override
  State<Notes> createState() => _NotesState(user: user);
}

class _NotesState extends State<Notes> {
  _NotesState({Key? key, required this.user});
  final AcademicAdvisor user;

<<<<<<< Updated upstream
  /*
  List<Student> stdList = [
    Student(
        firstName: 'Mohammed',
        lastName: 'Alhusayni',
        Notes: [
          Note(
              reciver: 'Student',
              noteContent:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
          Note(
              reciver: 'Myself',
              noteContent:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
          Note(
              reciver: 'Myself',
              noteContent:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
          Note(
              reciver: 'Student',
              noteContent:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
          Note(
              reciver: 'Myself',
              noteContent:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
        ], currentStudyCourses: [], finishedCourses: []),
  ];

   */

  int _selectedName = 0;

  @override
  Widget build(BuildContext context) {
=======
  int _selectedName = 0;
  @override
  Widget build(BuildContext context) {

>>>>>>> Stashed changes
    return ScaffoldPlus(
      [
        Container(
            alignment: Alignment.topCenter,
            width: 1920.w,
            child: Container(
              width: 1541.5.w,
              height: 877.h,
              child: Row(
                children: [
                  Container(
                    width: 1006.w,
                    height: 877.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.sp),
                            bottomLeft: Radius.circular(30.sp))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Text(
                            'Notes'.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 59.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 1006.w,
                          height: 760.h,
                          child: GridView.builder(
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 479.w / 153.h,
                              ),
                              itemCount: user.student[_selectedName].notes?.length,
                              itemBuilder: (context, index) {
<<<<<<< Updated upstream
                                return NoteCard(
                                  color: user.student[_selectedName].notes?[index].receiver == 'Myself'? Color.fromARGB(255, 180, 145, 250):Color.fromARGB(255, 254, 200, 113),
                                  reciver: user.student[_selectedName].notes?[index].receiver,
                                  noteContent: user.student[_selectedName].notes?[index].noteContent,
                                );
=======
                                int IndexA=index;
                                return NoteCard(
                                    index : IndexA,
                                    selectedName: _selectedName,
                                    user: user,
                                  color: user.student[_selectedName].notes?[index].receiver == 'Myself'? Color.fromARGB(255, 180, 145, 250):Color.fromARGB(255, 254, 200, 113),
                                  noteContent: user.student[_selectedName].notes![index].noteContent,
                                  reciver: user.student[_selectedName].notes![index].receiver,
                                    onPress: (){
                                      setState(() {
                                      });
                                    },
                                );

>>>>>>> Stashed changes
                              }),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1.w,
                    width: 1.w,
                    color: Color.fromARGB(255, 112, 112, 112),
                  ),
                  Container(
                    width: 534.5.w,
                    height: 877.h,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.sp),
                            bottomRight: Radius.circular(30.sp))),
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: user.student.length,
                        itemBuilder: (context, int index) {
                          return Container(
                              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                              width: 501.w,
                              height: 83.h,
                              decoration: BoxDecoration(
                                  color: _selectedName == index? Color.fromARGB(255, 225, 225, 225):Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp)),
                              alignment: Alignment.centerLeft,
                              child: RawMaterialButton(
                                  fillColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverElevation:0,
                                  highlightElevation: 0,
                                  elevation: 0,
                                onPressed: (){
                                    setState(() {
                                      _selectedName = index;
                                    });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  width: 501.w,
                                  height: 83.h,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${user.student[index].firstName} ${user.student[index].lastName}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      fontFamily: 'Tajawal',
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              )
                          );
                        }),
                  ),
                ],
              ),
            )),
      ],
<<<<<<< Updated upstream
=======
      user: user,
>>>>>>> Stashed changes
    );
  }
}
