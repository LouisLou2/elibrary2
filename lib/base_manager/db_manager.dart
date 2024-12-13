import 'package:elibapp/base_manager/path_manager.dart';
import 'package:elibapp/entity/book/book_brief_from_author.dart';
import 'package:elibapp/entity/book/book_brief_hr.dart';
import 'package:elibapp/entity/book/book_brief_reco.dart';
import 'package:elibapp/entity/book/book_brief_tb.dart';
import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/entity/book/book_info.dart';
import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:elibapp/entity/book/simple_user_owned_book.dart';
import 'package:elibapp/entity/reserve_borrow/reserve_borrow_brief.dart';
import 'package:isar/isar.dart';

import '../entity/user/user_auth_params.dart';


/*静态*/
class DBManager{
  static late final Isar _db;
  static Isar get db=>_db;

  static init() async {
    _db= await Isar.open(
      [
        UserAuthParamsSchema,
        BookBriefRecoSchema,
        BookBriefTBSchema,
        BookBriefHRSchema,
        BookViewingHistorySchema,
        BookInfoSchema,
        BookBriefFromAuthorSchema,
        SimpleUserOwnedBookSchema,
        BookCateSchema,
        ReserveBorrowBriefSchema,
      ],
      directory: PathManager.dbDir.path,
      inspector: true,
    );
  }
}