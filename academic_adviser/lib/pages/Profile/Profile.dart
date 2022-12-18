import 'package:academic_adviser/Models/User.dart';
import 'package:academic_adviser/pages/Profile/ProfileWidget/BrifeWidget.dart';
import 'package:academic_adviser/pages/Profile/ProfileWidget/CertificatesWidget.dart';
import 'package:academic_adviser/pages/Services/Authentication.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:academic_adviser/pages/UniversalWidget/Backgraound.dart';
import 'package:academic_adviser/pages/UniversalWidget/Menu.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Database/Database.dart';
import '../../Models/DatabaseVariable.dart';
import 'ProfileWidget/ProfileWidget.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<DatabaseVariable>?>.value(
      value : DatabaseService().ProfileSnapshot,
      initialData: null,
      child: ScaffoldPlus(
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h,),
              ProfileWidget(user: TheUser(),),
              SizedBox(height: 15.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CertificatesWidget(),
                  SizedBox(width: 15.w,),
                  BrifeWidget(),
                ],
              )
            ],
          ),
        ]
      )
    );
  }
}
