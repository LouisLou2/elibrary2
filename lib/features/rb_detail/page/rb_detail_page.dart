import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';
import 'package:elibapp/features/rb_detail/bloc/rb_detail_bloc.dart';
import 'package:elibapp/features/rb_detail/const/rb_detail_ui_strategy.dart';
import 'package:elibapp/features/rb_detail/repo/rb_detail_repo.dart';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/error/reload_widget.dart';
import '../../../shared/widget/info_display/headline2.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../../../util/format_tool.dart';

class RBDetailPage extends StatefulWidget {
  const RBDetailPage({super.key});

  @override
  State<RBDetailPage>  createState() => _RBDetailPageState();
}

class _RBDetailPageState extends State<RBDetailPage> {

  @override
  Widget build(BuildContext context) {

    // 从路径参数中获取reserveId
    final int reserveId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: null,
      body: RepositoryProvider.value(
        value: GetIt.I.get<RBDetailRepo>(),
        child: BlocProvider(
          create: (context) => RBDetailBloc(reserveId),
          child: BlocBuilder<RBDetailBloc, RBDetailState>(
            buildWhen: (previous, current) {
              return current != RBDetailState.refreshedNet ||
                  current != RBDetailState.loadingNowNoData ||
                  current != RBDetailState.retry;
            },
            builder: (context, RBDetailState state){
              switch (state) {
                case RBDetailState.loadingNowNoData:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RBDetailState.retry:
                  return Center(
                    child: ReloadWidget(
                      tile: AppStrs.youOffline,
                      subtitle: AppStrs.tryReconnect,
                      onReload: () {
                        context.read<RBDetailBloc?>()?.add(RBDetailEvent.reqReloadNowNoData);
                      }),
                  );
                case RBDetailState.refreshedNet:

                  final RBDetailRepo repo = GetIt.I.get<RBDetailRepo>();
                  RBDetail detail = repo.currentDetail;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 40, 20,0),
                          color: RBDetailUiStrategy.getRBStatusColor(detail.status),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    '我的借阅',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  detail.status.str,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: UiSize.gap.largeGap,),
                              // Text(
                              //   '剩余${FormatTool.timeLeftStr(de)}',
                              //   style: const TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 15,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: const Alignment(0.0, 0),
                              colors: [
                                RBDetailUiStrategy.getRBStatusColor(detail.status),
                                Theme.of(context).colorScheme.surface,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                    minWidth: 300,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface.withAlpha(130),
                                    borderRadius: BorderRadius.circular(UiSize.border.mediumBorderR),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Wrap(
                                              crossAxisAlignment: WrapCrossAlignment.center,
                                              children: [
                                                Text(
                                                  detail.libName,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios_rounded,
                                                  color: Theme.of(context).colorScheme.onSurface,
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                            Wrap(
                                              crossAxisAlignment: WrapCrossAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.phone_rounded,
                                                  color: Theme.of(context).colorScheme.onSurface,
                                                ),
                                                const SizedBox(width: 25,),
                                                Icon(
                                                  Icons.location_on_rounded,
                                                  color: Theme.of(context).colorScheme.onSurface,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(15),
                                        constraints: const BoxConstraints(
                                          minWidth: 320,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.surface,
                                          borderRadius: BorderRadius.circular(UiSize.border.mediumBorderR),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Theme.of(context).colorScheme.onSurface.withAlpha(30),
                                              offset: const Offset(0, 1),
                                              blurRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FormatTool.trimText(detail.title),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: -0.7,
                                                  ),
                                                ),
                                                Text(
                                                  FormatTool.trimText(detail.oneAuthorName,maxLength: 35),
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                                SizedBox(height: UiSize.gap.smallGap,),
                                                Text(
                                                  '位置代码',
                                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  detail.location,
                                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    color: Theme.of(context).colorScheme.primary,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(height: UiSize.gap.mediumGap,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '取书期限',
                                                          style: Theme.of(context).textTheme.bodySmall,
                                                        ),
                                                        Text(
                                                          FormatTool.dateScaleStr2(detail.deadline),
                                                          style: Theme.of(context).textTheme.titleSmall,
                                                        ),
                                                        Text(
                                                          FormatTool.hourStr(detail.deadline.hour),
                                                          style: Theme.of(context).textTheme.titleSmall,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: UiSize.gap.largerGap,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '归还期限',
                                                          style: Theme.of(context).textTheme.bodySmall,
                                                        ),
                                                        Text(
                                                          FormatTool.dateScaleStr2(detail.dueTime),
                                                          style: Theme.of(context).textTheme.titleSmall,
                                                        ),
                                                        Text(
                                                          FormatTool.hourStr(detail.dueTime.hour),
                                                          style: Theme.of(context).textTheme.titleSmall,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
                                              child: getCustomCachedImage(
                                                url: detail.coverMUrl,
                                                width: 90,
                                                height: 127,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: UiSize.gap.largeGap,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildSection(
                                        context,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '扫码取书',
                                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontSize: 19,
                                                color: Theme.of(context).colorScheme.onSurface,
                                              ),
                                            ),
                                            _getDivider(context, 80),
                                            SizedBox(height: UiSize.gap.mediumGap,),
                                            QrImageView(
                                              data: detail.reserveId.toString(),
                                              version: QrVersions.auto,
                                              size: 200,
                                              gapless: false,
                                              eyeStyle: QrEyeStyle(
                                                eyeShape: QrEyeShape.square,
                                                color: Theme.of(context).colorScheme.onSurface,
                                              ),
                                              dataModuleStyle: QrDataModuleStyle(
                                                dataModuleShape: QrDataModuleShape.square,
                                                color: Theme.of(context).colorScheme.onSurface,
                                              ),
                                            ),
                                            SizedBox(height: UiSize.gap.mediumGap,),
                                            Text(
                                              '或输入代码',
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            SizedBox(height: UiSize.gap.smallGap,),
                                            OutlinedButton(
                                              onPressed: null,
                                              child: Text(
                                                detail.reserveId.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                  color: Theme.of(context).colorScheme.onSurface,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: UiSize.gap.largeGap,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildSection(
                                        context,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '更改&取消',
                                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontSize: 19,
                                                color: Theme.of(context).colorScheme.onSurface,
                                              ),
                                            ),
                                            _getDivider(context, 50),
                                            SizedBox(height: UiSize.gap.mediumGap,),
                                            Wrap(
                                              children: [
                                                Container(
                                                  constraints: const BoxConstraints(
                                                    minHeight: 40,
                                                    minWidth: 120,
                                                  ),
                                                  child:OutlinedButton(
                                                    onPressed: (){},
                                                    child: Text(
                                                      '更改预约',
                                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                        color: Theme.of(context).colorScheme.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: UiSize.gap.largerGap,),
                                                Container(
                                                  constraints: const BoxConstraints(
                                                    minHeight: 40,
                                                    minWidth: 120,
                                                  ),
                                                  child:FilledButton(
                                                    onPressed: (){},
                                                    style: ButtonStyle(
                                                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.error.withOpacity(0.2)),
                                                      overlayColor: WidgetStateProperty.all(Theme.of(context).colorScheme.error.withOpacity(0.4)),
                                                    ),
                                                    child: Text(
                                                      '取消预约',
                                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                        color: Theme.of(context).colorScheme.error,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: UiSize.gap.mediumGap,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: UiSize.gap.smallGap,),
                                Text(
                                  '*频繁取消预约可能会影响您的信用分数',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                SizedBox(height: UiSize.gap.largeGap,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildSection(
                                        context,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '借阅详情',
                                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontSize: 19,
                                                color: Theme.of(context).colorScheme.onSurface,
                                              ),
                                            ),
                                            _getDivider(context, 80),
                                            SizedBox(height: UiSize.gap.mediumGap,),
                                            _getDetailPair('预约单号', detail.reserveId.toString()),
                                            _getDetailPair('借阅时间', FormatTool.ymdhmsStr(detail.reserveTime)),
                                            _getDetailPair('应还时间', FormatTool.ymdhmsStr(detail.dueTime)),
                                            _getDetailPair('取书时间', detail.pickUpTime == null ? '--' : FormatTool.ymdhmsStr(detail.pickUpTime!)),
                                            _getDetailPair('还书时间', detail.returnTime == null ? '--' : FormatTool.ymdhmsStr(detail.returnTime!)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: UiSize.gap.largerGap,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildSection(
                                        context,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '借阅须知',
                                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontSize: 19,
                                                color: Theme.of(context).colorScheme.onSurface,
                                              ),
                                            ),
                                            _getDivider(context, 70),
                                            SizedBox(height: UiSize.gap.mediumGap,),
                                            ...List.generate(2, (index) => Text(
                                              '1. 请在规定时间内取书，逾期未取将自动取消预约',
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              maxLines: 5,
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                default:
                  throw Exception('Unknown state: $state');
              }
            },
          ),
        ),
      ),
    );
  }
  Widget _buildSection(BuildContext context, Widget child){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(UiSize.border.mediumBorderR),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 0.8,
        ),
      ),
      child:child,
    );
  }
  Widget _getDivider(BuildContext context,double maxWidth){
    return Container(
      height: 3,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
      ),
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
    );
  }

  Widget _getDetailPair(String name, String data){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: UiSize.gap.mediumGap,),
          Text(
            data,
          ),
        ],
      ),
    );
  }
}