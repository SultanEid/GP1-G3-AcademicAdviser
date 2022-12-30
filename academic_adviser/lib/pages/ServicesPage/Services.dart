import 'dart:js_util';

import 'package:academic_adviser/Database/Database.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart' as GlobalVaribales;
import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/pages/Profile/Profile.dart';
import 'package:academic_adviser/pages/ServicesPage/ServicesWidget/ServicesCard.dart';
import 'package:academic_adviser/pages/StudentList/StudentsList.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/UniversalWidget/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Models/DatabaseVariable.dart';

class Services extends StatelessWidget {
 // const Services({Key? key}) : super(key: key);
 String? uid;
 String? collecionName;
    Services({  this.uid,  this.collecionName});
    String ProfileName="";
    DatabaseVariable UserServices = DatabaseVariable();
    TheUser User = TheUser();

  @override
  Widget build(BuildContext context) {
    CollectionReference Services = FirebaseFirestore.instance.collection(collecionName!);
    return FutureBuilder<DocumentSnapshot>(
      future: Services.doc(uid).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          UserServices.Name = Text("${data['Name']}").data.toString();
        }
        return Scaffold(
              extendBodyBehindAppBar: true,
              drawer: SizedBox(
                width: 513.w,
                child: Drawer(
                  child: Menu(),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              appBar: AppBar(
                toolbarHeight: 78.h ,
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Color.fromARGB(255, 114, 72, 185),size: 34.sp),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                          AAA_Icons_Pack.profile,
                        color: Colors.white,
                        size: 45.sp,
                      ),
                      Text(
                        UserServices.Name!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tajawal', color: Colors.white
                        ),
                      ),
                    ],
                ),
              ),
              body: Stack(alignment: Alignment.center, children: [
                  BackgroundWidget(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 129.h,
                      ),
                      Container(
                        width: 383.63.w,
                        height: 106.93.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/Logos/LogoWithoutStrapline.png',
                                ),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        height: 41.1.h,
                      ),
                      Text(
                        'Our ServicesPage Features',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 231, 248, 249),
                            fontFamily: 'Tajawal'),
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      Container(
                        width: 1267.w,
                        height: 619.h,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ServicesCard(
                                    label: 'Profile',
                                    Route: Profile(uid: uid,),
                                    children:  [
                                      TextSpan(
                                          text: 'profile',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: ' is where you find all your academic information and certificates'
                                      )
                                    ],
                                    icon: AAA_Icons_Pack.profile,
                                  ),
                                  SizedBox(width: 29.w,),
                                  ServicesCard(
                                    label: 'Dashboard',
                                    Route: Profile(uid: uid,),
                                    children:  [
                                      TextSpan(
                                          text: 'summary for all activities, charts,  and  statistics in a single '
                                      ),
                                      TextSpan(
                                          text: 'dashboard',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                    ],
                                    icon: AAA_Icons_Pack.dashboard,
                                  ),
                                  SizedBox(width: 29.w,),
                                  ServicesCard(
                                    label: 'Chating',
                                    Route: Profile(uid: uid,),
                                    children:  [
                                      TextSpan(
                                          text: 'live '
                                      ),
                                      TextSpan(
                                          text: 'chat',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: '   for  fast  &  easy communication  with  your students/academic advisor'
                                      )
                                    ],
                                    icon: AAA_Icons_Pack.chat,
                                  ),
                                  SizedBox(width: 29.w,),
                                  ServicesCard(
                                    label: 'Students\' List',
                                    Route: StudentsList(),
                                    children:  [
                                      TextSpan(
                                          text: 'list',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: ' of all the students who  are under your supervising'
                                      )
                                    ],
                                    icon: AAA_Icons_Pack.student_list,
                                  ),
                                ],
                              ),
                              SizedBox(height: 29.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ServicesCard(
                                    label: 'Add/Delete',
                                    Route: Profile(uid: uid,),
                                    children:  [
                                      TextSpan(
                                          text: 'adding/deleting',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: '  courses before you make it on SIS'
                                      )
                                    ],
                                    icon: AAA_Icons_Pack.books,
                                  ),
                                  SizedBox(width: 29.w,),
                                  ServicesCard(
                                    label: 'Scores',
                                    Route: Profile(uid: uid,),
                                    children:  [
                                      TextSpan(
                                          text: 'Evaluate   and   customize  your student\'s '
                                      ),
                                      TextSpan(
                                          text: 'scores',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: ' and skills'
                                      )
                                    ],
                                    icon: AAA_Icons_Pack.graph,
                                  ),
                                  SizedBox(width: 29.w,),
                                  ServicesCard(
                                    label: 'Notes',
                                    Route: Profile(uid: uid,),
                                    children:  [
                                      TextSpan(
                                          text: 'write   '
                                      ),
                                      TextSpan(
                                          text: 'notes',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: '   about   your students  to  them,  save it for future,  or for your-self'
                                      )
                                    ],
                                    icon: AAA_Icons_Pack.note,
                                  ),
                                  SizedBox(width: 29.w,),
                                  ServicesCard(
                                    label: 'Report',
                                    Route: Profile(uid: uid,),
                                    children:  [
                                      TextSpan(
                                          text: 'generate    '
                                      ),
                                      TextSpan(
                                          text: 'reports',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: '    about one    of     your     students'
                                      )
                                    ],
                                    icon: AAA_Icons_Pack.report,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ]),
            );
      }
    );
  }
}
