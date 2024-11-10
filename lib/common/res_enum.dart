import 'package:toastification/toastification.dart';

enum Situation {
  Success,
  Error,
  Warning,
}

enum ResCodeEnum {
  // 客户端内部
  UserCancel(-1, "用户取消", ToastificationType.error),
  ConnectionError(-2, "网络连接错误", ToastificationType.error),
  ConnectionTimeout(-3, "网络连接超时", ToastificationType.error),
  UnknownNetworkError(-4, "未知网络错误", ToastificationType.error),
  DbError(-5, "数据库错误", ToastificationType.error),
  ServerError(-6, "服务器错误", ToastificationType.error),

  Undefined(-999, "未定义错误", ToastificationType.error),

  // Success
  Success(0, "success", ToastificationType.success),

  // General Error
  InvalidParam(1, "invalid param", ToastificationType.error),
  InvalidRequest(2, "invalid request", ToastificationType.error),

  // Auth
  UserNotExist(101, "user not exist", ToastificationType.error),
  PasswordIncorrect(102, "password not correct", ToastificationType.error),
  PasswordUnset(103, "password unset", ToastificationType.error),
  VerifyCodeIncorrect(104, "verify code incorrect or expired", ToastificationType.error),

  // Bookshelf
  ShelfIsFull(201, "shelf has reached its max capacity", ToastificationType.warning),

  // BookMark
  BookCollectionIsFull(301, "book collection has reached its max capacity", ToastificationType.warning),
  AlreadyCollected(302, "book already collected", ToastificationType.warning),
  BookNotCollected(303, "book not collected", ToastificationType.warning),

  // BookReserve
  ReserveNotAvailable(401, "该书籍暂无剩余副本", ToastificationType.warning),
  TooMuchReservedOrUnreturned(402, "too much reserved or unreturned books", ToastificationType.warning),
  BeenRestricted(403, "has been restricted", ToastificationType.warning),
  TooMuchOverdue(404, "too much overdue books", ToastificationType.warning),
  ReserveFailed(405, "失败，预约人数过多，系统繁忙", ToastificationType.warning),

  // Other
  CancelWillCauseOverdue(501, "取消预约将导致超时次数+1", ToastificationType.warning);

  final int code;
  final String msg;
  final ToastificationType toastType;  // 新增字段

  const ResCodeEnum(this.code, this.msg, this.toastType);

  bool get isSuccess => code == Success.code;

  static ResCodeEnum fromCode(int code) {
    for (var value in ResCodeEnum.values) {
      if (value.code == code) {
        return value;
      }
    }
    throw ArgumentError('Invalid code: $code');
  }

  // 获取 ToastificationType
  ToastificationType getToastType() {
    return toastType;
  }
}