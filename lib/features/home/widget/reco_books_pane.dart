import 'dart:async';
import 'package:flutter/material.dart';

import '../../../shared/widget/flip/flip_card.dart';
import '../../../shared/widget/flip/flip_card_controllers.dart';
import '../../../shared/widget/flip/flip_side.dart';
import 'RecoBooksPaneController2.dart';

class RecoBooksPane extends StatefulWidget {
  final RecoBooksPaneController2 controller;
  const RecoBooksPane({super.key, required this.controller});
  @override
  State<RecoBooksPane> createState() => RecoBooksPaneState();
}

class RecoBooksPaneState extends State<RecoBooksPane> {

  late final FlipCardController _wholePaneFlipController;

  bool _lastSingle = true;
  bool _nextSingle = false;

  // for single
  late Widget _singleWidget;
  // for multiple
  late List<Widget> _crowdRecoBooks;
  late List<FlipCard> _cards;
  late List<FlipCardController> _cardControllers;
  late Widget _aggregateWidget;

  void _initPane(){
    _initMulti();
    _wholePaneFlipController = FlipCardController(_aggregateWidget);
  }

  void _initMulti(){
    _crowdRecoBooks = widget.controller.retrieve();
    _cardControllers = List.generate(
      _crowdRecoBooks.length,
      (index) => FlipCardController(_crowdRecoBooks[index]),
    );
    _lastSingle = false;

    _cards = List.generate(
      _crowdRecoBooks.length,
        (index) => FlipCard(
        animationDuration: const Duration(milliseconds: 300),
        rotateSide: RotateSide.left,
        axis: FlipAxis.vertical,
        controller: _cardControllers[index],
      ),
    );

    _aggregateWidget = GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: _crowdRecoBooks.length,
      itemBuilder: (context, index) => _cards[index],
    );
  }

  void refreshAggregate(){
    _initMulti();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.defineState(this);
    _initPane();
  }

  Future flip() {
    List<Widget> newWidgets = widget.controller.retrieve();
    if (newWidgets.length == 1){
      _singleWidget = newWidgets.first;
      _nextSingle = true;
    } else {
      assert (newWidgets.length == _crowdRecoBooks.length);
      _crowdRecoBooks = newWidgets;
      _nextSingle = false;
    }
    // 需要直接翻转
    if (_nextSingle){
      _lastSingle = _nextSingle;
      return _wholePaneFlipController.flipcard(_singleWidget);
    }

    if (!_nextSingle && _lastSingle){
      _lastSingle = _nextSingle;
      _cardControllers = List.generate(
        _crowdRecoBooks.length,
            (index) => FlipCardController(_crowdRecoBooks[index]),
      );
      _cards = List.generate(
        _crowdRecoBooks.length,
            (index) => FlipCard(
          animationDuration: const Duration(milliseconds: 300),
          rotateSide: RotateSide.left,
          axis: FlipAxis.vertical,
          controller: _cardControllers[index],
        ),
      );

      return _wholePaneFlipController.flipcard(_aggregateWidget);
    }

    // 说明前一个也是多个widget， 下一个也是，直接将子卡片翻转
    // 先将原来的存起来
    Completer completer = Completer();
    for (int i = 0; i < _crowdRecoBooks.length-1; i++){
      // 每隔200ms翻转一个
      Future.delayed(Duration(milliseconds: 100 * i), (){
        _cardControllers[i].flipcard(_crowdRecoBooks[i]);
      });
    }
    // 拿到最后一个的Future
    int endInd = _crowdRecoBooks.length-1;
    Future lastFuture = _cardControllers[endInd].flipcard(_crowdRecoBooks[endInd]);
    lastFuture.then((value) => completer.complete());
    return completer.future;
  }


  @override
  Widget build(BuildContext context) {
    return FlipCard(
      animationDuration: const Duration(milliseconds: 300),
      rotateSide: RotateSide.left,
      axis: FlipAxis.vertical,
      controller: _wholePaneFlipController,
    );
  }
}