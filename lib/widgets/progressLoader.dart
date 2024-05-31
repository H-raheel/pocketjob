import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaitingForProgressLoader extends StatelessWidget {
  const WaitingForProgressLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWanderingCubes(
        color: Theme.of(context).colorScheme.primary,
        size: 50.0,
      ),
    );
  }
}
