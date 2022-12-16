import 'package:flutter/material.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart';

class ProfileWidget extends StatelessWidget {

  final DatabaseVariable Profilelistindex;
  ProfileWidget({required this.Profilelistindex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:20,
      child: Center( child: Text(Profilelistindex.Name , style: TextStyle(fontFamily: 'Tajawal', fontSize: 50 , fontWeight: FontWeight.bold),),
    widthFactor: 50,
        heightFactor: 22,
      )

    );

  }
}
