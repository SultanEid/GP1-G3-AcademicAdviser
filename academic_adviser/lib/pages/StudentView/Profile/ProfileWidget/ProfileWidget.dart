import 'package:academic_adviser/pages/UniversalWidgetAA/AAA_Icons_Pack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:academic_adviser/Models/Student.dart';
import 'package:flutter/material.dart';
class ProfileWidget extends StatefulWidget{
  const ProfileWidget({Key? key, required this.user}) : super(key: key);
  final Student user;

  @override
  State<ProfileWidget> createState() => _ProfileWidget(user: user,);
}
class _ProfileWidget extends State<ProfileWidget> {
  _ProfileWidget({Key? key, required this.user});
  final Student user;

  int _current = 0;
  CarouselController _controller = CarouselController(

  );

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
          (user.profile.profileAvatar == null)
              ? Container(
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
                )
              : Container(
                  width: 406.w,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 75, 75, 75),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.w),
                          bottomLeft: Radius.circular(30.w)),
                      image: DecorationImage(
                          image:
                              AssetImage(user.profile.profileAvatar.toString()),
                          fit: BoxFit.fill)),
                ),
          Container(
            margin: EdgeInsets.only(left: 44.w, top: 30.h),
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
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: 716.w,
                  height: 1,
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
                SizedBox(
                  height: 15.h,
                ),

                Container(
                  width: 716.w,
                  height: 150.h,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 716.w,
                        height: 130.h,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: _current,
                              viewportFraction: 1,
                              autoPlay: true,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              autoPlayInterval: Duration(seconds: 5),
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          carouselController: _controller,
                          items: [
                            Container(
                                alignment: Alignment.topCenter,
                                width: 716.w,
                                child: DataTable(columns: [
                                  DataColumn(
                                    label: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.normal),
                                          children: [
                                            TextSpan(
                                                text: 'Total Hours\n',
                                                style:
                                                TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(
                                              text: '${user.totalHours}',
                                            )
                                          ]),
                                    ),
                                  ),
                                  DataColumn(
                                    label: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.normal),
                                          children: [
                                            TextSpan(
                                                text: 'Plan Hours\n',
                                                style:
                                                TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(
                                              text: '${user.planHours}',
                                            )
                                          ]),
                                    ),
                                  ),
                                  DataColumn(
                                      label: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.normal),
                                            children: [
                                              TextSpan(
                                                  text: 'Student Status\n',
                                                  style:
                                                  TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                '${user.totalHours > (user.planHours - 23) ? 'Expected to graduate' : 'studying'}',
                                              )
                                            ]),
                                      )),
                                ], rows: [
                                  DataRow(cells: [
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.normal),
                                            children: [
                                              TextSpan(
                                                  text: 'Register Hours\n',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text: '${user.registeredHours}',
                                              )
                                            ]),
                                      ),
                                    ),
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.normal),
                                            children: [
                                              TextSpan(
                                                  text: 'Remain Hours\n',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                '${user.registeredHours - user.totalHours}',
                                              )
                                            ]),
                                      ),
                                    ),
                                    DataCell(Container()),
                                  ]),
                                ])),
                            Container(
                                alignment: Alignment.topCenter,
                                width: 716.w,
                                child: DataTable(columns: [
                                  DataColumn(
                                    label: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.normal),
                                          children: [
                                            TextSpan(
                                                text: 'Withdrawals no.\n',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                            TextSpan(
                                              text: '${user.withdrawalsNumber}',
                                            )
                                          ]),
                                    ),
                                  ),
                                  DataColumn(
                                    label: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.normal),
                                          children: [
                                            TextSpan(
                                                text: 'Visits no.\n',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                            TextSpan(
                                              text:
                                              '${user.visitsNumber}',
                                            )
                                          ]),
                                    ),
                                  ),
                                  DataColumn(
                                      label: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.normal),
                                            children: [
                                              TextSpan(
                                                  text: 'Delays no.\n',
                                                  style:
                                                  TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text: '${user.delaysNumber}',
                                              )
                                            ]),
                                      )),
                                ], rows: [
                                  DataRow(cells: [
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.normal),
                                            children: [
                                              TextSpan(
                                                  text: 'Apologies no.\n',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text: '${user.apologiesNumber}',
                                              )
                                            ]),
                                      ),
                                    ),
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.normal),
                                            children: [
                                              TextSpan(
                                                  text: 'Re-enrolments no.\n',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                '${user.reenrolmentsNumber}',
                                              )
                                            ]),
                                      ),
                                    ),
                                    DataCell(RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.normal),
                                          children: [
                                            TextSpan(
                                                text: 'Warnings no.\n',
                                                style:
                                                TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(
                                              text: '${user.warningsNumber}',
                                            )
                                          ]),
                                    )),
                                  ]),
                                ])),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) => index).asMap().entries.map((e){
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            width: 60.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: _current == e.key? Color.fromARGB(255, 200, 200, 200).withOpacity(1): Color.fromARGB(255, 200, 200, 200).withOpacity(0.5),
                            ),
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                _current = e.key;
                                _controller.animateToPage(e.key);
                              });
                                },
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ),


                Container(
                  width: 716.w,
                  height: 1,
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    alignment: Alignment.topCenter,
                    width: 716.w,
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
                            childAspectRatio: 351.58.w / 28.h),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 44.w,
          ),
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
                SizedBox(
                  height: 30.h,
                ),
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
                SizedBox(
                  height: 30.h,
                ),
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
