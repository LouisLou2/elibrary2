// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_brief_sub_cate.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookBriefSCCollection on Isar {
  IsarCollection<BookBriefSC> get bookBriefSCs => this.collection();
}

const BookBriefSCSchema = CollectionSchema(
  name: r'BookBriefSC',
  id: 7281072171354927654,
  properties: {
    r'authorNames': PropertySchema(
      id: 0,
      name: r'authorNames',
      type: IsarType.stringList,
    ),
    r'authorNamesStr': PropertySchema(
      id: 1,
      name: r'authorNamesStr',
      type: IsarType.string,
    ),
    r'coverDomColor': PropertySchema(
      id: 2,
      name: r'coverDomColor',
      type: IsarType.long,
    ),
    r'coverMUrl': PropertySchema(
      id: 3,
      name: r'coverMUrl',
      type: IsarType.string,
    ),
    r'coverSUrl': PropertySchema(
      id: 4,
      name: r'coverSUrl',
      type: IsarType.string,
    ),
    r'hasEbook': PropertySchema(
      id: 5,
      name: r'hasEbook',
      type: IsarType.bool,
    ),
    r'isbn': PropertySchema(
      id: 6,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 7,
      name: r'order',
      type: IsarType.long,
    ),
    r'publisherName': PropertySchema(
      id: 8,
      name: r'publisherName',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 9,
      name: r'rating',
      type: IsarType.long,
    ),
    r'shortDesc': PropertySchema(
      id: 10,
      name: r'shortDesc',
      type: IsarType.string,
    ),
    r'subCateId': PropertySchema(
      id: 11,
      name: r'subCateId',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 12,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _bookBriefSCEstimateSize,
  serialize: _bookBriefSCSerialize,
  deserialize: _bookBriefSCDeserialize,
  deserializeProp: _bookBriefSCDeserializeProp,
  idName: r'id',
  indexes: {
    r'subCateId_order': IndexSchema(
      id: 869991188624982331,
      name: r'subCateId_order',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'subCateId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'order',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookBriefSCGetId,
  getLinks: _bookBriefSCGetLinks,
  attach: _bookBriefSCAttach,
  version: '3.1.0+1',
);

int _bookBriefSCEstimateSize(
  BookBriefSC object,
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
  bytesCount += 3 + object.authorNamesStr.length * 3;
  bytesCount += 3 + object.coverMUrl.length * 3;
  bytesCount += 3 + object.coverSUrl.length * 3;
  bytesCount += 3 + object.isbn.length * 3;
  bytesCount += 3 + object.publisherName.length * 3;
  bytesCount += 3 + object.shortDesc.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookBriefSCSerialize(
  BookBriefSC object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.authorNames);
  writer.writeString(offsets[1], object.authorNamesStr);
  writer.writeLong(offsets[2], object.coverDomColor);
  writer.writeString(offsets[3], object.coverMUrl);
  writer.writeString(offsets[4], object.coverSUrl);
  writer.writeBool(offsets[5], object.hasEbook);
  writer.writeString(offsets[6], object.isbn);
  writer.writeLong(offsets[7], object.order);
  writer.writeString(offsets[8], object.publisherName);
  writer.writeLong(offsets[9], object.rating);
  writer.writeString(offsets[10], object.shortDesc);
  writer.writeLong(offsets[11], object.subCateId);
  writer.writeString(offsets[12], object.title);
}

BookBriefSC _bookBriefSCDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookBriefSC(
    authorNames: reader.readStringList(offsets[0]) ?? [],
    coverDomColor: reader.readLong(offsets[2]),
    coverMUrl: reader.readString(offsets[3]),
    coverSUrl: reader.readString(offsets[4]),
    hasEbook: reader.readBool(offsets[5]),
    isbn: reader.readString(offsets[6]),
    publisherName: reader.readString(offsets[8]),
    rating: reader.readLong(offsets[9]),
    shortDesc: reader.readString(offsets[10]),
    title: reader.readString(offsets[12]),
  );
  object.id = id;
  object.order = reader.readLong(offsets[7]);
  object.subCateId = reader.readLong(offsets[11]);
  return object;
}

P _bookBriefSCDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookBriefSCGetId(BookBriefSC object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookBriefSCGetLinks(BookBriefSC object) {
  return [];
}

void _bookBriefSCAttach(
    IsarCollection<dynamic> col, Id id, BookBriefSC object) {
  object.id = id;
}

extension BookBriefSCByIndex on IsarCollection<BookBriefSC> {
  Future<BookBriefSC?> getBySubCateIdOrder(int subCateId, int order) {
    return getByIndex(r'subCateId_order', [subCateId, order]);
  }

  BookBriefSC? getBySubCateIdOrderSync(int subCateId, int order) {
    return getByIndexSync(r'subCateId_order', [subCateId, order]);
  }

  Future<bool> deleteBySubCateIdOrder(int subCateId, int order) {
    return deleteByIndex(r'subCateId_order', [subCateId, order]);
  }

  bool deleteBySubCateIdOrderSync(int subCateId, int order) {
    return deleteByIndexSync(r'subCateId_order', [subCateId, order]);
  }

  Future<List<BookBriefSC?>> getAllBySubCateIdOrder(
      List<int> subCateIdValues, List<int> orderValues) {
    final len = subCateIdValues.length;
    assert(orderValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([subCateIdValues[i], orderValues[i]]);
    }

    return getAllByIndex(r'subCateId_order', values);
  }

  List<BookBriefSC?> getAllBySubCateIdOrderSync(
      List<int> subCateIdValues, List<int> orderValues) {
    final len = subCateIdValues.length;
    assert(orderValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([subCateIdValues[i], orderValues[i]]);
    }

    return getAllByIndexSync(r'subCateId_order', values);
  }

  Future<int> deleteAllBySubCateIdOrder(
      List<int> subCateIdValues, List<int> orderValues) {
    final len = subCateIdValues.length;
    assert(orderValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([subCateIdValues[i], orderValues[i]]);
    }

    return deleteAllByIndex(r'subCateId_order', values);
  }

  int deleteAllBySubCateIdOrderSync(
      List<int> subCateIdValues, List<int> orderValues) {
    final len = subCateIdValues.length;
    assert(orderValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([subCateIdValues[i], orderValues[i]]);
    }

    return deleteAllByIndexSync(r'subCateId_order', values);
  }

  Future<Id> putBySubCateIdOrder(BookBriefSC object) {
    return putByIndex(r'subCateId_order', object);
  }

  Id putBySubCateIdOrderSync(BookBriefSC object, {bool saveLinks = true}) {
    return putByIndexSync(r'subCateId_order', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySubCateIdOrder(List<BookBriefSC> objects) {
    return putAllByIndex(r'subCateId_order', objects);
  }

  List<Id> putAllBySubCateIdOrderSync(List<BookBriefSC> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'subCateId_order', objects, saveLinks: saveLinks);
  }
}

extension BookBriefSCQueryWhereSort
    on QueryBuilder<BookBriefSC, BookBriefSC, QWhere> {
  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhere> anySubCateIdOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'subCateId_order'),
      );
    });
  }
}

extension BookBriefSCQueryWhere
    on QueryBuilder<BookBriefSC, BookBriefSC, QWhereClause> {
  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdEqualToAnyOrder(int subCateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'subCateId_order',
        value: [subCateId],
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdNotEqualToAnyOrder(int subCateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [],
              upper: [subCateId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [subCateId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [subCateId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [],
              upper: [subCateId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdGreaterThanAnyOrder(
    int subCateId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'subCateId_order',
        lower: [subCateId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdLessThanAnyOrder(
    int subCateId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'subCateId_order',
        lower: [],
        upper: [subCateId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdBetweenAnyOrder(
    int lowerSubCateId,
    int upperSubCateId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'subCateId_order',
        lower: [lowerSubCateId],
        includeLower: includeLower,
        upper: [upperSubCateId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdOrderEqualTo(int subCateId, int order) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'subCateId_order',
        value: [subCateId, order],
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdEqualToOrderNotEqualTo(int subCateId, int order) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [subCateId],
              upper: [subCateId, order],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [subCateId, order],
              includeLower: false,
              upper: [subCateId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [subCateId, order],
              includeLower: false,
              upper: [subCateId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subCateId_order',
              lower: [subCateId],
              upper: [subCateId, order],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdEqualToOrderGreaterThan(
    int subCateId,
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'subCateId_order',
        lower: [subCateId, order],
        includeLower: include,
        upper: [subCateId],
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdEqualToOrderLessThan(
    int subCateId,
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'subCateId_order',
        lower: [subCateId],
        upper: [subCateId, order],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterWhereClause>
      subCateIdEqualToOrderBetween(
    int subCateId,
    int lowerOrder,
    int upperOrder, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'subCateId_order',
        lower: [subCateId, lowerOrder],
        includeLower: includeLower,
        upper: [subCateId, upperOrder],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookBriefSCQueryFilter
    on QueryBuilder<BookBriefSC, BookBriefSC, QFilterCondition> {
  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorNamesStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNamesStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNamesStr',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      authorNamesStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNamesStr',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverDomColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverDomColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverDomColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverDomColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverDomColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverDomColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverDomColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverDomColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverMUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverMUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverSUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverSUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverSUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverSUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      coverSUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> hasEbookEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasEbook',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnEqualTo(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnGreaterThan(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnLessThan(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnBetween(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnStartsWith(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnEndsWith(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnMatches(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> orderEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> orderLessThan(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> orderBetween(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      publisherNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      publisherNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      publisherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      publisherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> ratingEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> ratingLessThan(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> ratingBetween(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortDesc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortDesc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      shortDescIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      subCateIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subCateId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      subCateIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subCateId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      subCateIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subCateId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      subCateIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subCateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension BookBriefSCQueryObject
    on QueryBuilder<BookBriefSC, BookBriefSC, QFilterCondition> {}

extension BookBriefSCQueryLinks
    on QueryBuilder<BookBriefSC, BookBriefSC, QFilterCondition> {}

extension BookBriefSCQuerySortBy
    on QueryBuilder<BookBriefSC, BookBriefSC, QSortBy> {
  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByAuthorNamesStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy>
      sortByAuthorNamesStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy>
      sortByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy>
      sortByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortBySubCateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateId', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortBySubCateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateId', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookBriefSCQuerySortThenBy
    on QueryBuilder<BookBriefSC, BookBriefSC, QSortThenBy> {
  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByAuthorNamesStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy>
      thenByAuthorNamesStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy>
      thenByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy>
      thenByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenBySubCateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateId', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenBySubCateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateId', Sort.desc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookBriefSCQueryWhereDistinct
    on QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> {
  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByAuthorNamesStr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNamesStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverDomColor');
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByCoverMUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByCoverSUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverSUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByPublisherName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisherName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByShortDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortDesc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctBySubCateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subCateId');
    });
  }

  QueryBuilder<BookBriefSC, BookBriefSC, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension BookBriefSCQueryProperty
    on QueryBuilder<BookBriefSC, BookBriefSC, QQueryProperty> {
  QueryBuilder<BookBriefSC, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookBriefSC, List<String>, QQueryOperations>
      authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<BookBriefSC, String, QQueryOperations> authorNamesStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNamesStr');
    });
  }

  QueryBuilder<BookBriefSC, int, QQueryOperations> coverDomColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverDomColor');
    });
  }

  QueryBuilder<BookBriefSC, String, QQueryOperations> coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<BookBriefSC, String, QQueryOperations> coverSUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverSUrl');
    });
  }

  QueryBuilder<BookBriefSC, bool, QQueryOperations> hasEbookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefSC, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<BookBriefSC, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<BookBriefSC, String, QQueryOperations> publisherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisherName');
    });
  }

  QueryBuilder<BookBriefSC, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<BookBriefSC, String, QQueryOperations> shortDescProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortDesc');
    });
  }

  QueryBuilder<BookBriefSC, int, QQueryOperations> subCateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subCateId');
    });
  }

  QueryBuilder<BookBriefSC, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookBriefSC _$BookBriefSCFromJson(Map<String, dynamic> json) => BookBriefSC(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      shortDesc: json['short_desc'] as String,
      authorNames: (json['author_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publisherName: json['publisher_name'] as String,
      coverSUrl: json['cover_s_url'] as String,
      coverMUrl: json['cover_m_url'] as String,
      coverDomColor: (json['cover_dom_color'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      hasEbook: json['has_ebook'] as bool,
    );

Map<String, dynamic> _$BookBriefSCToJson(BookBriefSC instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'short_desc': instance.shortDesc,
      'author_names': instance.authorNames,
      'publisher_name': instance.publisherName,
      'cover_s_url': instance.coverSUrl,
      'cover_m_url': instance.coverMUrl,
      'cover_dom_color': instance.coverDomColor,
      'rating': instance.rating,
      'has_ebook': instance.hasEbook,
      'order': instance.order,
      'subCateId': instance.subCateId,
    };
