import 'package:academic_adviser/pages/ThemeConfigA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, required this.buttonLabel, required this.icon, required this.route, required this.themeConfig}) : super(key: key);
  final String buttonLabel;
  final IconData icon;
  final Widget? route;
  final ThemeConfig themeConfig;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 444.w,
      height: 34.h,
      child: TextButton(
        onPressed: () {
          if (route != null) {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => route!), (Route<dynamic> route) => false);
          }else {
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    buttonLabel,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                      fontSize: 23.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      icon,
                      size: 23.sp,
                      color: Colors.white,
                    ),
                  )
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 3.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: themeConfig.primaryGradientColor,
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            )
          ],
        ),
      ),
    );
  }
}
