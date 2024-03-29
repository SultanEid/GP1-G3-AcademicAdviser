import 'package:academic_adviser/Models/AcademicAdvisor.dart';
import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, required this.user}) : super(key: key);
  final AcademicAdvisor user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1542.w,
      height: 406.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 406.w,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 75, 75, 75),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.w),
                    bottomLeft: Radius.circular(30.w))),
            child: Icon(
              AAA_Icons_Pack.profile,
              color: Colors.white,
              size: 178.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 44.w,top: 54.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 74, 73, 73),
                  ),
                ),
                Text(
                  user.profile.role,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 74, 73, 73),
                  ),
                ),
                Text(
                  user.profile.department,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 74, 73, 73),
                  ),
                ),
                SizedBox(height: 15.h,),
                Container(
                  width: 716.w,
                  height: 1.5,
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
                SizedBox(height: 20.h,),
                Container(
                    alignment: Alignment.topCenter,
                    width: 716.w,
                    height: 215.h,
                    child: SizedBox(
                      width: 628.w,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: user.profile.educationalCertificates.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                AAA_Icons_Pack.report,
                                color: Color.fromARGB(255, 75, 75, 75),
                                size: 20.sp,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  user.profile.educationalCertificates[index],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 20.sp,
                                    color: Color.fromARGB(255, 112, 112, 112),
                                  ),
                                ),
                                alignment: Alignment.center,
                              )
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 13.h,
                            childAspectRatio: 351.58.w / 28.h
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
          SizedBox(width: 44.w,),
          VerticalDivider(
            endIndent: 39.h,
            indent: 39.h,
            color: Color.fromARGB(255, 112, 112, 112),
          ),
          Container(
            width: 298.w,
            height: 328.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      AAA_Icons_Pack.email_2,
                      color: Color.fromARGB(255, 87, 87, 87),
                      size: 18.sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        user.academicEmail,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 87, 87, 87),
                        ),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                ),
                SizedBox(height: 30.h,),
                Text(
                  'Office Location',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      AAA_Icons_Pack.home,
                      color: Color.fromARGB(255, 87, 87, 87),
                      size: 18.sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        '${user.office!.building}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 87, 87, 87),
                        ),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      AAA_Icons_Pack.elevator,
                      color: Color.fromARGB(255, 87, 87, 87),
                      size: 18.sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        '${user.office!.floor}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 87, 87, 87),
                        ),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      AAA_Icons_Pack.office,
                      color: Color.fromARGB(255, 87, 87, 87),
                      size: 18.sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        '${user.office!.officeNumber}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 87, 87, 87),
                        ),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                ),
                SizedBox(height: 30.h,),
                Text(
                  'Office Houres',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                Column(
                  children: user.officeHoures!.asMap().entries.map((e) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5.h),
                          child: Icon(
                            Icons.access_time_rounded,
                            color: Color.fromARGB(255, 87, 87, 87),
                            size: 18.sp,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.w),
                          child: Text(
                            '${user.officeHoures![e.key].officeHoursFrom} - ${user.officeHoures![e.key].officeHoursTo}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 87, 87, 87),
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        Expanded(
                          child: Text(
                            '${user.officeHoures![e.key].day}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 87, 87, 87),
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
