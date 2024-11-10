import 'package:elibapp/base_manager/path_manager.dart';
import 'package:elibapp/entity/user_auth_params.dart';
import 'package:isar/isar.dart';

/*静态*/
class DBManager{
  static late final Isar _db;
  static Isar get db=>_db;

  static init() async {
    _db= await Isar.open(
      [
        UserAuthParamsSchema,
      ],
      directory: PathManager.dbDir.path,
      inspector: true,
    );
  }
}