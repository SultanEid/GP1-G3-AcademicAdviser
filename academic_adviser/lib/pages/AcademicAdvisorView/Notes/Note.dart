
import 'package:academic_adviser/pages/AcademicAdvisorView/Dashboard/Dashboard.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Notes/Note/NoteCard.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Profile/Profile.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Reports/Reports.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Scores/Scores.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/Services.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/StudentList/StudentsList.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Models/AcademicAdvisor.dart';
import '../../UniversalWidgetAA/AAA_Icons_Pack.dart';
import '../../UniversalWidgetAA/Backgraound.dart';
import '../../UniversalWidgetAA/MenuButton.dart';
import '../../Wrapper.dart';

class Notes extends StatefulWidget {
  Notes({Key? key, required this.user,this.selectedStudent}) : super(key: key);
  final AcademicAdvisor user;
  int? selectedStudent;
  @override
  State<Notes> createState() => _NotesState(user: user);
}

class _NotesState extends State<Notes> {
  _NotesState({Key? key, required this.user});

  final AcademicAdvisor user;
  Map<String, dynamic> studentNotes = {};
  List<String> noteKeys = [];
  int _selectedName = 0;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  //Handling
  bool readData = true;

  //========================add note page vars
  bool isAdd = false;
  int _currentReceiver = 0;
  String? noteInput = "Emptey Note";
  late ThemeConfig themeConfig;
  static Map<String, dynamic> studentFirstNotes = {};
  late DatabaseReference firstNoteKey;
  String? firstNote;

  void ReadNote(String uid) async {
    await FirebaseDatabase.instance
        .ref("Student")
        .child(user.student[_selectedName].uid)
        .child("StudentNotes")
        .onValue
        .listen((Event) {

      Map<String, dynamic>? stuNotes =
      Event.snapshot.value as Map<String, dynamic>?;
      studentNotes = Map.fromEntries(
          stuNotes!.entries.map((e) => MapEntry(e.key, e.value)));
      noteKeys = studentNotes.keys.toList();
    });
  }

  void SetNote(String uid, String noteContent, String noteType) {
    final studentNotes = FirebaseDatabase.instance
        .ref("Student")
        .child(uid)
        .child("StudentNotes");
    DatabaseReference noteCreatedkey = studentNotes.push();
    Map<String, dynamic> note = {
      'NoteID': noteCreatedkey.key.toString(),
      'NoteState': true,
      'Reciver': noteType,
      'Text': noteContent,
    };
    noteCreatedkey.set(note);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.selectedStudent != null){
      _selectedName = widget.selectedStudent!;
    }
    if (!isAdd && readData) {
      Future.delayed(Duration(microseconds: 10), () {
        setState(() {
          ReadNote(user.student[_selectedName].uid);
        });
      });
      readData = false;
    }
    themeConfig = context.findAncestorWidgetOfExactType<ThemeConfig>()!;
    if (user.theme! & themeConfig.theme) {
      user.theme = themeConfig.theme;
      //DB
    }
    return Stack(
      children: [
        BackgroundWidget(
          themeConfig: themeConfig,
        ),
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
                          colors: [Colors.black, Colors.transparent])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      Container(
                        width: 172.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/Logos/LogoWithoutStrapline.png',
                                ),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        height: 36.5.h,
                      ),
                      Divider(
                        color: Color.fromARGB(255, 162, 162, 162),
                        thickness: 1.5,
                        indent: 56.5.w,
                        endIndent: 56.5.w,
                      ),
                      SizedBox(
                        height: 36.5.h,
                      ),
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
                                SizedBox(
                                  width: 10.w,
                                ),
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
                                          BorderRadius.circular(4.sp),
                                          color: !themeConfig.theme
                                              ? themeConfig.primaryColor
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Acadimic',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Tajawal',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
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
                                        borderRadius: BorderRadius.circular(4.sp),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112),
                                            width: 1.sp),
                                      ),
                                      child: Container(
                                        width: 15.w,
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.sp),
                                          color: themeConfig.theme ? themeConfig.primaryColor : Colors.transparent,
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
                      SizedBox(
                        height: 36.5.h,
                      ),
                      Divider(
                        color: Color.fromARGB(255, 162, 162, 162),
                        thickness: 1.5,
                        indent: 56.5.w,
                        endIndent: 56.5.w,
                      ),
                      SizedBox(
                        height: 23.5.h,
                      ),
                      MenuButton(
                        buttonLabel: "Services",
                        icon: Icons.view_list_rounded,
                        route: Services(
                          Advisor: user,
                        ),
                        themeConfig: themeConfig,
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Profile",
                          icon: Icons.person,
                          route: ProfilePage(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Dashboard",
                          icon: Icons.dashboard,
                          route: DashboardWidget(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Students' List",
                          icon: Icons.list,
                          route: StudentsListState(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Scores",
                          icon: Icons.stacked_line_chart,
                          route: ScoresWidget(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Notes",
                          icon: Icons.edit_note_outlined,
                          route: Notes(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
                      MenuButton(
                          buttonLabel: "Report",
                          icon: Icons.library_books_outlined,
                          route: Report(
                            user: user,
                          ),
                          themeConfig: themeConfig),
                      SizedBox(
                        height: 21.h,
                      ),
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
            iconTheme:
            IconThemeData(color: themeConfig.primaryColor, size: 34.sp),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              borderRadius: BorderRadius.circular(15.sp)),
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
                                final Rect rect =
                                Rect.fromLTRB(0, 0, 36.w, 36.h);
                                return LinearGradient(
                                    colors:
                                    themeConfig.primaryGradientColor)
                                    .createShader(rect);
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 66.w,
                          height: 66.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: RawMaterialButton(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: isAdd
                                ? null
                                : () {
                              setState(() {
                                isAdd = true;
                              });
                            },
                            child: ShaderMask(
                              child: SizedBox(
                                width: 36.w * 1.2,
                                height: 36.h * 1.2,
                                child: Icon(
                                  Icons.add,
                                  size: 36.sp,
                                  color: Colors.white,
                                ),
                              ),
                              shaderCallback: (Rect bounds) {
                                final Rect rect =
                                Rect.fromLTRB(0, 0, 36.w, 36.h);
                                return LinearGradient(
                                    colors:
                                    themeConfig.primaryGradientColor)
                                    .createShader(rect);
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
                        isAdd
                            ? Form(
                          key: _key,
                          child: Container(
                            width: 1006.w,
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
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 20.h),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Add Notes',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 59.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Tajawal',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 905.w,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 905.w,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Receiver info',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            fontFamily: 'Tajawal',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 43.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Receiver :',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        fontFamily: 'Tajawal',
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.h,
                                    ),
                                    Container(
                                      width: 177.w,
                                      height: 27.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.sp),
                                        gradient: LinearGradient(
                                          colors: _currentReceiver == 0
                                              ? themeConfig
                                              .primaryGradientColor
                                              : [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                        ),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112)),
                                      ),
                                      child: RawMaterialButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          setState(() {
                                            _currentReceiver = 0;
                                          });
                                        },
                                        child: Text(
                                          'Student',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: 'Tajawal',
                                            color: _currentReceiver == 0
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.h,
                                    ),
                                    Container(
                                      width: 177.w,
                                      height: 27.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.sp),
                                        gradient: LinearGradient(
                                          colors: _currentReceiver == 1
                                              ? themeConfig
                                              .primaryGradientColor
                                              : [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                        ),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112)),
                                      ),
                                      child: RawMaterialButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          setState(() {
                                            _currentReceiver = 1;
                                          });
                                        },
                                        child: Text(
                                          'MySelf',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: 'Tajawal',
                                            color: _currentReceiver == 1
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 43.h,
                                ),
                                Container(
                                  width: 905.w,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 905.w,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Note info',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            fontFamily: 'Tajawal',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 43.h,
                                ),
                                Container(
                                  height: 300.h,
                                  width: 905.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp)),
                                  ),
                                  //hello there
                                  child: TextFormField(
                                    validator: (text){
                                      if(text == null || text.isEmpty){
                                        return 'Note Content should not be empty!';
                                      }
                                      return null;
                                    },
                                    onChanged: (noteInputValue) {
                                      if (noteInput!.isEmpty) {
                                        noteInput = "";
                                      } else {
                                        noteInput = noteInputValue;
                                      }
                                    },
                                    textAlignVertical:
                                    TextAlignVertical.top,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      labelText: "Note Content",
                                      hintText:
                                      "E.g. Can we meet sat at 8pm ?",
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: themeConfig
                                                  .primaryColor)),
                                      floatingLabelStyle: TextStyle(
                                          color: themeConfig.primaryColor),
                                    ),
                                    autofocus: true,
                                    expands: true,
                                    minLines: null,
                                    maxLines: null,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  width: 905.w,
                                  child: Divider(
                                    height: 1.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 161.w,
                                      height: 34.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10.sp),
                                        gradient: LinearGradient(
                                            colors: themeConfig
                                                .primaryGradientColor),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112)),
                                      ),
                                      child: RawMaterialButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          //addScoreP
                                          if(_key.currentState!.validate()){
                                            SetNote(
                                                user.student[_selectedName]
                                                    .uid,
                                                noteInput!,
                                                _currentReceiver == 0
                                                    ? 'Student'
                                                    : 'Myself');
                                            isAdd = false;
                                            readData = true;
                                            noteInput = "Emptey Note";
                                            _currentReceiver = 0;
                                            setState(() {});
                                          }
                                        },
                                        child: Text(
                                          'add',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Tajawal',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.h,
                                    ),
                                    Container(
                                      width: 161.w,
                                      height: 34.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.sp),
                                        color: Color.fromARGB(
                                            255, 252, 85, 119),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112)),
                                      ),
                                      child: RawMaterialButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          setState(() {
                                            //CloseAddScoreP
                                            isAdd = false;
                                          });
                                        },
                                        child: Text(
                                          'close',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Tajawal',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                            : Container(
                          width: 1006.w,
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
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 20.h),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Notes'.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 59.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Tajawal',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 1006.w,
                                height: 760.h,
                                child: studentNotes.length==1 ?Container(
                                  margin: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    "No notes available",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Tajawal',
                                      color: Colors.black45,
                                    ),
                                  ),) : GridView.builder(
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 479.w / 153.h,
                                    ),
                                    itemCount: noteKeys.length-1,
                                    itemBuilder: (context, index) {
                                      index++;
                                      return NoteCard(
                                        index: index,
                                        selectedName: _selectedName,
                                        user: user,
                                        color:
                                        studentNotes[noteKeys[index]]
                                        ["Reciver"] ==
                                            'Myself'
                                            ? Color.fromARGB(
                                            255, 180, 145, 250)
                                            : Color.fromARGB(
                                            255, 254, 200, 113),
                                        noteIndexMap:
                                        studentNotes[noteKeys[index]],
                                        userNoteMap: studentNotes,
                                        userID: user
                                            .student[_selectedName].uid!,
                                        retriveAfterDelete: () {
                                          Future.delayed(Duration(microseconds: 20),(){
                                            setState(() {
                                              readData=true;
                                            });
                                          });

                                        },
                                      );
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 15.w),
                                    width: 501.w,
                                    height: 83.h,
                                    decoration: BoxDecoration(
                                        color: _selectedName == index
                                            ? Color.fromARGB(255, 225, 225, 225)
                                            : Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(10.sp)),
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
                                            readData = true;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
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
