import 'package:academic_adviser/Database/Database.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/ServicesPage/ServicesWidget/ServicesCard.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/UniversalWidget/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../UniversalWidget/ProfileWidget.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<DatabaseVariable>?>.value(
        value : DatabaseService().ProfileSnapshot,
    initialData: null,
    child: Scaffold(
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
              PopupMenuButton(
                icon: Icon(
                  AAA_Icons_Pack.profile,
                  color: Colors.white,
                  size: 45.sp,
                ),
                offset: Offset(0,50),
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
                onSelected: (value) async{
                  if(value == 0){

                  }else if(value == 1){
                    await AuthService().SignOut();
                  }
                },
              ),
              Container(
                alignment: Alignment.center,
                width: 228.w,
                height: 50.h,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Profile').snapshots(),
                    builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot){
                      switch (snapshot.connectionState){
                        case ConnectionState.waiting : return Text("Waiting for data");
                        default : return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot Doc) {
                            return Expanded(
                                child: ListTile(
                              title: Text(
                                Doc['Name'],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal', color: Colors.white
                                ),
                              ),
                            ));
                          }).toList(),
                        );
                      }
                    }
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
                'Our Services Features',
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
    ),
    );
  }
}