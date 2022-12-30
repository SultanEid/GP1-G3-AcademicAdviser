import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrifeWidget extends StatelessWidget {
  BrifeWidget({Key? key , required this.brief}) : super(key: key);

  String? brief;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1119.w,
      height: 438.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.w)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 1063.w,
            height: 20.h,
            child: Text(
              'Brife',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w300,
                  fontSize: 27.sp,
                  color: Color.fromARGB(255, 87, 87, 87)
              ),
            ),
          ),
          Divider(
            endIndent: 28.w,
            indent: 28.w,
          ),
          Container(
            width: 1058.w,
            height: 356.h,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              // for Vertical scrolling
              scrollDirection: Axis.vertical,
              child: Text(
                brief!,
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w300,
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 112, 112, 112)
                ),
              ),
            ),
            ),
        ],
      ),
    );
  }
}
