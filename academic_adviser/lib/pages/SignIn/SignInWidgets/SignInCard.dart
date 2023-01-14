import 'package:academic_adviser/pages/SignIn/SignInWidgets/SignInInputSection.dart';
import 'package:academic_adviser/pages/SignIn/SignInWidgets/SignInLogoSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInCard extends StatelessWidget {
  const SignInCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1176.w,
      height: 590.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 5.w),
        borderRadius: BorderRadius.circular(52.w),
        color: Color.fromARGB(255, 230, 230, 230),
      ),
      child: Row(
        children: [
          SignInInputSection(),
          SignInLogoSection(),
        ],
      ),
    );
  }
}
