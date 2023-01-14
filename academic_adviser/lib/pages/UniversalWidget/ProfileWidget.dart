import 'package:flutter/material.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  final DatabaseVariable Profilelistindex;

  ProfileWidget({required this.Profilelistindex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 20,
        child: Center(
          child: Text(
            '${Profilelistindex.Name}',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal', color: Colors.white
            ),
          ),
          widthFactor: 50,
          heightFactor: 22,
        ));
  }
}
