import 'package:flutter/material.dart';

class ForwardTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final VoidCallback onTap;
  final Color? color;

  const ForwardTitle({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title,
          style: style,
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
      ],
    );
  }
}