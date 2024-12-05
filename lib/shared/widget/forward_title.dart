import 'package:flutter/material.dart';

class ForwardTitle extends StatelessWidget {
  final String title;
  final double? size;
  final VoidCallback? onTap;
  final Color? color;

  const ForwardTitle({
    super.key,
    required this.title,
    this.onTap,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
      ],
    );
  }
}