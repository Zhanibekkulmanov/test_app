import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final String title;
  const ButtonWidget({Key? key, required this.onTap, required this.color, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(title),
        ),
      ),
    );
  }
}
