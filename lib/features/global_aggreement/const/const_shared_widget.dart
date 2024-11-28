import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ConstSharedWidget{
  static const Widget classicRefreshHeader = ClassicHeader(
    refreshingText: '正在刷新',
    releaseText: '释放刷新',
    completeText: '刷新完成',
    idleText: '下拉刷新',
  );

  static const Widget classicRefreshFooter = ClassicFooter(
    loadingText: '正在加载',
    idleText: '上拉加载',
    noDataText: '没有更多数据了',
    failedText: '加载失败',
  );
}