import 'package:elibapp/features/global_aggreement/const/home_ui_strategy.dart';
import 'package:elibapp/features/home/widget/reco_books_pane.dart';
import 'package:flutter/material.dart';

class RecoBooksPaneController_deprecated {

  late RecoBooksPaneState _state;


  List<Widget> _queue1;
  late Widget lastWidget;
  int _index = 0;
  Future<List<Widget>> Function() getNewWidgets;

  RecoBooksPaneController_deprecated(
    this._queue1,
    this.getNewWidgets,
  ){
    assert (_queue1.length % HomeUiStrategy.recoBooksReqNum == 0);
    lastWidget = _queue1.last;
  }

  void defineState(RecoBooksPaneState state){
    _state = state;
  }

  bool _canUpdate(){
    return _index == _queue1.length - 1;
  }

  void _applyToUpdate(List<Widget> newQueue){
    if (!_canUpdate()){
      return;
    }
    if (newQueue.isEmpty){
      // 如果获取不到，那就用原来的
      _index = 0;
      return;
    }
    _queue1 = newQueue;
    _index = 0;
  }

  Future<void> _addNew() async{
    var newQueue = await getNewWidgets();
    _applyToUpdate(newQueue);// 不是什么时候都可以直接赋值的，如果太晚了，只能舍弃
  }

  Future flip(){
    return _state.flip();
  }

  List<Widget> retrieve(){
    if (_index == _queue1.length - 1){
      lastWidget = _queue1.last;
      _addNew(); // 必须在lastWidget = _queue1.last;之后
      return [lastWidget];
    }
    // 返回9个widget
    var lis = _queue1.sublist(_index, _index + HomeUiStrategy.crowdRecoBookNum);
    _index += HomeUiStrategy.crowdRecoBookNum;
    return lis;
  }

}