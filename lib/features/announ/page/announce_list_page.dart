import 'package:cached_network_image/cached_network_image.dart';
import 'package:elibapp/entity/announ/announce_brief.dart';
import 'package:elibapp/features/announ/bloc/announ_bloc.dart';
import 'package:elibapp/features/announ/bloc/announ_event.dart';
import 'package:elibapp/features/announ/repo/announ_repo.dart';
import 'package:elibapp/shared/widget/error/reload_widget.dart';
import 'package:elibapp/style/ui_const.dart';
import 'package:elibapp/util/format_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_card/image_card.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../helper/nav/navigation_helper.dart';
import '../../global_aggreement/const/const_shared_widget.dart';
import '../bloc/announ_state.dart';

class AnnounListPage extends StatefulWidget {
  const AnnounListPage({super.key});

  @override
  State<AnnounListPage> createState() => _AnnounListPageState();
}

class _AnnounListPageState extends State<AnnounListPage> {

  final RefreshController _refreshController = RefreshController();

  void resolveRefreshAndLoadChange(AnnounState state){
    if (state is AnnounListLoadingHasData) {
      _refreshController.requestRefresh(needMove: true, needCallback: false);
    }
    if (state is AnnounListRefreshSuccess && !state.isFirst) {
      _refreshController.refreshCompleted();
    }
    if (state is AnnounListRefreshError) {
      _refreshController.refreshFailed();
    }
    if (state is AnnounListLoadMoreSuccess) {
      _refreshController.loadComplete();
    }
    if (state is AnnounListLoadMoreError) {
      _refreshController.loadFailed();
    }
    if (state is AnnounListLoadingMore) {
      _refreshController.requestLoading(needMove: true, needCallback: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context); // 返回上一页
            },
          ),
        ),
        title: const Text('通知中心'),
        surfaceTintColor: Colors.transparent,
      ),
      body: RepositoryProvider.value(
        value: GetIt.I<AnnounRepo>(),
        child: BlocProvider(
          create: (context) => AnnounBloc(),
          child: BlocConsumer<AnnounBloc, AnnounState>(
            listenWhen: (previous, current) {
              return previous != current && (
                  current is AnnounListLoadingHasData||
                  current is AnnounListRefreshSuccess ||
                  current is AnnounListRefreshError||
                  current is AnnounListLoadMoreSuccess||
                  current is AnnounListLoadMoreError ||
                  current is AnnounListLoadingMore
              );
            },
            buildWhen: (previous, current){
              return previous != current && (
                  current is AnnounListLoadingNoData ||
                  current is AnnounListRetry ||
                  current is AnnounListRefreshSuccess ||
                  current is AnnounListLoadMoreSuccess
              );
            },
            listener: (context, state) => resolveRefreshAndLoadChange(state),
            builder: (context, state) {
              if (state is AnnounListLoadingNoData) return const Center(child: CircularProgressIndicator());
              if (state is AnnounListRetry){
                return Center(
                  child: ReloadWidget(
                    onReload: () => context.read<AnnounBloc?>()?.add(AnnounEvent.reqRefresh),
                  ),
                );
              }
              if (state is AnnounListRefreshSuccess || state is AnnounListLoadMoreSuccess){
                AnnounRepo repo = GetIt.I<AnnounRepo>();
                List<AnnounceBrief> announceBriefs = repo.currentAnnounList;
                return SmartRefresher(
                  physics: const BouncingScrollPhysics(),
                  enablePullDown: true,
                  enablePullUp: true,
                  header: ConstSharedWidget.classicRefreshHeader,
                  footer: ConstSharedWidget.classicRefreshFooter,
                  controller: _refreshController,
                  onRefresh: () => context.read<AnnounBloc?>()?.add(AnnounEvent.reqRefresh),
                  onLoading: () => context.read<AnnounBloc?>()?.add(AnnounEvent.reqLoadMore),
                  child: ListView.builder(
                    itemCount: announceBriefs.length,
                    itemBuilder: (context, i) => _announBriefCard(context, announceBriefs[i]),
                  ),
                );
              }
              throw Exception('未知的状态');// 仅仅作为debug使用
            },
          ),
        ),
      ),
    );
  }

  Widget _announBriefCard(BuildContext con, AnnounceBrief announ){
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          const SizedBox(height: 16),
          Text(
            FormatTool.ymdhmsStr(announ.sendingTime),
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: ()=>NavigationHelper.toAnnounDetail(id: announ.announcementId),
            child: FillImageCard(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: 360,
              heightImage: 140,
              imageProvider: announ.hasCover ? CachedNetworkImageProvider(announ.cover!) : AssetImage(UiConst.defNotificationCover),
              color: Theme.of(context).cardColor,
              title: Text(announ.title),
              description: Text('#${announ.category.tag}'),
            ),
          ),
        ],
      ),
    );
  }
}
