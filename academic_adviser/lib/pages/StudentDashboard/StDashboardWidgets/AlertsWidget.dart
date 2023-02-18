import 'package:academic_adviser/StData/4000951Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StdAlertsCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 420,
      height: 485,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Text('ALERTS',
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: Color.fromARGB(255, 114, 72, 185),
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  letterSpacing: 20
              ),
            ),
          ),
          Container(
            width: 375,
            height: 2,
            color: Colors.black45,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 390,
            height: 385,
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index){
                String alertName = std4000951Data.alertName[index];
                String CourseNDate = std4000951Data.CoursesNDateAlerts[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 390,
                  height: 86,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(150, 255, 0, 0),
                        Color.fromARGB(20, 255, 0, 0),
                        Color.fromARGB(0, 255, 0, 0),
                      ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 319,
                            child: Text(alertName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            width: 319,
                            child: Text(CourseNDate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Icon(
                          Icons.nearby_error,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
