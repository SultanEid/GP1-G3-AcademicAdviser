import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Profile/ProfileWidget/BrifeWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Profile/ProfileWidget/CertificatesWidget.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ProfileWidget/ProfileWidget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key,  required this.user}) : super(key: key);
  AcademicAdvisor user;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus([
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          ProfileWidget(
            user: user,
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CertificatesWidget(user: user),
              SizedBox(
                width: 15.w,
              ),
              BrifeWidget(brief: user.profile.brief),
            ],
          ),
        ],
      ),
    ]);
  }
}
