import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, required this.buttonLabel, required this.icon}) : super(key: key);
  final String buttonLabel;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 444.w,
      height: 34.h,
      child: TextButton(
        onPressed: () {},
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
                    colors: [
                      Color.fromARGB(255, 96, 220, 220),
                      Color.fromARGB(255, 114, 72, 185)
                    ],
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
