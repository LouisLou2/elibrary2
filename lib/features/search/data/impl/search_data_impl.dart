import 'package:elibapp/common/search_type.dart';
import 'package:elibapp/entity/search/searched_author.dart';

import 'package:elibapp/entity/search/searched_book.dart';

import 'package:elibapp/entity/search/searched_publisher.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../search_data.dart';

class SearchDataImpl extends SearchData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<SearchedAuthor>>> searchInAuthors(String keyword,int pageNum, int pageSize) async {
    Res<Resp> res = await _search(keyword, SearchInType.authors,pageNum,pageSize);
    if (!res.isSuccess) return res.to<List<SearchedAuthor>>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      List<SearchedAuthor> records = (resp.data as List<dynamic>).map((e) => SearchedAuthor.fromJson(e)).toList();
      return Res.successWithData(records);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  Future<Res<List<SearchedBook>>> searchInBooks(String keyword,int pageNum, int pageSize) async {
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp> res = await _search(keyword, SearchInType.books,pageNum,pageSize);
    if (!res.isSuccess) return res.to<List<SearchedBook>>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      List<SearchedBook> records = (resp.data as List<dynamic>).map((e) => SearchedBook.fromJson(e)).toList();
      return Res.successWithData(records);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  Future<Res<List<SearchedPublisher>>> searchInPublishers(String keyword,int pageNum, int pageSize) async {
    Res<Resp> res = await _search(keyword, SearchInType.publishers,pageNum,pageSize);
    if (!res.isSuccess) return res.to<List<SearchedPublisher>>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      List<SearchedPublisher> records = (resp.data as List<dynamic>).map((e) => SearchedPublisher.fromJson(e)).toList();
      return Res.successWithData(records);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  Future<Res<Resp>> _search(String keyword, SearchInType type, int pageNum, int pageSize) async {
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.search.keyword,
      method: HttpMethod.POST,
      data: {
        'keyword': keyword,
        'type': type.value,
        'pageNum': pageNum,
        'pageSize': pageSize,
      }
    );
    return res;
  }

}