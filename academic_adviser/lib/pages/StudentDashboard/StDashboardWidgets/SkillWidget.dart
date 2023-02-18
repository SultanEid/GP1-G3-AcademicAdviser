import 'package:academic_adviser/StData/4000951Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SkillWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 983,
      height: 173,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                        thickness: 15,
                        cornerStyle: CornerStyle.bothCurve
                    ),
                    pointers: [
                      RangePointer(
                          value: std4000951Data.skillScore[0].toDouble(),
                          cornerStyle: CornerStyle.bothCurve,
                          width: 15,
                          gradient: SweepGradient(
                              colors: [
                                Color.fromARGB(255, 96, 220, 220),
                                Color.fromARGB(255, 114, 72, 185),
                              ]
                          )
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 90,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(std4000951Data.skillScore[0].toString(),
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Color.fromARGB(255, 114, 72, 185),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 50
                                ),
                              ),
                              Text(std4000951Data.skillName[0],
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          )
                      )
                    ]
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                        thickness: 15,
                        cornerStyle: CornerStyle.bothCurve
                    ),
                    pointers: [
                      RangePointer(
                          value: std4000951Data.skillScore[0].toDouble(),
                          cornerStyle: CornerStyle.bothCurve,
                          width: 15,
                          gradient: SweepGradient(
                              colors: [
                                Color.fromARGB(255, 96, 220, 220),
                                Color.fromARGB(255, 114, 72, 185),
                              ]
                          )
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 90,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(std4000951Data.skillScore[1].toString(),
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Color.fromARGB(255, 114, 72, 185),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 50
                                ),
                              ),
                              Text(std4000951Data.skillName[1],
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          )
                      )
                    ]
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                        thickness: 15,
                        cornerStyle: CornerStyle.bothCurve
                    ),
                    pointers: [
                      RangePointer(
                          value: std4000951Data.skillScore[0].toDouble(),
                          cornerStyle: CornerStyle.bothCurve,
                          width: 15,
                          gradient: SweepGradient(
                              colors: [
                                Color.fromARGB(255, 96, 220, 220),
                                Color.fromARGB(255, 114, 72, 185),
                              ]
                          )
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 90,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(std4000951Data.skillScore[2].toString(),
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Color.fromARGB(255, 114, 72, 185),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 50
                                ),
                              ),
                              Text(std4000951Data.skillName[2],
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          )
                      )
                    ]
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                        thickness: 15,
                        cornerStyle: CornerStyle.bothCurve
                    ),
                    pointers: [
                      RangePointer(
                          value: std4000951Data.skillScore[3].toDouble(),
                          cornerStyle: CornerStyle.bothCurve,
                          width: 15,
                          gradient: SweepGradient(
                              colors: [
                                Color.fromARGB(255, 96, 220, 220),
                                Color.fromARGB(255, 114, 72, 185),
                              ]
                          )
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 90,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(std4000951Data.skillScore[3].toString(),
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Color.fromARGB(255, 114, 72, 185),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 50
                                ),
                              ),
                              Text(std4000951Data.skillName[3],
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          )
                      )
                    ]
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}