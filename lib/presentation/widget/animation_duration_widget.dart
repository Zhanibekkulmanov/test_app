import 'package:flutter/material.dart';

class AnimationDurationWidget extends StatelessWidget {
  final String duration;
  final Function(double value) onChanged;
  final double value;
  const AnimationDurationWidget({Key? key, required this.duration, required this.onChanged, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Animation Duration'),
        Slider(
          value: value,
          onChanged: onChanged,
        ),
        Text('$duration ms'),
      ],
    );
  }
}
