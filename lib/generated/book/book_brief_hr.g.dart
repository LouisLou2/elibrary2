// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_brief_hr.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookBriefHRCollection on Isar {
  IsarCollection<BookBriefHR> get bookBriefHRs => this.collection();
}

const BookBriefHRSchema = CollectionSchema(
  name: r'BookBriefHR',
  id: 4363298097526500074,
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
    r'title': PropertySchema(
      id: 11,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _bookBriefHREstimateSize,
  serialize: _bookBriefHRSerialize,
  deserialize: _bookBriefHRDeserialize,
  deserializeProp: _bookBriefHRDeserializeProp,
  idName: r'id',
  indexes: {
    r'order': IndexSchema(
      id: 5897270977454184057,
      name: r'order',
      unique: true,
      replace: true,
      properties: [
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
  getId: _bookBriefHRGetId,
  getLinks: _bookBriefHRGetLinks,
  attach: _bookBriefHRAttach,
  version: '3.1.0+1',
);

int _bookBriefHREstimateSize(
  BookBriefHR object,
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

void _bookBriefHRSerialize(
  BookBriefHR object,
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
  writer.writeString(offsets[11], object.title);
}

BookBriefHR _bookBriefHRDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookBriefHR(
    authorNames: reader.readStringList(offsets[0]) ?? [],
    coverDomColor: reader.readLong(offsets[2]),
    coverMUrl: reader.readString(offsets[3]),
    coverSUrl: reader.readString(offsets[4]),
    hasEbook: reader.readBool(offsets[5]),
    isbn: reader.readString(offsets[6]),
    publisherName: reader.readString(offsets[8]),
    rating: reader.readLong(offsets[9]),
    shortDesc: reader.readString(offsets[10]),
    title: reader.readString(offsets[11]),
  );
  object.id = id;
  object.order = reader.readLong(offsets[7]);
  return object;
}

P _bookBriefHRDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookBriefHRGetId(BookBriefHR object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookBriefHRGetLinks(BookBriefHR object) {
  return [];
}

void _bookBriefHRAttach(
    IsarCollection<dynamic> col, Id id, BookBriefHR object) {
  object.id = id;
}

extension BookBriefHRByIndex on IsarCollection<BookBriefHR> {
  Future<BookBriefHR?> getByOrder(int order) {
    return getByIndex(r'order', [order]);
  }

  BookBriefHR? getByOrderSync(int order) {
    return getByIndexSync(r'order', [order]);
  }

  Future<bool> deleteByOrder(int order) {
    return deleteByIndex(r'order', [order]);
  }

  bool deleteByOrderSync(int order) {
    return deleteByIndexSync(r'order', [order]);
  }

  Future<List<BookBriefHR?>> getAllByOrder(List<int> orderValues) {
    final values = orderValues.map((e) => [e]).toList();
    return getAllByIndex(r'order', values);
  }

  List<BookBriefHR?> getAllByOrderSync(List<int> orderValues) {
    final values = orderValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'order', values);
  }

  Future<int> deleteAllByOrder(List<int> orderValues) {
    final values = orderValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'order', values);
  }

  int deleteAllByOrderSync(List<int> orderValues) {
    final values = orderValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'order', values);
  }

  Future<Id> putByOrder(BookBriefHR object) {
    return putByIndex(r'order', object);
  }

  Id putByOrderSync(BookBriefHR object, {bool saveLinks = true}) {
    return putByIndexSync(r'order', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrder(List<BookBriefHR> objects) {
    return putAllByIndex(r'order', objects);
  }

  List<Id> putAllByOrderSync(List<BookBriefHR> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'order', objects, saveLinks: saveLinks);
  }
}

extension BookBriefHRQueryWhereSort
    on QueryBuilder<BookBriefHR, BookBriefHR, QWhere> {
  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhere> anyOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'order'),
      );
    });
  }
}

extension BookBriefHRQueryWhere
    on QueryBuilder<BookBriefHR, BookBriefHR, QWhereClause> {
  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> orderEqualTo(
      int order) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'order',
        value: [order],
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> orderNotEqualTo(
      int order) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order',
              lower: [],
              upper: [order],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order',
              lower: [order],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order',
              lower: [order],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order',
              lower: [],
              upper: [order],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> orderGreaterThan(
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order',
        lower: [order],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> orderLessThan(
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order',
        lower: [],
        upper: [order],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterWhereClause> orderBetween(
    int lowerOrder,
    int upperOrder, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order',
        lower: [lowerOrder],
        includeLower: includeLower,
        upper: [upperOrder],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookBriefHRQueryFilter
    on QueryBuilder<BookBriefHR, BookBriefHR, QFilterCondition> {
  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNamesStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNamesStr',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      authorNamesStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNamesStr',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverDomColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverDomColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverMUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverMUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverSUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverSUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverSUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverSUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      coverSUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> hasEbookEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasEbook',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnEqualTo(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnGreaterThan(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnLessThan(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnBetween(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnStartsWith(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnEndsWith(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnContains(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnMatches(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> orderEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> orderLessThan(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> orderBetween(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      publisherNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      publisherNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      publisherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      publisherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> ratingEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> ratingLessThan(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> ratingBetween(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      shortDescContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      shortDescMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortDesc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      shortDescIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      shortDescIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleContains(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension BookBriefHRQueryObject
    on QueryBuilder<BookBriefHR, BookBriefHR, QFilterCondition> {}

extension BookBriefHRQueryLinks
    on QueryBuilder<BookBriefHR, BookBriefHR, QFilterCondition> {}

extension BookBriefHRQuerySortBy
    on QueryBuilder<BookBriefHR, BookBriefHR, QSortBy> {
  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByAuthorNamesStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy>
      sortByAuthorNamesStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy>
      sortByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy>
      sortByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookBriefHRQuerySortThenBy
    on QueryBuilder<BookBriefHR, BookBriefHR, QSortThenBy> {
  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByAuthorNamesStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy>
      thenByAuthorNamesStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy>
      thenByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy>
      thenByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookBriefHRQueryWhereDistinct
    on QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> {
  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByAuthorNamesStr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNamesStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverDomColor');
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByCoverMUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByCoverSUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverSUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByPublisherName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisherName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByShortDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortDesc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefHR, BookBriefHR, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension BookBriefHRQueryProperty
    on QueryBuilder<BookBriefHR, BookBriefHR, QQueryProperty> {
  QueryBuilder<BookBriefHR, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookBriefHR, List<String>, QQueryOperations>
      authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<BookBriefHR, String, QQueryOperations> authorNamesStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNamesStr');
    });
  }

  QueryBuilder<BookBriefHR, int, QQueryOperations> coverDomColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverDomColor');
    });
  }

  QueryBuilder<BookBriefHR, String, QQueryOperations> coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<BookBriefHR, String, QQueryOperations> coverSUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverSUrl');
    });
  }

  QueryBuilder<BookBriefHR, bool, QQueryOperations> hasEbookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefHR, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<BookBriefHR, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<BookBriefHR, String, QQueryOperations> publisherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisherName');
    });
  }

  QueryBuilder<BookBriefHR, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<BookBriefHR, String, QQueryOperations> shortDescProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortDesc');
    });
  }

  QueryBuilder<BookBriefHR, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookBriefHR _$BookBriefHRFromJson(Map<String, dynamic> json) => BookBriefHR(
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

Map<String, dynamic> _$BookBriefHRToJson(BookBriefHR instance) =>
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
    };
