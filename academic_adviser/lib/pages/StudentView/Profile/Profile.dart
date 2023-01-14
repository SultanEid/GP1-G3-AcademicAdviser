import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/StudentView/Profile/ProfileWidget/BrifeWidget.dart';
import 'package:academic_adviser/pages/StudentView/Profile/ProfileWidget/CertificatesWidget.dart';
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ProfileWidget/ProfileWidget.dart';
class StudentProfile extends StatefulWidget {
  StudentProfile({Key? key, required this.user})  : super(key: key);
  Student user;
  @override
  State<StudentProfile> createState() => _StudentProfileState(user: user,);
}

class _StudentProfileState extends State<StudentProfile> {
  _StudentProfileState({required this.user});
  Student user;
  PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.85,
  );
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus([
      Container(
        child: Column(
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
      ),
    ]);
  }
}
