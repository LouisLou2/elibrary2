import 'package:elibapp/entity/announ/announcement.dart';

abstract class AnnounContentRepo{
  Future<bool> retrieveAnnouncement(int announcementId);
  Announcement? get currentAnnouncement;
}