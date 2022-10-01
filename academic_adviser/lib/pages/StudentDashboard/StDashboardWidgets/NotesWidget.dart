import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:academic_adviser/StData/4000951Data.dart';

class NotesWidtget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 19),
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
            child: Text('Notes',
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
            height: 300,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                String note = std4000951Data.notes[index];
                if(note.length > 20){
                  note = note.substring(0,20);
                }
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 390,
                  height: 86,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 114, 72, 185),
                            Color.fromARGB(255, 96, 220, 220),
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
                            width: 240,
                            child: Text(note + '...Read More',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 27,
                              ),
                            ),
                          )
                    ]
                      ),
                      SizedBox(width: 50,),
                      Container(
                        child: Icon(
                          Icons.sticky_note_2_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              child: Icon(Icons.note_add),
                backgroundColor: Color.fromARGB(255, 114, 72, 185),
                onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}