// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_brief_reco.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookBriefRecoCollection on Isar {
  IsarCollection<BookBriefReco> get bookBriefRecos => this.collection();
}

const BookBriefRecoSchema = CollectionSchema(
  name: r'BookBriefReco',
  id: -5848685747334466622,
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
    r'coverSUrl': PropertySchema(
      id: 2,
      name: r'coverSUrl',
      type: IsarType.string,
    ),
    r'hasEbook': PropertySchema(
      id: 3,
      name: r'hasEbook',
      type: IsarType.bool,
    ),
    r'isbn': PropertySchema(
      id: 4,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 5,
      name: r'order',
      type: IsarType.long,
    ),
    r'publisherName': PropertySchema(
      id: 6,
      name: r'publisherName',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 7,
      name: r'rating',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 9,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _bookBriefRecoEstimateSize,
  serialize: _bookBriefRecoSerialize,
  deserialize: _bookBriefRecoDeserialize,
  deserializeProp: _bookBriefRecoDeserializeProp,
  idName: r'id',
  indexes: {
    r'order_userId': IndexSchema(
      id: 8734891273568143071,
      name: r'order_userId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'order',
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
  getId: _bookBriefRecoGetId,
  getLinks: _bookBriefRecoGetLinks,
  attach: _bookBriefRecoAttach,
  version: '3.1.0+1',
);

int _bookBriefRecoEstimateSize(
  BookBriefReco object,
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
  bytesCount += 3 + object.coverSUrl.length * 3;
  bytesCount += 3 + object.isbn.length * 3;
  bytesCount += 3 + object.publisherName.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookBriefRecoSerialize(
  BookBriefReco object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.authorNames);
  writer.writeString(offsets[1], object.coverMUrl);
  writer.writeString(offsets[2], object.coverSUrl);
  writer.writeBool(offsets[3], object.hasEbook);
  writer.writeString(offsets[4], object.isbn);
  writer.writeLong(offsets[5], object.order);
  writer.writeString(offsets[6], object.publisherName);
  writer.writeLong(offsets[7], object.rating);
  writer.writeString(offsets[8], object.title);
  writer.writeLong(offsets[9], object.userId);
}

BookBriefReco _bookBriefRecoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookBriefReco(
    authorNames: reader.readStringList(offsets[0]) ?? [],
    coverMUrl: reader.readString(offsets[1]),
    coverSUrl: reader.readString(offsets[2]),
    hasEbook: reader.readBool(offsets[3]),
    isbn: reader.readString(offsets[4]),
    publisherName: reader.readString(offsets[6]),
    rating: reader.readLong(offsets[7]),
    title: reader.readString(offsets[8]),
  );
  object.id = id;
  object.order = reader.readLong(offsets[5]);
  object.userId = reader.readLong(offsets[9]);
  return object;
}

P _bookBriefRecoDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookBriefRecoGetId(BookBriefReco object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookBriefRecoGetLinks(BookBriefReco object) {
  return [];
}

void _bookBriefRecoAttach(
    IsarCollection<dynamic> col, Id id, BookBriefReco object) {
  object.id = id;
}

extension BookBriefRecoByIndex on IsarCollection<BookBriefReco> {
  Future<BookBriefReco?> getByOrderUserId(int order, int userId) {
    return getByIndex(r'order_userId', [order, userId]);
  }

  BookBriefReco? getByOrderUserIdSync(int order, int userId) {
    return getByIndexSync(r'order_userId', [order, userId]);
  }

  Future<bool> deleteByOrderUserId(int order, int userId) {
    return deleteByIndex(r'order_userId', [order, userId]);
  }

  bool deleteByOrderUserIdSync(int order, int userId) {
    return deleteByIndexSync(r'order_userId', [order, userId]);
  }

  Future<List<BookBriefReco?>> getAllByOrderUserId(
      List<int> orderValues, List<int> userIdValues) {
    final len = orderValues.length;
    assert(userIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], userIdValues[i]]);
    }

    return getAllByIndex(r'order_userId', values);
  }

  List<BookBriefReco?> getAllByOrderUserIdSync(
      List<int> orderValues, List<int> userIdValues) {
    final len = orderValues.length;
    assert(userIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], userIdValues[i]]);
    }

    return getAllByIndexSync(r'order_userId', values);
  }

  Future<int> deleteAllByOrderUserId(
      List<int> orderValues, List<int> userIdValues) {
    final len = orderValues.length;
    assert(userIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], userIdValues[i]]);
    }

    return deleteAllByIndex(r'order_userId', values);
  }

  int deleteAllByOrderUserIdSync(
      List<int> orderValues, List<int> userIdValues) {
    final len = orderValues.length;
    assert(userIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], userIdValues[i]]);
    }

    return deleteAllByIndexSync(r'order_userId', values);
  }

  Future<Id> putByOrderUserId(BookBriefReco object) {
    return putByIndex(r'order_userId', object);
  }

  Id putByOrderUserIdSync(BookBriefReco object, {bool saveLinks = true}) {
    return putByIndexSync(r'order_userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrderUserId(List<BookBriefReco> objects) {
    return putAllByIndex(r'order_userId', objects);
  }

  List<Id> putAllByOrderUserIdSync(List<BookBriefReco> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'order_userId', objects, saveLinks: saveLinks);
  }
}

extension BookBriefRecoQueryWhereSort
    on QueryBuilder<BookBriefReco, BookBriefReco, QWhere> {
  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhere> anyOrderUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'order_userId'),
      );
    });
  }
}

extension BookBriefRecoQueryWhere
    on QueryBuilder<BookBriefReco, BookBriefReco, QWhereClause> {
  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderEqualToAnyUserId(int order) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'order_userId',
        value: [order],
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderNotEqualToAnyUserId(int order) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [],
              upper: [order],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [order],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [order],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [],
              upper: [order],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderGreaterThanAnyUserId(
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_userId',
        lower: [order],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderLessThanAnyUserId(
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_userId',
        lower: [],
        upper: [order],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderBetweenAnyUserId(
    int lowerOrder,
    int upperOrder, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_userId',
        lower: [lowerOrder],
        includeLower: includeLower,
        upper: [upperOrder],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderUserIdEqualTo(int order, int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'order_userId',
        value: [order, userId],
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderEqualToUserIdNotEqualTo(int order, int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [order],
              upper: [order, userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [order, userId],
              includeLower: false,
              upper: [order],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [order, userId],
              includeLower: false,
              upper: [order],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_userId',
              lower: [order],
              upper: [order, userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderEqualToUserIdGreaterThan(
    int order,
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_userId',
        lower: [order, userId],
        includeLower: include,
        upper: [order],
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderEqualToUserIdLessThan(
    int order,
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_userId',
        lower: [order],
        upper: [order, userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterWhereClause>
      orderEqualToUserIdBetween(
    int order,
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_userId',
        lower: [order, lowerUserId],
        includeLower: includeLower,
        upper: [order, upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookBriefRecoQueryFilter
    on QueryBuilder<BookBriefReco, BookBriefReco, QFilterCondition> {
  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverMUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverMUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverSUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverSUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      coverSUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      hasEbookEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasEbook',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition> isbnEqualTo(
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition> isbnBetween(
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition> isbnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      orderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      orderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      publisherNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      publisherNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      publisherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      publisherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      ratingEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      ratingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      ratingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      ratingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterFilterCondition>
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
}

extension BookBriefRecoQueryObject
    on QueryBuilder<BookBriefReco, BookBriefReco, QFilterCondition> {}

extension BookBriefRecoQueryLinks
    on QueryBuilder<BookBriefReco, BookBriefReco, QFilterCondition> {}

extension BookBriefRecoQuerySortBy
    on QueryBuilder<BookBriefReco, BookBriefReco, QSortBy> {
  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      sortByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      sortByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      sortByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      sortByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BookBriefRecoQuerySortThenBy
    on QueryBuilder<BookBriefReco, BookBriefReco, QSortThenBy> {
  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      thenByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      thenByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      thenByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy>
      thenByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BookBriefRecoQueryWhereDistinct
    on QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> {
  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct>
      distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByCoverMUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByCoverSUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverSUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByPublisherName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisherName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefReco, BookBriefReco, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension BookBriefRecoQueryProperty
    on QueryBuilder<BookBriefReco, BookBriefReco, QQueryProperty> {
  QueryBuilder<BookBriefReco, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookBriefReco, List<String>, QQueryOperations>
      authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<BookBriefReco, String, QQueryOperations> coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<BookBriefReco, String, QQueryOperations> coverSUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverSUrl');
    });
  }

  QueryBuilder<BookBriefReco, bool, QQueryOperations> hasEbookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefReco, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<BookBriefReco, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<BookBriefReco, String, QQueryOperations>
      publisherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisherName');
    });
  }

  QueryBuilder<BookBriefReco, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<BookBriefReco, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BookBriefReco, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookBriefReco _$BookBriefRecoFromJson(Map<String, dynamic> json) =>
    BookBriefReco(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      authorNames: (json['author_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publisherName: json['publisher_name'] as String,
      coverSUrl: json['cover_s_url'] as String,
      coverMUrl: json['cover_m_url'] as String,
      rating: (json['rating'] as num).toInt(),
      hasEbook: json['has_ebook'] as bool,
    );

Map<String, dynamic> _$BookBriefRecoToJson(BookBriefReco instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'order': instance.order,
      'isbn': instance.isbn,
      'title': instance.title,
      'author_names': instance.authorNames,
      'publisher_name': instance.publisherName,
      'cover_s_url': instance.coverSUrl,
      'cover_m_url': instance.coverMUrl,
      'rating': instance.rating,
      'has_ebook': instance.hasEbook,
    };
