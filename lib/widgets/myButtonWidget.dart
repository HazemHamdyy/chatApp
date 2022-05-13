import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final String? title;
  final VoidCallback? onpressed;

  MyButton(
      {@required this.color, @required this.onpressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        elevation: 5,
        color: color!,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          minWidth: 200,
          height: 42,
          onPressed: onpressed,
          child: Text(title!),
        ),
      ),
    );
  }
}
