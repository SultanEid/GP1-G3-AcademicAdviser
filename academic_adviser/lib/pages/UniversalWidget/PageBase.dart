import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Services/Authentication.dart';
import 'AAA_Icons_Pack.dart';

class ScaffoldPlus extends StatelessWidget {
   ScaffoldPlus(this.children, {Key? key ,required this.user}) : super(key: key);
  final List<Widget> children;
  AcademicAdvisor user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget(),
        Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SizedBox(
          width: 513.w,
          child: Drawer(
            child: Menu(user: user,),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 78.h,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 114, 72, 185), size: 34.sp),
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
                      child: Text("My profile"),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Sign out"),
                    ),
                  ];
                },
                onSelected: (value) async {
                  if (value == 0) {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(uid: FirebaseAuth.instance.currentUser?.uid)));
                  } else if (value == 1) {
                    await AuthService().SignOut();
                  }
                },
              ),
              /*
              Container(
                alignment: Alignment.center,
                width: 228.w,
                height: 50.h,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Profile')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Text("Waiting for data");
                        default:
                          return ListView(
                            children:
                            snapshot.data!.docs.map((DocumentSnapshot Doc) {
                              return ListTile(
                                title: Text(
                                  Doc['Name'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Tajawal',
                                      color: Colors.white),
                                ),
                              );
                            }).toList(),
                          );
                      }
                    }),
              ),
               */
            ],
          ),
        ),
        body: Stack(
          children: children,
          alignment: Alignment.topCenter,
        )
    ),
      ],
    );
  }
}
