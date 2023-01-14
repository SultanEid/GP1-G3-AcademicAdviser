import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/Profile/ProfileWidget/CertificateCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Models/Certificate.dart';
import '../../../Models/Student.dart';

class CertificatesWidget extends StatelessWidget {
  CertificatesWidget({Key? key ,required this.user}) : super(key: key);
  AcademicAdvisor user;
  @override
  Widget build(BuildContext context) {

    return Container(
        width: 406.w,
        height: 438.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.w)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 350.w,
            height: 20.h,
            child: Text(
              'Certificates',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w300,
                  fontSize: 27.sp,
                  color: Color.fromARGB(255, 87, 87, 87)),
            ),
          ),
          Divider(
            endIndent: 28.w,
            indent: 28.w,
          ),
          Container(
            width: 350.w,
            height: 347.h,
            child: ListView.builder(
                itemCount: user.profile.additionalCertificates!.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: CertificateCardWidget(CertificatesInfoIndex : user.profile.additionalCertificates![index]),
                  );
                }),
          )
        ]));
  }
}