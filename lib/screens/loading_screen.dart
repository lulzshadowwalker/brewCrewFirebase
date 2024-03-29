import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: const Center(
            child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
