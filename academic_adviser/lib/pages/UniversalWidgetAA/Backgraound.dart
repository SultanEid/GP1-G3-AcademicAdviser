import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({Key? key, required this.themeConfig}) : super(key: key);
  final ThemeConfig themeConfig;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 25.h),
        width: 1920.w,
        height: 1080.h,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: themeConfig.backgroundColor,
            image: DecorationImage(
                opacity: themeConfig.opacity,
                image: AssetImage("assets/images/BackgroundImage/BackgroundImage.png",),
                fit: BoxFit.cover)),
        child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 25.sp,
                letterSpacing: 0.35.sp,
                fontFamily: 'Tajawal',
                color: themeConfig.backgroundTextColor,
                fontWeight: FontWeight.w400),
            child: Text("© ${DateTime.now().year} academic advisor assistant. All rights reserved • Terms of Use Privacy Policy", textAlign: TextAlign.center,)));
  }
}