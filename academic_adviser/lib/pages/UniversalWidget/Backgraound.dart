import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 25.h),
        width: 1920.w,
        height: 1080.h,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 227, 225, 225),
            image: DecorationImage(
                opacity: 1,
                image: AssetImage(
                  "assets/images/BackgroundImage/BackgroundImage.png",
                ),
                fit: BoxFit.cover)),
        child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 25.sp,
                letterSpacing: 0.35.sp,
                fontFamily: 'Tajawal',
                color: Colors.white,
                fontWeight: FontWeight.w400),
            child: Text(
              "© 2022 academic advisor assistant. All rights reserved • Terms of Use Privacy Policy",
              textAlign: TextAlign.center,
            )));
  }
}
