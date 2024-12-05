import 'package:elibapp/entity/announ/announce_brief.dart';

abstract class AnnounRepo{
  Future<bool> refreshAnnounNet();
  Future<bool> loadMoreNet();

  List<AnnounceBrief> get currentAnnounList;
}