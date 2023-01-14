import 'package:academic_adviser/pages/UniversalWidget/AAA_Icons_Pack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:flutter/material.dart';


class ProfileWidget extends StatelessWidget {

  const ProfileWidget({Key? key, required this.user}) : super(key: key);
  final Student user;

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
          user.profile.profileAvatar == null? Container(
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
          ) : Container(
            width: 406.w,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 75, 75, 75),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.w),
                    bottomLeft: Radius.circular(30.w)
                ),
              image: DecorationImage(
                image: AssetImage(user.profile.profileAvatar.toString()),
                fit: BoxFit.fill
              )
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
                SizedBox(height: 15.h,),
                Container(
                    alignment: Alignment.topCenter,
                    width: 716.w,
                    height: 89.29.h,
                    child: SizedBox(
                      width: 628.w,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    'Total Hours: ${user.totalHours}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 20.sp,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    'Registered Hours: ${user.registeredHours}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 20.sp,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    'Plan Hours: ${user.planHours}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 20.sp,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                    ),
                                  ),
                                ),
                              ),
                            ],),
                          ),
                          Expanded(
                            child: Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    'Remain Hours: ${user.planHours - user.totalHours}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 20.sp,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    'Student State: ${user.totalHours > 123 ? 'expected to graduate':'Continue studying'}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 20.sp,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                    ),
                                  ),
                                ),
                              ),
                            ],),
                          ),
                        ],
                      )
                    )
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
                    height: 89.29.h,
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
                              ),
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
                ),
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
                Text(
                  'Student ID',
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
                      Icons.perm_identity,
                      color: Color.fromARGB(255, 87, 87, 87),
                      size: 18.sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        user.academicID,
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
                  'Communication',
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
                      AAA_Icons_Pack.email,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Color.fromARGB(255, 87, 87, 87),
                      size: 20.sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        user.phone,
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
                  'Academic Info',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                Text(
                  'GPA ${user.gpa}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                Text(
                  'Level 12',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
