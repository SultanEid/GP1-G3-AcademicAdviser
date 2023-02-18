import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/Dashboard.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/AbsentsWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/AlertsWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/CoursesProgressWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/LevelTimeLineWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/NotesWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/DashboardWidget/ScoresWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/ReportWidget/ProfileWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/Scores.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'dart:html';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as IMG;

import '../../UniversalWidgetAA/MenuButton.dart';
import '../../UniversalWidgetAA/Backgraound.dart';
import '../../Wrapper.dart';
import '../Notes/Note.dart';
import '../Profile/Profile.dart';
import '../StudentList/StudentsList.dart';

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


    //Create the PDF document
    PdfDocument document = PdfDocument();
    document.pageSettings.size = Size(710 * 3.1, 710 * 6.4);

    //Add the page
    PdfPage page = document.pages.add();

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
        inside[indexes[index]] = true;
        RenderRepaintBoundary boundary = _globalKey[indexes[index]]
            .currentContext
            ?.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List? pngBytes = byteData?.buffer.asUint8List();
        setState(() {
          imageInMemory.add(pngBytes);
          inside[indexes[index]] = false;
        });

      } catch (e) {
        print(e);
      }
    }

    _convertImageToPDF();
  }

  List<int> checkBoxSelected = List.generate(6, (index) => 1);
  List<String> checkBoxNames = [
    'Profile',
    'LevelTimeLine',
    'Scores',
    'Alerts / Notes',
    'Courses Progress',
    'Absents Graph',
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

  late ThemeConfig themeConfig;
  @override
  Widget build(BuildContext context) {
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (user.theme! & themeConfig.theme) {
      user.theme = themeConfig.theme;
      //DB
    }
    return Stack(
      children: [
        BackgroundWidget(themeConfig: themeConfig,),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: SizedBox(
            width: 513.w,
            child: Drawer(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 513.w,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent
                          ]
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 28.h,),
                      Container(
                        width: 172.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/Logos/LogoWithoutStrapline.png',
                                ),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      SizedBox(height: 36.5.h,),
                      Divider(
                        color: Color.fromARGB(255, 162, 162, 162),
                        thickness: 1.5,
                        indent: 56.5.w,
                        endIndent: 56.5.w,
                      ),
                      SizedBox(height: 36.5.h,),
                      SizedBox(
                        width: 444.w,
                        height: 34.h,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'App Theme',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23.sp,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Original',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Tajawal',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Container(
                                  width: 20.w,
                                  height: 20.h,
                                  child: RawMaterialButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      if (themeConfig.theme) {
                                        setState(() {
                                          user.theme = false;
                                          themeConfig.orginalTheme();
                                          themeConfig.updateShouldNotify(themeConfig);
                                        });
                                      }
                                    },
                                    child: Container(
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
                                          color: !themeConfig.theme? themeConfig.primaryColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w,),
                                Text(
                                  'Acadimic',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Tajawal',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Container(
                                  width: 20.w,
                                  height: 20.h,
                                  child: RawMaterialButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      if (!themeConfig.theme) {
                                        setState(() {
                                          user.theme = true;
                                          themeConfig.acadimicTheme();
                                          themeConfig
                                              .updateShouldNotify(themeConfig);
                                        });
                                      }
                                    },
                                    child: Container(
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
                                          color: themeConfig.theme? themeConfig.primaryColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 3.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: themeConfig.primaryGradientColor,
                                ),
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 36.5.h,),
                      Divider(
                        color: Color.fromARGB(255, 162, 162, 162),
                        thickness: 1.5,
                        indent: 56.5.w,
                        endIndent: 56.5.w,
                      ),
                      SizedBox(height: 23.5.h,),
                      MenuButton(buttonLabel:"Services",icon: Icons.view_list_rounded, route: Services(Advisor: user,), themeConfig: themeConfig,),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Profile",icon: Icons.person,route: ProfilePage(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Dashboard",icon: Icons.dashboard, route: DashboardWidget(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Students' List",icon: Icons.list, route: StudentsListState(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Scores",icon: Icons.stacked_line_chart, route: ScoresWidget(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Notes",icon: Icons.edit_note_outlined, route: Notes(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                      MenuButton(buttonLabel:"Report",icon: Icons.library_books_outlined, route: Report(user: user,),themeConfig: themeConfig),
                      SizedBox(height: 21.h,),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 78.h,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
                color: themeConfig.primaryColor, size: 34.sp),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                  icon: Icon(
                    AAA_Icons_Pack.profile,
                    color: Colors.white,
                    size: 45.sp,
                  ),
                  offset: Offset(0, 50),
                  elevation: 0,
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("Sign out"),
                      ),
                    ];
                  },
                  onSelected: (value) async {
                    if (value == 0) {
                      await AuthService().SignOut();
                      setState(() {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Wrapper()), (Route<dynamic> route) => false);
                      });
                    }
                  },
                ),
                Container(padding: EdgeInsets.only(top: 10.h),alignment: Alignment.center,child: Text('Dr.${user.firstName} ${user.lastName}',style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'Tajawal',
                    color: themeConfig.servicesTitleColor),),)
              ],
            ),
          ),
          body: Container(
              alignment: Alignment.topCenter,
              width: 1920.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 66.w,
                    height: 877.h,
                    margin: EdgeInsets.only(right: 10.w),
                    child: Column(
                      children: [
                        Container(
                          width: 66.w,
                          height: 66.h,
                          margin: EdgeInsets.only(bottom: 10.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: RawMaterialButton(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Services(Advisor: user,)!), (Route<dynamic> route) => false);
                            },
                            child: ShaderMask(
                              child: SizedBox(
                                width: 36.w * 1.2,
                                height: 36.h * 1.2,
                                child: Icon(
                                  AAA_Icons_Pack.home,
                                  size: 36.sp,
                                  color: Colors.white,
                                ),
                              ),

                              shaderCallback: (Rect bounds) {
                                final Rect rect = Rect.fromLTRB(0, 0, 36.w, 36.h);
                                return LinearGradient(colors: themeConfig.primaryGradientColor).createShader(rect);
                              },
                            ),
                          ),
                        ),
                        Container(
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
                                return LinearGradient(colors: themeConfig.primaryGradientColor).createShader(rect);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                                                ? Color.fromARGB(255, 114, 72, 185)
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
                                                    LinearGradient(colors: themeConfig.primaryGradientColor)),
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
                                      child: LevelTimeLineDB(student: user.student[_selectedName], themeConfig: themeConfig,),
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
                                      child: ScoresDB(student: user.student[_selectedName], themeConfig: themeConfig,),
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
                                            AlertsWidgetDB(students: user.student[_selectedName],margin: 0,),
                                            NotesWidgetDB(student: user.student[_selectedName],margin: 0,isAdvisorView: true,),
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
                                        child: ProgressWidgetDB(student: user.student[_selectedName],)),
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
                                        child: AbsentsChartDB(students: user.student[_selectedName],isReport: true,)),
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
                  ),
                  SizedBox(
                    width: 76.w,
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

