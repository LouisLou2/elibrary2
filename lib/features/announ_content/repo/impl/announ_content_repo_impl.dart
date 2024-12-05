import 'package:elibapp/entity/announ/announcement.dart';
import 'package:elibapp/features/announ_content/data/announ_content_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';
import '../announ_content_repo.dart';

class AnnounContentRepoImpl extends AnnounContentRepo {

  final AnnounContentData _data = GetIt.I<AnnounContentData>();

  Announcement? _announcement;

  @override
  Future<bool> retrieveAnnouncement(int announcementId) async{
    Res<Announcement> res = await _data.getAnnouncementNet(announcementId);
    if (!res.isSuccess) return false;
    _announcement = res.data;
    return true;
  }

  @override
  Announcement? get currentAnnouncement => _announcement;

}