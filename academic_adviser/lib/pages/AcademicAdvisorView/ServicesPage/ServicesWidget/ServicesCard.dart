<<<<<<< Updated upstream

import 'package:academic_adviser/pages/AcademicAdvisorView/ServicesPage/ServicesWidget/CardButton.dart';
=======
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

<<<<<<< Updated upstream
=======
import 'CardButton.dart';

>>>>>>> Stashed changes
class ServicesCard extends StatelessWidget {
  const ServicesCard({Key? key, required this.label, required this.icon, required this.children, required this.Route}) : super(key: key);
  final String label;
  final List<TextSpan> children;
  final IconData icon;
  final Widget Route;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      height: 276.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 52.05.sp,
            color: Color.fromARGB(255, 0, 80, 192),
          ),
          SizedBox(
            height: 18.5,
          ),
          GradientText(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
              fontFamily: 'Tajawal',
            ),
            gradientType: GradientType.linear,
            gradientDirection: GradientDirection.ltr,
            colors: [
              Color.fromARGB(255, 96, 220, 220),
              Color.fromARGB(255, 114, 72, 185),
            ],
          ),
          SizedBox(
            height: 18.5.h,
          ),
          SizedBox(
            width: 173.w,
            height: 68.h,
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 112, 112, 112),
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.normal
                  ),
                  children: children
              ),
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          CardButton(label: label, Route: Route,),
        ],
      ),
    );
  }
}
