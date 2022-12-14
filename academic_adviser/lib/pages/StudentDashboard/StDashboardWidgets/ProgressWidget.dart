import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      height: 485,
      width: 1431,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                ),
                height: 480,
                width: 1431,
                child:ProgressLineChart(),
              ),
              Container(
                margin: EdgeInsets.only(right: 10,top: 10),
                alignment: Alignment.centerRight,
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black87
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text('Courses Progress',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('GS Courses',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        SizedBox(width: 50,),
                        Icon(
                          Icons.auto_graph,
                          color: Color.fromARGB(255, 96, 220, 220),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CS Courses',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        SizedBox(width: 50,),
                        Icon(
                          Icons.auto_graph,
                          color: Color.fromARGB(255, 114, 72, 185),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('IT  Courses',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        SizedBox(width: 50,),
                        Icon(
                          Icons.auto_graph,
                          color: Color.fromARGB(100, 96, 220, 220),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

class ProgressLineChart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 8,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            margin: 10,
            getTitles: (value){
              switch(value.toInt()){
                case 2:
                  return 'Level 1';
                case 4:
                  return 'Level 3';
                case 6:
                  return 'Level 5';
                case 8:
                  return 'Level 8';
              }
              return '';
            }
          ),
          leftTitles: SideTitles(
            showTitles: false
          )
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.transparent,width: 1)
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 4),
              FlSpot(3, 6),
              FlSpot(5, 1),
              FlSpot(8, 4),
              FlSpot(10, 3)
            ],
            dotData: FlDotData(
              show: false
            ),
            isCurved: true,
              colors: [
                Color.fromARGB(255, 96, 220, 220),
              ],
              barWidth: 5,
            belowBarData: BarAreaData(
              show: true,
              colors: [
                Color.fromARGB(100, 96, 220, 220),
                Color.fromARGB(100, 114, 72, 185),
              ]
            )
          ),
          LineChartBarData(
              spots: [
                FlSpot(0, 6),
                FlSpot(2, 3),
                FlSpot(4, 5),
                FlSpot(7, 2),
                FlSpot(10, 5)
              ],
              dotData: FlDotData(
                  show: false
              ),
            isCurved: true,
            colors: [
              Color.fromARGB(255, 114, 72, 185),
            ],
            barWidth: 5,
              belowBarData: BarAreaData(
                  show: true,
                  colors: [
                    Color.fromARGB(100, 114, 72, 185),
                    Color.fromARGB(100, 96, 220, 220),
                  ]
              )
          ),
          LineChartBarData(
              spots: [
                FlSpot(0, 6),
                FlSpot(3, 7),
                FlSpot(6, 4),
                FlSpot(10, 6)
              ],
              dotData: FlDotData(
                  show: false,
              ),
              isCurved: true,
              colors: [
                Color.fromARGB(255, 96, 220, 220),
              ],
              barWidth: 5,
              belowBarData: BarAreaData(
                  show: true,
                  colors: [
                    Color.fromARGB(100, 114, 72, 185),
                    Color.fromARGB(100, 96, 220, 220),
                  ]
              )
          ),
        ]
      )
    );
  }
}

