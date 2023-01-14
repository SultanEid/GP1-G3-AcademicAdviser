import 'package:academic_adviser/Models/AcademicAdvisor.dart';
<<<<<<< Updated upstream
import 'package:academic_adviser/pages/AcademicAdvisorView/Profile/ProfileWidget/BrifeWidget.dart';
import 'package:academic_adviser/pages/AcademicAdvisorView/Profile/ProfileWidget/CertificatesWidget.dart';
=======
>>>>>>> Stashed changes
import 'package:academic_adviser/pages/UniversalWidget/PageBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<< Updated upstream
=======
import 'ProfileWidget/BrifeWidget.dart';
import 'ProfileWidget/CertificatesWidget.dart';
>>>>>>> Stashed changes
import 'ProfileWidget/ProfileWidget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key,  required this.user}) : super(key: key);
  AcademicAdvisor user;

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return ScaffoldPlus([
=======
    return ScaffoldPlus(
        [
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
    ]);
=======
    ],
      user: user,
    );
>>>>>>> Stashed changes
  }
}
