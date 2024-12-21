// import 'package:flutter/material.dart';
// import 'package:flutter_sticky_header/flutter_sticky_header.dart';
// import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
//
// import '../../../entity/book/book_viewing_history.dart';
// import '../../../struct/pair.dart';
//
// class ViewingHistTime extends StatefulWidget {
//   const ViewingHistTime({super.key});
//
//   @override
//   State<ViewingHistTime> createState() => _ViewingHistTimeState();
// }
//
// class _ViewingHistTimeState extends State<ViewingHistTime> {
//
//   List<BookViewingHistory> historyList = [
//     // 2024年12月 (December 2024)
//     BookViewingHistory(userId: 1, isbn: '978-3-16-148410-0', title: 'Book One', authorNames: ['Author A'], publisherName: 'Publisher A', viewingTime: DateTime(2024, 12, 18), coverMUrl: 'https://example.com/cover1.jpg', coverDomColor: 0xFF0000),
//     BookViewingHistory(userId: 2, isbn: '978-1-23-456789-0', title: 'Book Two', authorNames: ['Author B'], publisherName: 'Publisher B', viewingTime: DateTime(2024, 12, 12), coverMUrl: 'https://example.com/cover2.jpg', coverDomColor: 0x00FF00),
//     BookViewingHistory(userId: 3, isbn: '978-0-12-345678-9', title: 'Book Three', authorNames: ['Author C'], publisherName: 'Publisher C', viewingTime: DateTime(2024, 12, 10), coverMUrl: 'https://example.com/cover3.jpg', coverDomColor: 0x0000FF),
//     BookViewingHistory(userId: 4, isbn: '978-9-87-654321-0', title: 'Book Four', authorNames: ['Author D'], publisherName: 'Publisher D', viewingTime: DateTime(2024, 12, 5), coverMUrl: 'https://example.com/cover4.jpg', coverDomColor: 0xFFFF00),
//     BookViewingHistory(userId: 5, isbn: '978-0-11-223344-5', title: 'Book Five', authorNames: ['Author E'], publisherName: 'Publisher E', viewingTime: DateTime(2024, 12, 1), coverMUrl: 'https://example.com/cover5.jpg', coverDomColor: 0xFF00FF),
//
//     // 2024年11月 (November 2024)
//     BookViewingHistory(userId: 6, isbn: '978-1-23-456789-1', title: 'Book Six', authorNames: ['Author F'], publisherName: 'Publisher F', viewingTime: DateTime(2024, 11, 27), coverMUrl: 'https://example.com/cover6.jpg', coverDomColor: 0xAA0000),
//     BookViewingHistory(userId: 7, isbn: '978-2-34-567890-1', title: 'Book Seven', authorNames: ['Author G'], publisherName: 'Publisher G', viewingTime: DateTime(2024, 11, 20), coverMUrl: 'https://example.com/cover7.jpg', coverDomColor: 0x00AAAA),
//     BookViewingHistory(userId: 8, isbn: '978-3-45-678901-1', title: 'Book Eight', authorNames: ['Author H'], publisherName: 'Publisher H', viewingTime: DateTime(2024, 11, 19), coverMUrl: 'https://example.com/cover8.jpg', coverDomColor: 0xFF6600),
//     BookViewingHistory(userId: 9, isbn: '978-4-56-789012-1', title: 'Book Nine', authorNames: ['Author I'], publisherName: 'Publisher I', viewingTime: DateTime(2024, 11, 19), coverMUrl: 'https://example.com/cover9.jpg', coverDomColor: 0xCC00CC),
//     BookViewingHistory(userId: 10, isbn: '978-5-67-890123-1', title: 'Book Ten', authorNames: ['Author J'], publisherName: 'Publisher J', viewingTime: DateTime(2024, 11, 19), coverMUrl: 'https://example.com/cover10.jpg', coverDomColor: 0xFFFF33),
//
//     // 2024年10月 (October 2024)
//     BookViewingHistory(userId: 11, isbn: '978-6-78-901234-1', title: 'Book Eleven', authorNames: ['Author K'], publisherName: 'Publisher K', viewingTime: DateTime(2024, 10, 22), coverMUrl: 'https://example.com/cover11.jpg', coverDomColor: 0x66FF00),
//     BookViewingHistory(userId: 12, isbn: '978-7-89-012345-1', title: 'Book Twelve', authorNames: ['Author L'], publisherName: 'Publisher L', viewingTime: DateTime(2024, 10, 22), coverMUrl: 'https://example.com/cover12.jpg', coverDomColor: 0xFF0066),
//     BookViewingHistory(userId: 13, isbn: '978-8-90-123456-1', title: 'Book Thirteen', authorNames: ['Author M'], publisherName: 'Publisher M', viewingTime: DateTime(2024, 10, 12), coverMUrl: 'https://example.com/cover13.jpg', coverDomColor: 0x6600FF),
//     BookViewingHistory(userId: 14, isbn: '978-9-01-234567-1', title: 'Book Fourteen', authorNames: ['Author N'], publisherName: 'Publisher N', viewingTime: DateTime(2024, 10, 1), coverMUrl: 'https://example.com/cover14.jpg', coverDomColor: 0xFF3366),
//     BookViewingHistory(userId: 15, isbn: '978-0-12-345678-1', title: 'Book Fifteen', authorNames: ['Author O'], publisherName: 'Publisher O', viewingTime: DateTime(2024, 10, 1), coverMUrl: 'https://example.com/cover15.jpg', coverDomColor: 0x660033),
//     BookViewingHistory(userId: 16, isbn: '978-1-23-456789-2', title: 'Book Sixteen', authorNames: ['Author P'], publisherName: 'Publisher P', viewingTime: DateTime(2024, 10, 1), coverMUrl: 'https://example.com/cover16.jpg', coverDomColor: 0x336600),
//     BookViewingHistory(userId: 17, isbn: '978-2-34-567890-2', title: 'Book Seventeen', authorNames: ['Author Q'], publisherName: 'Publisher Q', viewingTime: DateTime(2024, 10, 1), coverMUrl: 'https://example.com/cover17.jpg', coverDomColor: 0x00FF00),
//   ];
//   final RefreshController _refreshController = RefreshController();
//
//   @override
//   void initState() {
//     super.initState();
//     List<Pair> ymFromToIndex = _getMonthGroups(historyList);
//     for (Pair p in ymFromToIndex) {
//       print('from ${p.first} to ${p.second}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Viewing History'),
//       ),
//       body: SmartRefresher(
//         controller: _refreshController,
//         onRefresh: () {
//           _refreshController.refreshCompleted();
//         },
//         child: CustomScrollView(
//           slivers: _getMonthSlivers(_getMonthGroups(historyList), historyList),
//         ),
//       ),
//     );
//   }
//
//   // 前提是historyList已经按时间降序排列
//   List<Pair> _getMonthGroups(List<BookViewingHistory> historyList) {
//     List<Pair<int,int>> ymFromToIndex = [];
//     if (historyList.isEmpty) {
//       return ymFromToIndex;
//     }
//     int from = 0; // inclusive
//     int to = 0; // inclusive
//     int currentY = historyList[0].viewingTime.year;
//     int currentM = historyList[0].viewingTime.month;
//     for (int i=1; i<historyList.length; ++i) {
//       if (historyList[i].viewingTime.year != currentY || historyList[i].viewingTime.month != currentM) {
//         to = i-1;
//         ymFromToIndex.add(Pair(from, to));
//         from = i;
//         currentY = historyList[i].viewingTime.year;
//         currentM = historyList[i].viewingTime.month;
//       }
//     }
//     ymFromToIndex.add(Pair(from, historyList.length-1));
//     return ymFromToIndex;
//   }
//
//   List<SliverStickyHeader> _getMonthSlivers(List<Pair> ymFromToIndex, List<BookViewingHistory> historyList) {
//     List<SliverStickyHeader> slivers = [];
//     for (Pair p in ymFromToIndex) {
//       slivers.add(SliverStickyHeader(
//         header: Container(
//           height: 100,
//           color: Colors.lightBlue,
//           padding: const EdgeInsets.symmetric(vertical: 30.0),
//           child: Text(
//               '${historyList[p.first].viewingTime.year}年${historyList[p.first].viewingTime.month}月',
//               style: const TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//         sliver: SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (context, ind) {
//               int i = p.first + ind;
//               return ListTile(
//                 onTap: () {
//                   print('tile $i');
//                 },
//                 leading: CircleAvatar(
//                   child: Text('${historyList[i].viewingTime.day}'),
//                 ),
//                 title: Text(historyList[i].title),
//                 subtitle: Text(historyList[i].authorNames.join(', ')),
//               );
//             },
//             childCount: p.second - p.first + 1,
//           ),
//         ),
//       ));
//     }
//     return slivers;
//   }
//
// }

import 'package:elibapp/util/format_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../entity/book/book_viewing_history.dart';
import '../../../helper/nav/navigation_helper.dart';
import '../../../shared/widget/error/reload_widget.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../../../struct/pair.dart';
import '../bloc/list/vb_bloc.dart';

class ViewingHistTime extends StatefulWidget {
  const ViewingHistTime({super.key});

  @override
  State<StatefulWidget> createState() => _ViewingHistTimeState();
}

class _ViewingHistTimeState extends State<ViewingHistTime> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VbBloc.byTime(),
      child: BlocConsumer<VbBloc, VbState>(
        listenWhen: (previous, current){
          return current == VbState.loadingMore
              || current == VbState.loadedMore
              || current == VbState.loadingMoreError
              || current == VbState.loadNoMore;
        },
        buildWhen: (previous, current){
          return current == VbState.loading
              || current == VbState.retry
              || current == VbState.loaded
              || current == VbState.loadedMore
              || current == VbState.loadNoMore;
        },
        listener: (context, state) {
          switch (state) {
            case VbState.loadingMore:
              _refreshController.requestLoading(needMove: true, needCallback: false);
              break;
            case VbState.loadedMore:
              _refreshController.loadComplete();
              break;
            case VbState.loadingMoreError:
              _refreshController.loadFailed();
              break;
            case VbState.loadNoMore:
              _refreshController.loadNoData();
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          switch (state) {
            case VbState.loading:
              return const Center(child: CircularProgressIndicator());
            case VbState.retry:
              return Center(
                child: ReloadWidget(
                  tile: AppStrs.youOffline,
                  subtitle: AppStrs.tryReconnect,
                  onReload: () => context.read<VbBloc?>()?.add(VbEvent.reqReloadNowNoData),
                ),
              );
            case VbState.loaded:
            case VbState.loadedMore:
            case VbState.loadNoMore:
              List<BookViewingHistory> vbHistList = context.read<VbBloc?>()?.vbHistList ?? [];
              return SmartRefresher(
                controller: _refreshController,
                header: const ClassicHeader(),
                footer: const ClassicFooter(),
                enablePullDown: false,
                enablePullUp: state == VbState.loadNoMore ? false : true,
                onLoading: () => context.read<VbBloc?>()?.add(VbEvent.reqLoadMore),
                child: vbHistList.isEmpty ? const Center(child: Text('No data'))
                : CustomScrollView(
                  slivers: _getMonthSlivers(_getMonthGroups(vbHistList), vbHistList),
                ),
              );
            default:
              return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }

  // 前提是historyList已经按时间降序排列
  List<Pair<int,int>> _getMonthGroups(List<BookViewingHistory> historyList) {
    List<Pair<int,int>> ymFromToIndex = [];
    if (historyList.isEmpty) {
      return ymFromToIndex;
    }
    int from = 0; // inclusive
    int to = 0; // inclusive
    int currentY = historyList[0].viewingTime.year;
    int currentM = historyList[0].viewingTime.month;
    for (int i=1; i<historyList.length; ++i) {
      if (historyList[i].viewingTime.year != currentY || historyList[i].viewingTime.month != currentM) {
        to = i-1;
        ymFromToIndex.add(Pair(from, to));
        from = i;
        currentY = historyList[i].viewingTime.year;
        currentM = historyList[i].viewingTime.month;
      }
    }
    ymFromToIndex.add(Pair(from, historyList.length-1));
    return ymFromToIndex;
  }

  List<SliverStickyHeader> _getMonthSlivers(List<Pair> ymFromToIndex, List<BookViewingHistory> historyList) {
    List<SliverStickyHeader> slivers = [];
    for (Pair p in ymFromToIndex) {
      slivers.add(SliverStickyHeader(
        header: Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Text(
            '${historyList[p.first].viewingTime.year}年${historyList[p.first].viewingTime.month}月',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.4,
            ),
          ),
        ),
        sliver: SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, ind) {
              int i = p.first + ind;
              BookViewingHistory vbHist = historyList[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ImageTile(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(12),
                  borderR: 10,
                  image: getCustomCachedImage(
                    url: vbHist.coverMUrl,
                    width: 60,
                    height: 84,
                  ),
                  title: vbHist.title,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  titleWeight: FontWeight.w500,
                  subTitle: '作者 | ${vbHist.authorNamesStr}',
                  thirdTitle: '${FormatTool.ymdhmsStr(vbHist.viewingTime)} 浏览',
                  fontSize3: Theme.of(context).textTheme.bodySmall?.fontSize,
                  onTap: () => NavigationHelper.toBookView(isbn: vbHist.isbn, coverUrl: vbHist.coverMUrl),
                  actionWidget: Icon(
                    CupertinoIcons.forward,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              );
            },
            childCount: p.second - p.first + 1,
          ),
          itemExtent: 130,
        ),
      ));
    }
    return slivers;
  }
}