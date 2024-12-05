import 'package:elibapp/entity/announ/announce_brief.dart';
import 'package:elibapp/features/announ/const/announ_list_ui_strategy.dart';
import 'package:elibapp/features/announ/data/announ_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';
import '../announ_repo.dart';

class AnnounRepoImpl implements AnnounRepo {

  final AnnounData _announData = GetIt.I<AnnounData>();

  late List<AnnounceBrief> _announList;
  int pageNum = -1;

  @override
  Future<bool> loadMoreNet() async{
    Res<List<AnnounceBrief>> res = await _announData.getAnnounceBriefsNet((pageNum + 1)*AnnounListUiStrategy.pageSize, AnnounListUiStrategy.pageSize);
    if (!res.isSuccess) return false;
    assert(res.data != null);
    if (res.data!.isNotEmpty){
      _announList.addAll(res.data!);
      ++pageNum;
    }
    return true;
  }

  @override
  Future<bool> refreshAnnounNet() async{
    Res<List<AnnounceBrief>> res = await _announData.getAnnounceBriefsNet(0, AnnounListUiStrategy.pageSize);
    if (!res.isSuccess) return false;
    _announList = res.data!;
    pageNum = 0;
    return true;
  }

  @override
  List<AnnounceBrief> get currentAnnounList => _announList;

}