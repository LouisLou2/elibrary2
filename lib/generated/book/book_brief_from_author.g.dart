// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_brief_from_author.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookBriefFromAuthorCollection on Isar {
  IsarCollection<BookBriefFromAuthor> get bookBriefFromAuthors =>
      this.collection();
}

const BookBriefFromAuthorSchema = CollectionSchema(
  name: r'BookBriefFromAuthor',
  id: 8719444255457001048,
  properties: {
    r'authorId': PropertySchema(
      id: 0,
      name: r'authorId',
      type: IsarType.long,
    ),
    r'authorNames': PropertySchema(
      id: 1,
      name: r'authorNames',
      type: IsarType.stringList,
    ),
    r'authorNamesStr': PropertySchema(
      id: 2,
      name: r'authorNamesStr',
      type: IsarType.string,
    ),
    r'coverDomColor': PropertySchema(
      id: 3,
      name: r'coverDomColor',
      type: IsarType.long,
    ),
    r'coverMUrl': PropertySchema(
      id: 4,
      name: r'coverMUrl',
      type: IsarType.string,
    ),
    r'coverSUrl': PropertySchema(
      id: 5,
      name: r'coverSUrl',
      type: IsarType.string,
    ),
    r'hasEbook': PropertySchema(
      id: 6,
      name: r'hasEbook',
      type: IsarType.bool,
    ),
    r'isbn': PropertySchema(
      id: 7,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 8,
      name: r'order',
      type: IsarType.long,
    ),
    r'publisherName': PropertySchema(
      id: 9,
      name: r'publisherName',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 10,
      name: r'rating',
      type: IsarType.long,
    ),
    r'shortDesc': PropertySchema(
      id: 11,
      name: r'shortDesc',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 12,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _bookBriefFromAuthorEstimateSize,
  serialize: _bookBriefFromAuthorSerialize,
  deserialize: _bookBriefFromAuthorDeserialize,
  deserializeProp: _bookBriefFromAuthorDeserializeProp,
  idName: r'id',
  indexes: {
    r'authorId': IndexSchema(
      id: 8112877077417469315,
      name: r'authorId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'authorId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'order_authorId': IndexSchema(
      id: -8787820389413213247,
      name: r'order_authorId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'order',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'authorId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookBriefFromAuthorGetId,
  getLinks: _bookBriefFromAuthorGetLinks,
  attach: _bookBriefFromAuthorAttach,
  version: '3.1.0+1',
);

int _bookBriefFromAuthorEstimateSize(
  BookBriefFromAuthor object,
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

void _bookBriefFromAuthorSerialize(
  BookBriefFromAuthor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.authorId);
  writer.writeStringList(offsets[1], object.authorNames);
  writer.writeString(offsets[2], object.authorNamesStr);
  writer.writeLong(offsets[3], object.coverDomColor);
  writer.writeString(offsets[4], object.coverMUrl);
  writer.writeString(offsets[5], object.coverSUrl);
  writer.writeBool(offsets[6], object.hasEbook);
  writer.writeString(offsets[7], object.isbn);
  writer.writeLong(offsets[8], object.order);
  writer.writeString(offsets[9], object.publisherName);
  writer.writeLong(offsets[10], object.rating);
  writer.writeString(offsets[11], object.shortDesc);
  writer.writeString(offsets[12], object.title);
}

BookBriefFromAuthor _bookBriefFromAuthorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookBriefFromAuthor(
    authorId: reader.readLongOrNull(offsets[0]) ?? -1,
    authorNames: reader.readStringList(offsets[1]) ?? [],
    coverDomColor: reader.readLong(offsets[3]),
    coverMUrl: reader.readString(offsets[4]),
    coverSUrl: reader.readString(offsets[5]),
    hasEbook: reader.readBool(offsets[6]),
    isbn: reader.readString(offsets[7]),
    order: reader.readLongOrNull(offsets[8]) ?? -1,
    publisherName: reader.readString(offsets[9]),
    rating: reader.readLong(offsets[10]),
    shortDesc: reader.readString(offsets[11]),
    title: reader.readString(offsets[12]),
  );
  object.id = id;
  return object;
}

P _bookBriefFromAuthorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? -1) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset) ?? -1) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookBriefFromAuthorGetId(BookBriefFromAuthor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookBriefFromAuthorGetLinks(
    BookBriefFromAuthor object) {
  return [];
}

void _bookBriefFromAuthorAttach(
    IsarCollection<dynamic> col, Id id, BookBriefFromAuthor object) {
  object.id = id;
}

extension BookBriefFromAuthorByIndex on IsarCollection<BookBriefFromAuthor> {
  Future<BookBriefFromAuthor?> getByOrderAuthorId(int order, int authorId) {
    return getByIndex(r'order_authorId', [order, authorId]);
  }

  BookBriefFromAuthor? getByOrderAuthorIdSync(int order, int authorId) {
    return getByIndexSync(r'order_authorId', [order, authorId]);
  }

  Future<bool> deleteByOrderAuthorId(int order, int authorId) {
    return deleteByIndex(r'order_authorId', [order, authorId]);
  }

  bool deleteByOrderAuthorIdSync(int order, int authorId) {
    return deleteByIndexSync(r'order_authorId', [order, authorId]);
  }

  Future<List<BookBriefFromAuthor?>> getAllByOrderAuthorId(
      List<int> orderValues, List<int> authorIdValues) {
    final len = orderValues.length;
    assert(authorIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], authorIdValues[i]]);
    }

    return getAllByIndex(r'order_authorId', values);
  }

  List<BookBriefFromAuthor?> getAllByOrderAuthorIdSync(
      List<int> orderValues, List<int> authorIdValues) {
    final len = orderValues.length;
    assert(authorIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], authorIdValues[i]]);
    }

    return getAllByIndexSync(r'order_authorId', values);
  }

  Future<int> deleteAllByOrderAuthorId(
      List<int> orderValues, List<int> authorIdValues) {
    final len = orderValues.length;
    assert(authorIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], authorIdValues[i]]);
    }

    return deleteAllByIndex(r'order_authorId', values);
  }

  int deleteAllByOrderAuthorIdSync(
      List<int> orderValues, List<int> authorIdValues) {
    final len = orderValues.length;
    assert(authorIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([orderValues[i], authorIdValues[i]]);
    }

    return deleteAllByIndexSync(r'order_authorId', values);
  }

  Future<Id> putByOrderAuthorId(BookBriefFromAuthor object) {
    return putByIndex(r'order_authorId', object);
  }

  Id putByOrderAuthorIdSync(BookBriefFromAuthor object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'order_authorId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrderAuthorId(List<BookBriefFromAuthor> objects) {
    return putAllByIndex(r'order_authorId', objects);
  }

  List<Id> putAllByOrderAuthorIdSync(List<BookBriefFromAuthor> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'order_authorId', objects, saveLinks: saveLinks);
  }
}

extension BookBriefFromAuthorQueryWhereSort
    on QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QWhere> {
  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhere>
      anyAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'authorId'),
      );
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhere>
      anyOrderAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'order_authorId'),
      );
    });
  }
}

extension BookBriefFromAuthorQueryWhere
    on QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QWhereClause> {
  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      authorIdEqualTo(int authorId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'authorId',
        value: [authorId],
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      authorIdNotEqualTo(int authorId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [],
              upper: [authorId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [authorId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [authorId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [],
              upper: [authorId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      authorIdGreaterThan(
    int authorId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'authorId',
        lower: [authorId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      authorIdLessThan(
    int authorId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'authorId',
        lower: [],
        upper: [authorId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      authorIdBetween(
    int lowerAuthorId,
    int upperAuthorId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'authorId',
        lower: [lowerAuthorId],
        includeLower: includeLower,
        upper: [upperAuthorId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderEqualToAnyAuthorId(int order) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'order_authorId',
        value: [order],
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderNotEqualToAnyAuthorId(int order) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [],
              upper: [order],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [order],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [order],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [],
              upper: [order],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderGreaterThanAnyAuthorId(
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_authorId',
        lower: [order],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderLessThanAnyAuthorId(
    int order, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_authorId',
        lower: [],
        upper: [order],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderBetweenAnyAuthorId(
    int lowerOrder,
    int upperOrder, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_authorId',
        lower: [lowerOrder],
        includeLower: includeLower,
        upper: [upperOrder],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderAuthorIdEqualTo(int order, int authorId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'order_authorId',
        value: [order, authorId],
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderEqualToAuthorIdNotEqualTo(int order, int authorId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [order],
              upper: [order, authorId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [order, authorId],
              includeLower: false,
              upper: [order],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [order, authorId],
              includeLower: false,
              upper: [order],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'order_authorId',
              lower: [order],
              upper: [order, authorId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderEqualToAuthorIdGreaterThan(
    int order,
    int authorId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_authorId',
        lower: [order, authorId],
        includeLower: include,
        upper: [order],
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderEqualToAuthorIdLessThan(
    int order,
    int authorId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_authorId',
        lower: [order],
        upper: [order, authorId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterWhereClause>
      orderEqualToAuthorIdBetween(
    int order,
    int lowerAuthorId,
    int upperAuthorId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'order_authorId',
        lower: [order, lowerAuthorId],
        includeLower: includeLower,
        upper: [order, upperAuthorId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookBriefFromAuthorQueryFilter on QueryBuilder<BookBriefFromAuthor,
    BookBriefFromAuthor, QFilterCondition> {
  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNamesStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNamesStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNamesStr',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      authorNamesStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNamesStr',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverDomColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverDomColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverMUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverMUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverSUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverSUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverSUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverSUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      coverSUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      hasEbookEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasEbook',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      isbnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      publisherNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      publisherNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      publisherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      publisherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      ratingEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      shortDescContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      shortDescMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortDesc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      shortDescIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      shortDescIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
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

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension BookBriefFromAuthorQueryObject on QueryBuilder<BookBriefFromAuthor,
    BookBriefFromAuthor, QFilterCondition> {}

extension BookBriefFromAuthorQueryLinks on QueryBuilder<BookBriefFromAuthor,
    BookBriefFromAuthor, QFilterCondition> {}

extension BookBriefFromAuthorQuerySortBy
    on QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QSortBy> {
  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByAuthorNamesStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByAuthorNamesStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookBriefFromAuthorQuerySortThenBy
    on QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QSortThenBy> {
  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByAuthorNamesStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByAuthorNamesStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorNamesStr', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookBriefFromAuthorQueryWhereDistinct
    on QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct> {
  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorId');
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByAuthorNamesStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNamesStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverDomColor');
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByCoverMUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByCoverSUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverSUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByIsbn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByPublisherName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisherName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByShortDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortDesc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension BookBriefFromAuthorQueryProperty
    on QueryBuilder<BookBriefFromAuthor, BookBriefFromAuthor, QQueryProperty> {
  QueryBuilder<BookBriefFromAuthor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookBriefFromAuthor, int, QQueryOperations> authorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorId');
    });
  }

  QueryBuilder<BookBriefFromAuthor, List<String>, QQueryOperations>
      authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<BookBriefFromAuthor, String, QQueryOperations>
      authorNamesStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNamesStr');
    });
  }

  QueryBuilder<BookBriefFromAuthor, int, QQueryOperations>
      coverDomColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverDomColor');
    });
  }

  QueryBuilder<BookBriefFromAuthor, String, QQueryOperations>
      coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<BookBriefFromAuthor, String, QQueryOperations>
      coverSUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverSUrl');
    });
  }

  QueryBuilder<BookBriefFromAuthor, bool, QQueryOperations> hasEbookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasEbook');
    });
  }

  QueryBuilder<BookBriefFromAuthor, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<BookBriefFromAuthor, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<BookBriefFromAuthor, String, QQueryOperations>
      publisherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisherName');
    });
  }

  QueryBuilder<BookBriefFromAuthor, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<BookBriefFromAuthor, String, QQueryOperations>
      shortDescProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortDesc');
    });
  }

  QueryBuilder<BookBriefFromAuthor, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookBriefFromAuthor _$BookBriefFromAuthorFromJson(Map<String, dynamic> json) =>
    BookBriefFromAuthor(
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

Map<String, dynamic> _$BookBriefFromAuthorToJson(
        BookBriefFromAuthor instance) =>
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
      'authorId': instance.authorId,
      'order': instance.order,
    };
