import 'package:elibapp/features/announ_content/bloc/announ_content_bloc.dart';
import 'package:elibapp/features/announ_content/repo/announ_content_repo.dart';
import 'package:elibapp/shared/widget/error/reload_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';

import '../../../common/app_strings.dart';
import '../../../entity/announ/announcement.dart';

class AnnounContentPage extends StatefulWidget {
  const AnnounContentPage({super.key});

  @override
  State<AnnounContentPage> createState() => _AnnounListPageState();
}

class _AnnounListPageState extends State<AnnounContentPage> {

  @override
  Widget build(BuildContext context) {

    // 获取route参数
    int announId = ModalRoute.of(context)?.settings.arguments as int;
    // int announId = 1;

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
        title: const Text('通知详情'),
        surfaceTintColor: Colors.transparent,
      ),
      body: RepositoryProvider.value(
        value: GetIt.I<AnnounContentRepo>(),
        child: BlocProvider(
          create: (context) => AnnounContentBloc(announId),
          child: BlocBuilder<AnnounContentBloc, AnnounContentState>(
            builder: (context, state) {
              if (state == AnnounContentState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state == AnnounContentState.retry) {
                return Center(
                  child: ReloadWidget(
                    tile: AppStrs.youOffline,
                    subtitle: AppStrs.tryReconnect,
                    onReload: () => context.read<AnnounContentBloc?>()?.add(AnnounContentEvent.reqReloadFromRetry),
                  ),
                );
              } else if (state == AnnounContentState.loaded) {
                final AnnounContentRepo repo = GetIt.I<AnnounContentRepo>();
                final Announcement? announcement = repo.currentAnnouncement;
                assert(announcement != null);
                return SelectionArea(
                    child: Markdown(
                    data: announcement!.content,
                    selectable: false,
                  ),
                );
              }
              throw Exception('state not found');
            },
          ),
        ),
      ),
    );
  }
}