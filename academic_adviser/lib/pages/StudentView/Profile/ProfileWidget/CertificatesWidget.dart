import 'package:academic_adviser/Models/Student.dart';
import 'package:academic_adviser/pages/StudentView/Profile/ProfileWidget/CertificateCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificatesWidget extends StatelessWidget {
  CertificatesWidget({Key? key, required this.user}) : super(key: key);
  Student user;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 406.w,
        height: 438.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.w)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 28.w),
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
              ),
              Container(
                width: 25.w,
                height: 25.h,
                margin: EdgeInsets.only(right: 28.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(
                    color: Color.fromARGB(255, 150, 150, 150),
                  )
                ),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
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
            width: 350.w,
            height: 347.h,
            child: user.profile.additionalCertificates == null
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'There are no Certificates!',
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w300,
                          fontSize: 20.sp,
                          color: Color.fromARGB(155, 112, 112, 112)),
                    ),
                  )
                : ListView.builder(
                    itemCount: user.profile.additionalCertificates!.length,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title: CertificateCardWidget(
                            CertificatesInfoIndex:
                                user.profile.additionalCertificates![index]),
                      );
                    }),
          )
        ]));
  }
}
