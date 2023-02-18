import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
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

          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 1063.w,
                  height: 20.h,
                  margin: EdgeInsets.only(left: 28.w),
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
              ),
              Container(
                width: 25.w,
                height: 25.h,
                margin: EdgeInsets.only(right: 28.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.sp),
                ),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    AAA_Icons_Pack.edit,
                    color: Color.fromARGB(255, 150, 150, 150),
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            endIndent: 28.w,
            indent: 28.w,
          ),
          Container(
            width: 1058.w,
            height: 356.h,
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              // for Vertical scrolling
              scrollDirection: Axis.vertical,
              child: brief == null? Text(
                'There is no brief added!',
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w300,
                    fontSize: 20.sp,
                    color: Color.fromARGB(155, 112, 112, 112)
                ),
              ):Text(
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
