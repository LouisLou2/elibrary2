import 'dart:async';

import 'package:elibapp/features/global_aggreement/const/home_ui_strategy.dart';
import 'package:elibapp/features/home/widget/reco_books_pane.dart';
import 'package:elibapp/struct/list/sim_linked_list_iter.dart';
import 'package:elibapp/struct/list/simple_linked_list.dart';
import 'package:flutter/material.dart';


class RecoBooksPaneController2 {
  late RecoBooksPaneState _state;

  late SimLinkedList<Widget> _queue;
  int _index = 0;
  final int setNum = HomeUiStrategy.recoBooksReqNum;
  final int crowdNum = HomeUiStrategy.crowdRecoBookNum;

  late SimLinkedListIter<Widget> _iter;

  Future<List<Widget>> Function() getNewWidgets;

  RecoBooksPaneController2(
    List<Widget> widgets,
    this.getNewWidgets,
  ){
    assert (widgets.length % setNum == 0);
    assert (setNum == crowdNum * 2 + 1);
    _queue= SimLinkedList<Widget>();
    _queue.appendAll(widgets);
    _iter = _queue.iterator;
  }


  void defineState(RecoBooksPaneState state){
    _state = state;
  }

  Future<void> _addNew() async{
    var newQueue = await getNewWidgets();
    _queue.appendAll(newQueue);
  }

  Future flip(){
    return _state.flip();
  }

  // 此函数不允许使用_index
  List<Widget> _collect(int num){
    List<Widget> res = [];
    for (var i = 0; i < num; i++){
      if (_iter.moveNext()){
        res.add(_iter.current);
      } else {
        break;
      }
    }
    return res;
  }

  void landToFist(){
    _index = 0;
    _iter = _queue.iterator;
  }

  List<Widget> retrieve(){
    if (_index % setNum == 0){
      if (_index == 0){
        _index += crowdNum;
        return _collect(crowdNum);
      }
      if (_index < _queue.length){
        // 说明后面还有
        _queue.removeHead(crowdNum);
        _index = crowdNum;
        return _collect(crowdNum);
      }else{
        // 说明后面没有了(新的数据有没有到达，只得回到第一个)
        landToFist();
        _index += crowdNum;
        return _collect(crowdNum);
      }
    }
    if ( _index == crowdNum){
      _index += crowdNum;
      _addNew();
      return _collect(crowdNum);
    }
    if (_index == setNum - 1){
      // 说明需要返回一个
      _index += 1;
      return _collect(1);
    }
    // 这个其实不能出现，如果出现了，说明逻辑有问题，而不是数据有问题
    throw Exception("Invalid index");
  }

}