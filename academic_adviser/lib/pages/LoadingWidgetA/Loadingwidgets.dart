import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingWidgets extends StatelessWidget {
  const LoadingWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitSquareCircle(
          color: Colors.deepPurple,
          size: 100,
        ),
      ),
    );
  }
}
