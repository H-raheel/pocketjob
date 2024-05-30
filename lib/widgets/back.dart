import 'package:flutter/material.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey)),
        child: IconButton(
          onPressed: () async {
            bool condition = await Navigator.of(context).maybePop();
            if (condition == true) {
              Navigator.of(context, rootNavigator: true).pop(context);
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNav()));
            }
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24,
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}
