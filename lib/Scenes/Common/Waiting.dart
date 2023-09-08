import 'package:flutter/material.dart';

class Waiting extends StatelessWidget {
  final Widget child;
  final bool isWaiting;

  const Waiting({required this.child, required this.isWaiting});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(child: child),
        Visibility(
          visible: isWaiting,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black26,
            child: Center(
              child: CircularProgressIndicator(color: Colors.lightGreen,),
            ),
          ),
        )
      ],
    );
  }
}
