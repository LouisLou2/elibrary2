import 'package:elibapp/entity/announ/announcement.dart';

import '../../../entity/struct/res.dart';

abstract class AnnounContentData{
  Future<Res<Announcement>> getAnnouncementNet(int announcementId);
}