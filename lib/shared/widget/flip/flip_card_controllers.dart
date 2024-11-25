import 'package:flutter/material.dart';

import 'flip_card.dart';
import 'gesture_flip_card.dart';

///This controller used to call Fliping
class FlipCardController {
  FlipCardState? state;
  Widget initialWidget;

  FlipCardController(this.initialWidget);

  /// Flip the card
  Future flipcard(Widget newWid) async => state?.flipCard(newWid);
}

class GestureFlipCardController {
  FlipCardState1? state;

  /// Flip the card
  Future flipcard() async => state?.gestureflipCard();
}
