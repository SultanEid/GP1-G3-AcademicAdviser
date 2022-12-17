import 'package:flutter/material.dart';
class TestProfile extends StatelessWidget {

TestProfile({required this.ID , required this.Name});
final String ID;
final String Name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$ID \n$Name"),
    );
  }
}
