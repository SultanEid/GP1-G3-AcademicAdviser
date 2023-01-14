import 'package:academic_adviser/Models/Student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../UniversalWidget/AAA_Icons_Pack.dart';

class StudentsListView extends StatefulWidget {
  const StudentsListView({Key? key, required this.studentList}) : super(key: key);
  final List<Student> studentList;
  @override
  State<StudentsListView> createState() => _StudentsListViewState(studentList: studentList);
}

class _StudentsListViewState extends State<StudentsListView> {
  _StudentsListViewState({Key? key, required this.studentList});
  final List<Student> studentList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Container(
              width: 1352.w,
              height: 83.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    width: 58.w,
                    height: 58.h,
                    child: Icon(
                      AAA_Icons_Pack.profile,
                      color: Colors.white,
                      size: 44.sp,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 75, 75, 75)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    width: 316.w,
                    child: SelectableText(
                      '${studentList[index].firstName} ${studentList[index].lastName}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6.w),
                    width: 215.w,
                    child: SelectableText(
                      '${studentList[index].academicID}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.w),
                    width: 150.w,
                    child: SelectableText(
                      '${studentList[index].gpa}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7.w),
                    width: 136.w,
                    child: SelectableText(
                      '${studentList[index].totalHours}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7.w),
                    width: 136.w,
                    child: SelectableText(
                      '${studentList[index].registeredHours}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 30.sp,
                          color: Color.fromARGB(255, 74, 73, 73),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 45.w),
                    width: 47.w,
                    height: 47.h,
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Icon(
                        AAA_Icons_Pack.chat,
                        color: Colors.white,
                        size: 26.sp,
                      ),
                      shape: CircleBorder(),
                      fillColor: Color.fromARGB(255, 113, 99, 192),
                    ),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    width: 140.w,
                    height: 47.h,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 25.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(24.sp),
                              )),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 113, 99, 192),
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }
}


/*
  List<String> StudentsUID = [];
  var StudentsListData = [];
  void getStudents() async {
   await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).collection("StudentList").doc("StudentData").get().then((Snapshot) {
      for (String Student in Snapshot.data()?["students"]) {
        setState(() {
          if (!StudentsUID.contains(Student)) {
            StudentsUID.add(Student);

            print(StudentsUID);
            FirebaseFirestore.instance
                .collection("StudentList")
                .doc(Student)
                .get()
                .then((StudentSnapshot) {
              StudentsListData.add(StudentData(
                name: StudentSnapshot["Name"],
                studentId: StudentSnapshot["studentId"],
                GPA: StudentSnapshot["GPA"],
                CH: StudentSnapshot["CH"],
                RH: StudentSnapshot["RH"],
              ));
              print(StudentData().name.toString());
            }); }  });
      }
    });
  }
   */