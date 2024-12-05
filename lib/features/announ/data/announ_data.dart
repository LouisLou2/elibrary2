import 'package:elibapp/entity/announ/announce_brief.dart';

import '../../../entity/struct/res.dart';

abstract class AnnounData {
  Future<Res<List<AnnounceBrief>>> getAnnounceBriefsNet(int offset, int limit);
}