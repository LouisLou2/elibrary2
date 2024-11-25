// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_viewing_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookViewingHistoryCollection on Isar {
  IsarCollection<BookViewingHistory> get bookViewingHistorys =>
      this.collection();
}

const BookViewingHistorySchema = CollectionSchema(
  name: r'BookViewingHistory',
  id: 8991012839026936791,
  properties: {
    r'authorNames': PropertySchema(
      id: 0,
      name: r'authorNames',
      type: IsarType.stringList,
    ),
    r'coverMUrl': PropertySchema(
      id: 1,
      name: r'coverMUrl',
      type: IsarType.string,
    ),
    r'isbn': PropertySchema(
      id: 2,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'publisherName': PropertySchema(
      id: 3,
      name: r'publisherName',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.long,
    ),
    r'viewingTime': PropertySchema(
      id: 6,
      name: r'viewingTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bookViewingHistoryEstimateSize,
  serialize: _bookViewingHistorySerialize,
  deserialize: _bookViewingHistoryDeserialize,
  deserializeProp: _bookViewingHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId_isbn': IndexSchema(
      id: -6007559011540404201,
      name: r'userId_isbn',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'isbn',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'viewingTime_userId': IndexSchema(
      id: -2422404039214617324,
      name: r'viewingTime_userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'viewingTime',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookViewingHistoryGetId,
  getLinks: _bookViewingHistoryGetLinks,
  attach: _bookViewingHistoryAttach,
  version: '3.1.0+1',
);

int _bookViewingHistoryEstimateSize(
  BookViewingHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.authorNames.length * 3;
  {
    for (var i = 0; i < object.authorNames.length; i++) {
      final value = object.authorNames[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.coverMUrl.length * 3;
  bytesCount += 3 + object.isbn.length * 3;
  bytesCount += 3 + object.publisherName.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookViewingHistorySerialize(
  BookViewingHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.authorNames);
  writer.writeString(offsets[1], object.coverMUrl);
  writer.writeString(offsets[2], object.isbn);
  writer.writeString(offsets[3], object.publisherName);
  writer.writeString(offsets[4], object.title);
  writer.writeLong(offsets[5], object.userId);
  writer.writeDateTime(offsets[6], object.viewingTime);
}

BookViewingHistory _bookViewingHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookViewingHistory(
    authorNames: reader.readStringList(offsets[0]) ?? [],
    coverMUrl: reader.readString(offsets[1]),
    isbn: reader.readString(offsets[2]),
    publisherName: reader.readString(offsets[3]),
    title: reader.readString(offsets[4]),
    userId: reader.readLong(offsets[5]),
    viewingTime: reader.readDateTime(offsets[6]),
  );
  object.id = id;
  return object;
}

P _bookViewingHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookViewingHistoryGetId(BookViewingHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookViewingHistoryGetLinks(
    BookViewingHistory object) {
  return [];
}

void _bookViewingHistoryAttach(
    IsarCollection<dynamic> col, Id id, BookViewingHistory object) {
  object.id = id;
}

extension BookViewingHistoryByIndex on IsarCollection<BookViewingHistory> {
  Future<BookViewingHistory?> getByUserIdIsbn(int userId, String isbn) {
    return getByIndex(r'userId_isbn', [userId, isbn]);
  }

  BookViewingHistory? getByUserIdIsbnSync(int userId, String isbn) {
    return getByIndexSync(r'userId_isbn', [userId, isbn]);
  }

  Future<bool> deleteByUserIdIsbn(int userId, String isbn) {
    return deleteByIndex(r'userId_isbn', [userId, isbn]);
  }

  bool deleteByUserIdIsbnSync(int userId, String isbn) {
    return deleteByIndexSync(r'userId_isbn', [userId, isbn]);
  }

  Future<List<BookViewingHistory?>> getAllByUserIdIsbn(
      List<int> userIdValues, List<String> isbnValues) {
    final len = userIdValues.length;
    assert(
        isbnValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], isbnValues[i]]);
    }

    return getAllByIndex(r'userId_isbn', values);
  }

  List<BookViewingHistory?> getAllByUserIdIsbnSync(
      List<int> userIdValues, List<String> isbnValues) {
    final len = userIdValues.length;
    assert(
        isbnValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], isbnValues[i]]);
    }

    return getAllByIndexSync(r'userId_isbn', values);
  }

  Future<int> deleteAllByUserIdIsbn(
      List<int> userIdValues, List<String> isbnValues) {
    final len = userIdValues.length;
    assert(
        isbnValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], isbnValues[i]]);
    }

    return deleteAllByIndex(r'userId_isbn', values);
  }

  int deleteAllByUserIdIsbnSync(
      List<int> userIdValues, List<String> isbnValues) {
    final len = userIdValues.length;
    assert(
        isbnValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], isbnValues[i]]);
    }

    return deleteAllByIndexSync(r'userId_isbn', values);
  }

  Future<Id> putByUserIdIsbn(BookViewingHistory object) {
    return putByIndex(r'userId_isbn', object);
  }

  Id putByUserIdIsbnSync(BookViewingHistory object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId_isbn', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserIdIsbn(List<BookViewingHistory> objects) {
    return putAllByIndex(r'userId_isbn', objects);
  }

  List<Id> putAllByUserIdIsbnSync(List<BookViewingHistory> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId_isbn', objects, saveLinks: saveLinks);
  }
}

extension BookViewingHistoryQueryWhereSort
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QWhere> {
  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhere>
      anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhere>
      anyViewingTimeUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'viewingTime_userId'),
      );
    });
  }
}

extension BookViewingHistoryQueryWhere
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QWhereClause> {
  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdEqualToAnyIsbn(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_isbn',
        value: [userId],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdNotEqualToAnyIsbn(int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdGreaterThanAnyIsbn(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_isbn',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdLessThanAnyIsbn(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_isbn',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdBetweenAnyIsbn(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_isbn',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdIsbnEqualTo(int userId, String isbn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_isbn',
        value: [userId, isbn],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdEqualToIsbnNotEqualTo(int userId, String isbn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [userId],
              upper: [userId, isbn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [userId, isbn],
              includeLower: false,
              upper: [userId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [userId, isbn],
              includeLower: false,
              upper: [userId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_isbn',
              lower: [userId],
              upper: [userId, isbn],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdNotEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdGreaterThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdLessThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      userIdBetween(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeEqualToAnyUserId(DateTime viewingTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'viewingTime_userId',
        value: [viewingTime],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeNotEqualToAnyUserId(DateTime viewingTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [],
              upper: [viewingTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [viewingTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [viewingTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [],
              upper: [viewingTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeGreaterThanAnyUserId(
    DateTime viewingTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'viewingTime_userId',
        lower: [viewingTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeLessThanAnyUserId(
    DateTime viewingTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'viewingTime_userId',
        lower: [],
        upper: [viewingTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeBetweenAnyUserId(
    DateTime lowerViewingTime,
    DateTime upperViewingTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'viewingTime_userId',
        lower: [lowerViewingTime],
        includeLower: includeLower,
        upper: [upperViewingTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeUserIdEqualTo(DateTime viewingTime, int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'viewingTime_userId',
        value: [viewingTime, userId],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeEqualToUserIdNotEqualTo(DateTime viewingTime, int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [viewingTime],
              upper: [viewingTime, userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [viewingTime, userId],
              includeLower: false,
              upper: [viewingTime],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [viewingTime, userId],
              includeLower: false,
              upper: [viewingTime],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'viewingTime_userId',
              lower: [viewingTime],
              upper: [viewingTime, userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeEqualToUserIdGreaterThan(
    DateTime viewingTime,
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'viewingTime_userId',
        lower: [viewingTime, userId],
        includeLower: include,
        upper: [viewingTime],
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeEqualToUserIdLessThan(
    DateTime viewingTime,
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'viewingTime_userId',
        lower: [viewingTime],
        upper: [viewingTime, userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterWhereClause>
      viewingTimeEqualToUserIdBetween(
    DateTime viewingTime,
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'viewingTime_userId',
        lower: [viewingTime, lowerUserId],
        includeLower: includeLower,
        upper: [viewingTime, upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookViewingHistoryQueryFilter
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QFilterCondition> {
  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      authorNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverMUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isbn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publisherName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      publisherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      viewingTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      viewingTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viewingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      viewingTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viewingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterFilterCondition>
      viewingTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viewingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookViewingHistoryQueryObject
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QFilterCondition> {}

extension BookViewingHistoryQueryLinks
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QFilterCondition> {}

extension BookViewingHistoryQuerySortBy
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QSortBy> {
  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByViewingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingTime', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      sortByViewingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingTime', Sort.desc);
    });
  }
}

extension BookViewingHistoryQuerySortThenBy
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QSortThenBy> {
  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByViewingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingTime', Sort.asc);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QAfterSortBy>
      thenByViewingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingTime', Sort.desc);
    });
  }
}

extension BookViewingHistoryQueryWhereDistinct
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct> {
  QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct>
      distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct>
      distinctByCoverMUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct>
      distinctByIsbn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct>
      distinctByPublisherName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisherName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<BookViewingHistory, BookViewingHistory, QDistinct>
      distinctByViewingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewingTime');
    });
  }
}

extension BookViewingHistoryQueryProperty
    on QueryBuilder<BookViewingHistory, BookViewingHistory, QQueryProperty> {
  QueryBuilder<BookViewingHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookViewingHistory, List<String>, QQueryOperations>
      authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<BookViewingHistory, String, QQueryOperations>
      coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<BookViewingHistory, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<BookViewingHistory, String, QQueryOperations>
      publisherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisherName');
    });
  }

  QueryBuilder<BookViewingHistory, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BookViewingHistory, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<BookViewingHistory, DateTime, QQueryOperations>
      viewingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewingTime');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookViewingHistory _$BookViewingHistoryFromJson(Map<String, dynamic> json) =>
    BookViewingHistory(
      userId: (json['user_id'] as num).toInt(),
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      authorNames: (json['author_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publisherName: json['publisher_name'] as String,
      viewingTime: DateTime.parse(json['viewing_time'] as String),
      coverMUrl: json['cover_m_url'] as String,
    );

Map<String, dynamic> _$BookViewingHistoryToJson(BookViewingHistory instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'isbn': instance.isbn,
      'title': instance.title,
      'author_names': instance.authorNames,
      'publisher_name': instance.publisherName,
      'viewing_time': instance.viewingTime.toIso8601String(),
      'cover_m_url': instance.coverMUrl,
    };
