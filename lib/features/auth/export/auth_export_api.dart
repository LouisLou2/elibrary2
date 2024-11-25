import '../../../common/res_enum.dart';

abstract class AuthExportApi {
  Future<bool> retrieveSetAtAndReactToResult();
  String getCurrentUserAt();
  int getCurrentUserId();
}