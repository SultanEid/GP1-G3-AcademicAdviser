import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScoresSummaryTopCard extends StatelessWidget {
  ScoresSummaryTopCard({required this.title, required this.percent, required this.color});
  final String title;
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w,right: 15.w),
      height: 150.h,
      width: 150.w,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            endAngle: 360,
              startAngle: 0,
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              axisLineStyle: AxisLineStyle(
                  thickness: 3.sp,
                  cornerStyle: CornerStyle.bothCurve,
                color: Color.fromARGB(255, 112, 112, 122)
              ),
              pointers: [
                RangePointer(
                    value: percent,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 7.sp,
                    color: color,
                )
              ],
              annotations: [
                GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    widget: Text(percent.toStringAsFixed(0).toString(),
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 66.sp,
                      ),
                    ),),
                GaugeAnnotation(
                  positionFactor: 1.3,
                  angle: 90,
                  widget: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                    ),
                  ),),
              ]
          ),
        ],
      ),
    );
  }
}
