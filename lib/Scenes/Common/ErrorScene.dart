import 'package:flutter/material.dart';

class ErrorScene extends StatelessWidget {
  final String text;
  const ErrorScene({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
            child: Text(text, style: TextStyle(color: Colors.white, fontSize: 28)));
  }
}
