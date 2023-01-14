<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardButton extends StatelessWidget {
<<<<<<< Updated upstream
   CardButton({Key? key, required this.label , this.Route}) : super(key: key);
  final String label;
   Widget? Route;
=======
  const CardButton({Key? key, required this.label , required this.Route}) : super(key: key);
  final String label;
  final Widget Route;
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243.w,
      height: 25.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 96, 220, 220),
                Color.fromARGB(255, 114, 72, 185)
              ])),
      child: SizedBox(
        width: 243.w,
        height: 25.h,
        child: TextButton(
            onPressed: () {
<<<<<<< Updated upstream
              Route == null? print('null route'):Navigator.push(context ,MaterialPageRoute(builder: (context) => Route!));
=======
              Navigator.push(context ,MaterialPageRoute(builder: (context) => Route));
>>>>>>> Stashed changes
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Stack(
              children: [
                Container(
                  width: 360.w,
                  height: 42.h,
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Tajawal'),
                  ),
                ),
                Container(
                  width: 360.w,
                  height: 42.h,
                  alignment: Alignment.centerRight,
                  child: Icon(
                    AAA_Icons_Pack.next,
                    color: Colors.white,
                    size: 15.sp,
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
