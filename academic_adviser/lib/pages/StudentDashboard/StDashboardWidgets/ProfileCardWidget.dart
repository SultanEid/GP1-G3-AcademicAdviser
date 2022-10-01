import 'package:academic_adviser/StData/4000951Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StdProfileCard extends StatelessWidget{

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
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 114, 72, 185),
              radius: 105,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/ProfileImages/4000951Avater.jpg'),
                backgroundColor: Colors.white10,
                radius: 100,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
              child: Text(std4000951Data.firstName.toUpperCase() + ' ' + std4000951Data.lastName.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),
          ),
          Text(std4000951Data.GPA.toString() + ' | '+ std4000951Data.Major,
            style: TextStyle(
                fontFamily: 'Tajawal',
                color: Color.fromARGB(255, 114, 72, 185),
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  info('Total', std4000951Data.total.toString()),
                  info('Registered', std4000951Data.Registered.toString()),
                ],
              ),
              SizedBox(width: 20,),
              Column(
                children: [
                  info('ID', std4000951Data.studentID),
                  info('Status', std4000951Data.status),
                ]
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black54, width: 2)
                ),
                child: Icon(
                  Icons.phone,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 18,),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black54, width: 2)
                ),
                child: Icon(
                  Icons.email,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 18,),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black54, width: 2)
                ),
                child: Icon(
                  Icons.alternate_email,
                  size: 20,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Text('Read More',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color.fromARGB(255, 114, 72, 185),
                fontWeight: FontWeight.normal,
                fontSize: 11
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 300,
            height: 1,
            color: Colors.black,
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_left,color: Colors.black54,size: 40,),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black54, width: 2)
                ),
              ),
              Icon(Icons.arrow_right,color: Colors.black54,size: 40,)
            ],
          ),
          Text('Next Student',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 13
            ),
          ),
        ],
      ),
    );
  }
}

class info extends StatelessWidget {
  String text;
  String value;
  info(String this.text,String this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Text(text + ' : '+ value,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: 'Tajawal',
            color: Color.fromARGB(255, 112, 112, 112),
            fontWeight: FontWeight.normal,
            fontSize: 20
        ),
      ),
    );
  }
}
