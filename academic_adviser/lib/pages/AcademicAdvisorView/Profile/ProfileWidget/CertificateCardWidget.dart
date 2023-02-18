import 'package:academic_adviser/Models/Certificate.dart';
import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificateCardWidget extends StatelessWidget {
  const CertificateCardWidget( {Key? key , required this.CertificatesInfoIndex}) : super(key: key);
  final Certificate CertificatesInfoIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.h,
      width: 350.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(
              color: Color.fromARGB(255, 112, 112, 112),
              width: 1
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 70.w,
            height: 82.h,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 75, 75, 75),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(7.w),bottomLeft: Radius.circular(7.w))
            ),
            child: Icon(
              AAA_Icons_Pack.report,
              color: Colors.white,
              size: 37.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CertificatesInfoIndex.certificateTitle!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                Text(
                  CertificatesInfoIndex.certificaIssuer!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 10.sp,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      CertificatesInfoIndex.date!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 11.sp,
                        color: Color.fromARGB(255, 87, 87, 87),
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
