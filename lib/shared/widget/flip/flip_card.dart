import 'package:flutter/material.dart';
import 'dart:math';

import 'flip_card_controllers.dart';
import 'flip_side.dart';

/// [FlipCard] A component that provides a flip card animation

class FlipCard extends StatefulWidget {
  /// [controller] used to ccontrol the flip
  final FlipCardController controller;

  /// [axis] The flip axis [Horizontal] and [Vertical]
  final FlipAxis axis;

  /// [rotateSide] The card rotate side
  final RotateSide rotateSide;

  /// [animationDuration] The amount of milliseconds a turn animation will take.
  final Duration animationDuration;

  /// [disableSplashEffect] The option for disable Inkwell widget's splash effect.
  final bool disableSplashEffect;

  /// [splashColor] The option for Inkwell widget's splashColor.
  final Color? splashColor;

  /// [focusColor] The option for Inkwell widget's focusColor.
  final Color? focusColor;


  const FlipCard({
    Key? key,
    this.focusColor,
    this.splashColor,
    this.disableSplashEffect = false,
    required this.controller,
    this.axis = FlipAxis.vertical,
    required this.rotateSide,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  FlipCardState createState() => FlipCardState();
}

class FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late AnimationController animationController;
  bool isFront = true;
  double anglePlus = 0;

  late Widget frontWidget;
  late Widget backWidget;

  Widget getFront() {
    return frontWidget;
  }

  Widget getBack() {
    return backWidget;
  }

  @override
  void initState() {
    super.initState();
    frontWidget = widget.controller.initialWidget;
    backWidget = frontWidget;
    animationController = AnimationController(duration: widget.animationDuration, vsync: this);
    widget.controller.state = this;
  }

  void updateCards(){
    setState(() {

    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  ///Flip the card
  Future flipCard(Widget newWid) async {
    if (isFront){
      backWidget = newWid;
    }else {
      frontWidget = newWid;
    }
    if (animationController.isAnimating) return;
    isFront = !isFront;
    await animationController.forward(from: 0).then((value) => anglePlus = pi);
  }

  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          double piValue = 0.0;
          if (widget.rotateSide == RotateSide.top ||
              widget.rotateSide == RotateSide.left) {
            piValue = pi;
          } else {
            piValue = -pi;
          }
          double angle = animationController.value * piValue;
          late Matrix4 transform;
          late Matrix4 transformForBack;
          if (isFront) angle += anglePlus;
          if (widget.axis == FlipAxis.horizontal) {
            transform = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(angle);
            transformForBack = Matrix4.identity()..rotateX(pi);
          } else {
            transform = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle);
            transformForBack = Matrix4.identity()..rotateY(pi);
          }

          return InkWell(
            onTap: null,
            splashColor: widget.splashColor,
            focusColor: widget.focusColor,
            overlayColor: widget.disableSplashEffect
                ? null
                : WidgetStateProperty.all(Colors.transparent),
            child: Transform(
                alignment: Alignment.center,
                transform: transform,
                child: isFrontWidget(angle.abs())
                    ? getFront()
                    : Transform(
                  transform: transformForBack,
                  alignment: Alignment.center,
                  child: getBack(),
                ))
          );
        });
  }

  bool isFrontWidget(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;
    return angle <= degrees90 || angle >= degrees270;
  }
}
