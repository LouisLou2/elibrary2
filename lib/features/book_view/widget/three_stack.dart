import 'package:flutter/material.dart';

class ThreeStack extends StatelessWidget {

  final String title;
  final Widget valueWidget;
  final String thirdTitle;
  final Color? color;

  const ThreeStack({super.key,required this.title,required this.valueWidget,required this.thirdTitle,this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            letterSpacing: -0.8,
            color: color??Theme.of(context).colorScheme.primary,
          ),
        ),
        valueWidget,
        Text(
          thirdTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            letterSpacing: -0.8,
            fontSize: 13,
            color: color??Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

}