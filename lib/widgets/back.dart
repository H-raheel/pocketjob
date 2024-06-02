import 'package:flutter/material.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';

class Back extends StatelessWidget {
  const Back({required BuildContext context, super.key});

  @override
  Widget build(context) {
    return Transform.scale(
      scale: 0.8,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey)),
        child: IconButton(
          onPressed: () async {
            bool canPop = await Navigator.of(context).maybePop();
            if (!canPop) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNav()));
            }
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}
