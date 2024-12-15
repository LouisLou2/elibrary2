import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/features/reserve_borrow_record/bloc/rb_bloc.dart';
import 'package:elibapp/features/reserve_borrow_record/repo/rb_record_repo.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/widget/custom_image_tile.dart';
import 'package:elibapp/shared/widget/error/reload_widget.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:elibapp/util/format_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../entity/reserve_borrow/reserve_borrow_brief.dart';

class RBRecordListPage extends StatefulWidget {
  
  final RBRecordType type;
  const RBRecordListPage({super.key, required this.type});

  @override
  State<RBRecordListPage> createState() => _RBRecordListPageState();
}

class _RBRecordListPageState extends State<RBRecordListPage> {
  
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
  }

  void _handleRefreshLoad(RBState state) {
    switch (state) {
      case RBState.refreshedNet:
        _refreshController.refreshCompleted();
        break;
      case RBState.loadedMore:
        _refreshController.loadComplete();
        break;
      case RBState.refreshNetFailed:
        _refreshController.refreshFailed();
        break;
      case RBState.loadedMoreFailed:
        _refreshController.loadFailed();
        break;
      case RBState.refreshingNet:
        _refreshController.requestRefresh(needMove: true,needCallback: false);
        break;
      case RBState.loadingMore:
        _refreshController.requestLoading(needMove: true);
        break;
      default:
        throw Exception('_handleRefreshLoad: Unknown state: $state');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RBRecordBloc(widget.type),
      child: BlocConsumer<RBRecordBloc, RBState>(
        listenWhen: (previous, current){
          return current == RBState.refreshedNet ||
              current == RBState.loadedMore ||
              current == RBState.refreshNetFailed ||
              current == RBState.loadedMoreFailed ||
              current == RBState.refreshingNet ||
              current == RBState.loadingMore;
        },
        buildWhen: (previous, current){
          return current == RBState.loadingNoData ||
              current == RBState.retry ||
              current == RBState.refreshLocal ||
              current == RBState.refreshedNet ||
              current == RBState.loadedMore;
        },
        listener: (context, state) => _handleRefreshLoad(state),
        builder: (context, state) {
          switch (state) {
            case RBState.loadingNoData:
              return const Center(child: CircularProgressIndicator());
            case RBState.retry:
              return ReloadWidget(onReload: () {
                context.read<RBRecordBloc?>()?.add(RBEvent.reqRefreshNet);
              });
            case RBState.refreshLocal:
            case RBState.refreshedNet:
            case RBState.loadedMore:
              RBRecordRepo repo = GetIt.I<RBRecordRepo>();
              List<ReserveBorrowBrief> records = repo.getCurrentRecords(widget.type);
              return SmartRefresher(
                physics: const BouncingScrollPhysics(),
                controller: _refreshController,
                onRefresh: () {
                  context.read<RBRecordBloc?>()?.add(RBEvent.reqRefreshNet);
                },
                onLoading: () {
                  context.read<RBRecordBloc?>()?.add(RBEvent.reqLoadMore);
                },
                enablePullDown: true,
                enablePullUp: repo.hasRefreshedNet(widget.type),
                header: const ClassicHeader(),
                footer: const ClassicFooter(),
                child: records.isEmpty ?
                const Center(child: Text('没有记录')) :
                ListView.builder(
                  itemCount: records.length,
                  itemExtent: 120,
                  itemBuilder: (context, i) {
                    return CustomImageTile(
                      image: getCustomCachedImage(
                        url: records[i].coverMUrl,
                        width: 65,
                        height: 90,
                      ),
                      title: records[i].status.str,
                      subTitle: records[i].title,
                      thirdTitle: '${records[i].deadlineStr} 到期',
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      bottomDivider: true,
                      fontSize: 16,
                      surfaceColor2: Theme.of(context).primaryColor,
                      customTitleWidget: Row(
                        children: [
                          Text(
                            '${FormatTool.ymdhmsStr(records[i].reserveTime)} 预约',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).hintColor,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ],
                      ),
                      onTap: () => NavigationHelper.toRBDetailPage(records[i].reserveId),
                    );
                  },
                ),
              );
            default:
              throw Exception('Unknown state: $state');
          }
        },
      ),
    );
  }
}