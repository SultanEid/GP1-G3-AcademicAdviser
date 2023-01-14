import 'package:academic_adviser/Models/AcademicAdvisor.dart';
<<<<<<< Updated upstream
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/ReportWidget/AlertsWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/ReportWidget/NotesWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/ReportWidget/ProfileWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/ReportWidget/ScoresWidget.dart';
=======

>>>>>>> Stashed changes
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'dart:html';
<<<<<<< Updated upstream
=======
import 'package:flutter/material.dart';
>>>>>>> Stashed changes
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as IMG;
<<<<<<< Updated upstream
import 'ReportWidget/AbsentsWidget.dart';
import 'ReportWidget/CoursesProgressWidget.dart';
import 'ReportWidget/LevelTimeLineWidget.dart';
=======

import 'ReportWidget/AbsentsWidget.dart';
import 'ReportWidget/AlertsWidget.dart';
import 'ReportWidget/CoursesProgressWidget.dart';
import 'ReportWidget/LevelTimeLineWidget.dart';
import 'ReportWidget/NotesWidget.dart';
import 'ReportWidget/ProfileWidget.dart';
import 'ReportWidget/ScoresWidget.dart';
>>>>>>> Stashed changes

class Report extends StatefulWidget {
   Report({Key? key ,required this.user}) : super(key: key);
  AcademicAdvisor user;
  @override
  State<Report> createState() => _ReportState(user: user);
}

class _ReportState extends State<Report> {
  _ReportState({required this.user});
AcademicAdvisor user;
  Future<void> _convertImageToPDF() async {
<<<<<<< Updated upstream

    print('sd');

    //Create the PDF document
    PdfDocument document = PdfDocument();
    document.pageSettings.size = Size(710 * 3.1, 710 * 6.4);
=======
    print('sd');
    //Create the PDF document
    PdfDocument document = PdfDocument();
    document.pageSettings.size = Size(710 * 3.3, 710 * 6.4);
>>>>>>> Stashed changes

    //Add the page
    PdfPage page = document.pages.add();

    print(indexes);
    double top = 0;
    for(int index = 0; index < indexes.length; index ++){
      final PdfImage image = PdfBitmap(imageInMemory![index] as Uint8List);
      Size size = image.physicalDimension;
      page.graphics.drawImage(image, Rect.fromLTWH(0, top, size.width, size.height));
      top += size.height;
    }

    //Save the document
    List<int> bytes = await document.save();

    // Dispose the document
    document.dispose();

    indexes.clear();
    imageInMemory.clear();
    saveAndLaunchFile(bytes, 'out11.pdf');
  }

  Uint8List? resizeImage(Uint8List data, int width, int highet) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: highet);
    resizedData = IMG.encodeJpg(resized) as Uint8List?;
    return resizedData;
  }

  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', fileName)
      ..click();
  }

  final List<GlobalKey> _globalKey = List.generate(6, (index) => GlobalKey());
  List<bool> inside = List.generate(6, (index) => false);
  List<Uint8List?> imageInMemory = [];
  List<int> indexes = [];
  void _capturePng() async {

    for(int index = 0; index < checkBoxSelected.length; index ++){
      if(checkBoxSelected[index] == 1){
        indexes.add(index);
      }
    }
    for (int index = 0; index < indexes.length ; index++) {
      try {
        print('inside');
        inside[indexes[index]] = true;
        RenderRepaintBoundary boundary = _globalKey[indexes[index]]
            .currentContext
            ?.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List? pngBytes = byteData?.buffer.asUint8List();
        print('png done');
        print(indexes[index]);
        setState(() {
          imageInMemory.add(pngBytes);
          inside[indexes[index]] = false;
        });

        print('sd1');
      } catch (e) {
        print(e);
      }
    }

    _convertImageToPDF();
  }

  // List<Student> stdList = [
  //   Student(
  //     firstName: 'Mohammed',
  //     lastName: 'Alhusayni',
  //     totalHours: 101,
  //     registerdHours: 114,
  //     GPA: 4.66,
  //     PlanHours: 153,
  //     studentID: '4000951',
  //     department: 'Computer Science',
  //     phone: '0537913432',
  //     academicEmail: 'mohamedelhussini2001@gmail.com',
  //     Notes: [],
  //     currentStudyCourses: [],
  //     finishedCourses: [],
  //   ),
  // ];

  List<int> checkBoxSelected = List.generate(6, (index) => 1);
  List<String> checkBoxNames = [
    'Profile',
    'LevelTimeLine',
    'Scores',
    'Alerts / Notes',
    'Courses Progress',
    'Absents Graph',
  ];

  List<Color> colors = [
    Color.fromARGB(255, 96, 220, 220),
    Color.fromARGB(255, 114, 72, 185),
  ];
  int _selectedName = 0;
  List<Size> sizes = [
    Size(251, 290), //0.86597938144329896907216494845361
    Size(649, 107),
    Size(649, 172),
    Size(649, 173),
    Size(649, 145),
    Size(649, 306),
    Size(649, 306),
  ];

  @override
  Widget build(BuildContext context) {
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
                    width: 279.w,
                    height: 877.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.sp),
                            bottomLeft: Radius.circular(30.sp))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,

                              child: Container(
                                width: 66.w,
                                height: 66.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.sp)
                                ),
                                child: RawMaterialButton(
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    _capturePng();
                                  },
                                  child: ShaderMask(
                                    child: SizedBox(
                                      width: 36.w * 1.2,
                                      height: 36.h * 1.2,
                                      child: Icon(
                                        AAA_Icons_Pack.print,
                                        size: 36.sp,
                                        color: Colors.white,
                                      ),
                                    ),

                                    shaderCallback: (Rect bounds) {
                                      final Rect rect = Rect.fromLTRB(0, 0, 36.w, 36.h);
                                      return LinearGradient(colors: colors).createShader(rect);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Text(
                                'REPORTS'.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal',
                                    color: Colors.black,
                                    letterSpacing: 5.sp),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 107, 107, 107),
                          indent: 20.w,
                          endIndent: 20.w,
                        ),
                        Column(
                            children: checkBoxSelected.asMap().entries.map((entry) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: RawMaterialButton(
                                  mouseCursor: entry.key == 0? SystemMouseCursors.noDrop:SystemMouseCursors.click,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: entry.key != 0 ? () {
                                setState(() {
                                  if (checkBoxSelected[entry.key] == 0) {
                                    checkBoxSelected[entry.key] = 1;
                                  } else {
                                    checkBoxSelected[entry.key] = 0;
                                  }
                                });
                              }:(){},
                              child: Container(
                                width: 257.w,
                                height: 35.h,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            checkBoxNames[entry.key],
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 23.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Tajawal',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5.h),
                                              width: 19.w,
                                              height: 19.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.sp),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 112, 112, 112),
                                                    width: 1.sp),
                                              ),
                                              child: Container(
                                                width: 15.w,
                                                height: 15.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.sp),
                                                  color: checkBoxSelected[
                                                              entry.key] ==
                                                          1
                                                      ? Color.fromARGB(
                                                          255, 114, 72, 185)
                                                      : Colors.transparent,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 257.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.sp),
                                          gradient:
                                              LinearGradient(colors: colors)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                      ],
                    ),
                  ),
                  Container(
                    width: 710.w,
                    height: 877.h,
                    color: Color.fromARGB(255, 245, 245, 245),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          checkBoxSelected[0] == 1
                              ? SizedBox(
                                  width: 710.w,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    alignment: Alignment.center,
                                    child: RepaintBoundary(
                                      key: _globalKey[0],
                                      child: ProfileWidgetR(
                                        student: user.student[_selectedName],
                                        width: 649.w,
                                        height: 220.35.h,
                                        //width: 346.5.w,
                                        //height: 117.04.h,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          checkBoxSelected[1] == 1
                              ? SizedBox(
                                  width: 710.w,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    alignment: Alignment.center,
                                    child: RepaintBoundary(
                                      key: _globalKey[1],
                                      child: LevelTimeLineR(),
                                    ),
                                  ),
                                )
                              : Container(),
                          checkBoxSelected[2] == 1
                              ? SizedBox(
                                  width: 710.w,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    alignment: Alignment.center,
                                    child: RepaintBoundary(
                                      key: _globalKey[2],
                                      child: ScoresR(student: user.student[_selectedName],),
                                    ),
                                  ),
                                )
                              : Container(),
                          checkBoxSelected[3] == 1
                              ? SizedBox(
                                  width: 710.w,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    alignment: Alignment.center,
                                    child: RepaintBoundary(
                                        key: _globalKey[3],
                                        child: Row(
                                          children: [
                                            AlertsWidgetR(student: user.student[_selectedName],),
                                            NotesWidgetR(student: user.student[_selectedName],),
                                          ],
                                        )),
                                  ),
                                )
                              : Container(),
                          checkBoxSelected[4] == 1
                              ? SizedBox(
                                  width: 710.w,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    alignment: Alignment.center,
                                    child: RepaintBoundary(
                                        key: _globalKey[4],
                                        child: ProgressWidgetR(student: user.student[_selectedName],)),
                                  ),
                                )
                              : Container(),
                          checkBoxSelected[5] == 1
                              ? SizedBox(
                                  width: 710.w,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    alignment: Alignment.center,
                                    child: RepaintBoundary(
                                        key: _globalKey[5],
                                        child: AbsentsChartR(students: user.student[_selectedName],)),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 15.w),
                              width: 501.w,
                              height: 83.h,
                              decoration: BoxDecoration(
                                  color: _selectedName == index
                                      ? Color.fromARGB(255, 225, 225, 225)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp)),
                              alignment: Alignment.centerLeft,
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
                                    setState(() {
                                      _selectedName = index;
                                    });
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
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
                                  )));
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

