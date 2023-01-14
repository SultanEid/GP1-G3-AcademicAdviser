import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInLogoSection extends StatelessWidget {
  const SignInLogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 588.w,
        height: 590.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/BackgroundImage/SignInCard.png",
                ),
                fit: BoxFit.fitHeight),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(49.w),
                bottomRight: Radius.circular(49.w))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 383.63.w,
              height: 106.93.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/Logos/LogoWithoutStrapline.png",
                    ),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              height: 15.5.h,
            ),
            Text(
              'Academic Advisor Assistant',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: "Unispace",
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 212, 232, 242)),
            ),
            SizedBox(
              height: 32.5.h,
            ),
            Container(
              width: 438.w,
              height: 78.h,
              child: Text(
                'Our   goal    is    to    assist   academic    advisor    in    all    his    job’s    aspects    by    representing    everything    they    need    in    a    Fine-Grained    visual    representation.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 212, 232, 242)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
