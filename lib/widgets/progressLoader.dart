import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketjob/utils/colors.dart';

class waitingForProgressLoader extends StatelessWidget {
  const waitingForProgressLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitWanderingCubes(
      color: mainColor,
      size: 50.0,
    ));
  }
}
