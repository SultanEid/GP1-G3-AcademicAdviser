import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {Key? key,
      required this.color,
      required this.reciver,
      required this.noteContent})
      : super(key: key);
  final Color? color;
  final String? reciver;
  final String? noteContent;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        width: 479.w,
        height: 153.h,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(6.sp)),
        child: RawMaterialButton(
          fillColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverElevation:0,
          highlightElevation: 0,
            elevation: 0,
          onPressed: () {
            openDialog(context);
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        reciver!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                  child: Container(
                    width: 459.w,
                    height: 90.h,
                    child: Text(
                      noteContent!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }

  Future openDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: color,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    reciver!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            content: Container(
                width: 479.w,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        noteContent!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'done',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        });
  }
}
