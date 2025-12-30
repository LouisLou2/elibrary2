// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookInfoCollection on Isar {
  IsarCollection<BookInfo> get bookInfos => this.collection();
}

const BookInfoSchema = CollectionSchema(
  name: r'BookInfo',
  id: 1400514355585208475,
  properties: {
    r'authorIds': PropertySchema(
      id: 0,
      name: r'authorIds',
      type: IsarType.longList,
    ),
    r'authorNames': PropertySchema(
      id: 1,
      name: r'authorNames',
      type: IsarType.stringList,
    ),
    r'category1': PropertySchema(
      id: 2,
      name: r'category1',
      type: IsarType.long,
    ),
    r'category1Name': PropertySchema(
      id: 3,
      name: r'category1Name',
      type: IsarType.string,
    ),
    r'category2': PropertySchema(
      id: 4,
      name: r'category2',
      type: IsarType.long,
    ),
    r'category2Name': PropertySchema(
      id: 5,
      name: r'category2Name',
      type: IsarType.string,
    ),
    r'coverDomColor': PropertySchema(
      id: 6,
      name: r'coverDomColor',
      type: IsarType.long,
    ),
    r'coverLUrl': PropertySchema(
      id: 7,
      name: r'coverLUrl',
      type: IsarType.string,
    ),
    r'coverMUrl': PropertySchema(
      id: 8,
      name: r'coverMUrl',
      type: IsarType.string,
    ),
    r'coverSUrl': PropertySchema(
      id: 9,
      name: r'coverSUrl',
      type: IsarType.string,
    ),
    r'desc': PropertySchema(
      id: 10,
      name: r'desc',
      type: IsarType.string,
    ),
    r'ebookUrl': PropertySchema(
      id: 11,
      name: r'ebookUrl',
      type: IsarType.string,
    ),
    r'hasEbook': PropertySchema(
      id: 12,
      name: r'hasEbook',
      type: IsarType.bool,
    ),
    r'isbn': PropertySchema(
      id: 13,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'langId': PropertySchema(
      id: 14,
      name: r'langId',
      type: IsarType.long,
    ),
    r'langName': PropertySchema(
      id: 15,
      name: r'langName',
      type: IsarType.string,
    ),
    r'libAvailable': PropertySchema(
      id: 16,
      name: r'libAvailable',
      type: IsarType.bool,
    ),
    r'originalTitle': PropertySchema(
      id: 17,
      name: r'originalTitle',
      type: IsarType.string,
    ),
    r'pubDate': PropertySchema(
      id: 18,
      name: r'pubDate',
      type: IsarType.dateTime,
    ),
    r'publisherId': PropertySchema(
      id: 19,
      name: r'publisherId',
      type: IsarType.long,
    ),
    r'publisherName': PropertySchema(
      id: 20,
      name: r'publisherName',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 21,
      name: r'rating',
      type: IsarType.long,
    ),
    r'shortDesc': PropertySchema(
      id: 22,
      name: r'shortDesc',
      type: IsarType.string,
    ),
    r'tagIds': PropertySchema(
      id: 23,
      name: r'tagIds',
      type: IsarType.longList,
    ),
    r'tagNames': PropertySchema(
      id: 24,
      name: r'tagNames',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 25,
      name: r'title',
      type: IsarType.string,
    ),
    r'wordCount': PropertySchema(
      id: 26,
      name: r'wordCount',
      type: IsarType.long,
    )
  },
  estimateSize: _bookInfoEstimateSize,
  serialize: _bookInfoSerialize,
  deserialize: _bookInfoDeserialize,
  deserializeProp: _bookInfoDeserializeProp,
  idName: r'id',
  indexes: {
    r'isbn': IndexSchema(
      id: 6054191419597679524,
      name: r'isbn',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'isbn',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookInfoGetId,
  getLinks: _bookInfoGetLinks,
  attach: _bookInfoAttach,
  version: '3.1.0+1',
);

int _bookInfoEstimateSize(
  BookInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.authorIds.length * 8;
  bytesCount += 3 + object.authorNames.length * 3;
  {
    for (var i = 0; i < object.authorNames.length; i++) {
      final value = object.authorNames[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.category1Name.length * 3;
  bytesCount += 3 + object.category2Name.length * 3;
  bytesCount += 3 + object.coverLUrl.length * 3;
  bytesCount += 3 + object.coverMUrl.length * 3;
  bytesCount += 3 + object.coverSUrl.length * 3;
  bytesCount += 3 + object.desc.length * 3;
  {
    final value = object.ebookUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.isbn.length * 3;
  bytesCount += 3 + object.langName.length * 3;
  bytesCount += 3 + object.originalTitle.length * 3;
  bytesCount += 3 + object.publisherName.length * 3;
  bytesCount += 3 + object.shortDesc.length * 3;
  bytesCount += 3 + object.tagIds.length * 8;
  bytesCount += 3 + object.tagNames.length * 3;
  {
    for (var i = 0; i < object.tagNames.length; i++) {
      final value = object.tagNames[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookInfoSerialize(
  BookInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.authorIds);
  writer.writeStringList(offsets[1], object.authorNames);
  writer.writeLong(offsets[2], object.category1);
  writer.writeString(offsets[3], object.category1Name);
  writer.writeLong(offsets[4], object.category2);
  writer.writeString(offsets[5], object.category2Name);
  writer.writeLong(offsets[6], object.coverDomColor);
  writer.writeString(offsets[7], object.coverLUrl);
  writer.writeString(offsets[8], object.coverMUrl);
  writer.writeString(offsets[9], object.coverSUrl);
  writer.writeString(offsets[10], object.desc);
  writer.writeString(offsets[11], object.ebookUrl);
  writer.writeBool(offsets[12], object.hasEbook);
  writer.writeString(offsets[13], object.isbn);
  writer.writeLong(offsets[14], object.langId);
  writer.writeString(offsets[15], object.langName);
  writer.writeBool(offsets[16], object.libAvailable);
  writer.writeString(offsets[17], object.originalTitle);
  writer.writeDateTime(offsets[18], object.pubDate);
  writer.writeLong(offsets[19], object.publisherId);
  writer.writeString(offsets[20], object.publisherName);
  writer.writeLong(offsets[21], object.rating);
  writer.writeString(offsets[22], object.shortDesc);
  writer.writeLongList(offsets[23], object.tagIds);
  writer.writeStringList(offsets[24], object.tagNames);
  writer.writeString(offsets[25], object.title);
  writer.writeLong(offsets[26], object.wordCount);
}

BookInfo _bookInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookInfo(
    authorIds: reader.readLongList(offsets[0]) ?? [],
    authorNames: reader.readStringList(offsets[1]) ?? [],
    category1: reader.readLong(offsets[2]),
    category1Name: reader.readString(offsets[3]),
    category2: reader.readLong(offsets[4]),
    category2Name: reader.readString(offsets[5]),
    coverDomColor: reader.readLong(offsets[6]),
    coverLUrl: reader.readString(offsets[7]),
    coverMUrl: reader.readString(offsets[8]),
    coverSUrl: reader.readString(offsets[9]),
    desc: reader.readString(offsets[10]),
    ebookUrl: reader.readStringOrNull(offsets[11]),
    isbn: reader.readString(offsets[13]),
    langId: reader.readLong(offsets[14]),
    langName: reader.readString(offsets[15]),
    originalTitle: reader.readString(offsets[17]),
    pubDate: reader.readDateTime(offsets[18]),
    publisherId: reader.readLong(offsets[19]),
    publisherName: reader.readString(offsets[20]),
    rating: reader.readLong(offsets[21]),
    shortDesc: reader.readString(offsets[22]),
    tagIds: reader.readLongList(offsets[23]) ?? [],
    tagNames: reader.readStringList(offsets[24]) ?? [],
    title: reader.readString(offsets[25]),
    wordCount: reader.readLong(offsets[26]),
  );
  object.id = id;
  return object;
}

P _bookInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readDateTime(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readLongList(offset) ?? []) as P;
    case 24:
      return (reader.readStringList(offset) ?? []) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookInfoGetId(BookInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookInfoGetLinks(BookInfo object) {
  return [];
}

void _bookInfoAttach(IsarCollection<dynamic> col, Id id, BookInfo object) {
  object.id = id;
}

extension BookInfoByIndex on IsarCollection<BookInfo> {
  Future<BookInfo?> getByIsbn(String isbn) {
    return getByIndex(r'isbn', [isbn]);
  }

  BookInfo? getByIsbnSync(String isbn) {
    return getByIndexSync(r'isbn', [isbn]);
  }

  Future<bool> deleteByIsbn(String isbn) {
    return deleteByIndex(r'isbn', [isbn]);
  }

  bool deleteByIsbnSync(String isbn) {
    return deleteByIndexSync(r'isbn', [isbn]);
  }

  Future<List<BookInfo?>> getAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndex(r'isbn', values);
  }

  List<BookInfo?> getAllByIsbnSync(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'isbn', values);
  }

  Future<int> deleteAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'isbn', values);
  }

  int deleteAllByIsbnSync(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'isbn', values);
  }

  Future<Id> putByIsbn(BookInfo object) {
    return putByIndex(r'isbn', object);
  }

  Id putByIsbnSync(BookInfo object, {bool saveLinks = true}) {
    return putByIndexSync(r'isbn', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIsbn(List<BookInfo> objects) {
    return putAllByIndex(r'isbn', objects);
  }

  List<Id> putAllByIsbnSync(List<BookInfo> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'isbn', objects, saveLinks: saveLinks);
  }
}

extension BookInfoQueryWhereSort on QueryBuilder<BookInfo, BookInfo, QWhere> {
  QueryBuilder<BookInfo, BookInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookInfoQueryWhere on QueryBuilder<BookInfo, BookInfo, QWhereClause> {
  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> isbnEqualTo(String isbn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isbn',
        value: [isbn],
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterWhereClause> isbnNotEqualTo(
      String isbn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [],
              upper: [isbn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [isbn],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [isbn],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [],
              upper: [isbn],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BookInfoQueryFilter
    on QueryBuilder<BookInfo, BookInfo, QFilterCondition> {
  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> authorIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      authorNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> authorNamesIsEmpty() {
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1NameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category1NameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1NameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1NameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category1Name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category1NameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1NameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1NameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category1NameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category1Name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category1NameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1Name',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category1NameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category1Name',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2NameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category2NameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2NameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2NameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category2Name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category2NameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2NameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2NameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> category2NameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category2Name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category2NameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category2Name',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      category2NameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category2Name',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverDomColorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverDomColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverDomColorLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverDomColorBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverLUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverLUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverLUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverLUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverLUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverLUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverLUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverLUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverLUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverLUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      coverLUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverLUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlEqualTo(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlStartsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlEndsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlEqualTo(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlStartsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlEndsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverSUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverSUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> coverSUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      coverSUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverSUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ebookUrl',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ebookUrl',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ebookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ebookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ebookUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ebookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ebookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ebookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ebookUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebookUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ebookUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ebookUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> hasEbookEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasEbook',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnEqualTo(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnStartsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnEndsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnContains(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnMatches(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'langId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'langId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'langId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'langId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'langName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'langName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'langName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'langName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'langName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'langName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'langName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'langName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'langName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> langNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'langName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> libAvailableEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'libAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> originalTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      originalTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pubDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pubDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pubDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> pubDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pubDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      publisherIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publisherId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publisherId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publisherId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherNameEqualTo(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherNameLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherNameBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherNameEndsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> publisherNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      publisherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      publisherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisherName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ratingEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ratingGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ratingLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> ratingBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescEqualTo(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescStartsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescEndsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortDesc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> shortDescIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      shortDescIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagIds',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagNames',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagNamesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition>
      tagNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> tagNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleContains(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterFilterCondition> wordCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookInfoQueryObject
    on QueryBuilder<BookInfo, BookInfo, QFilterCondition> {}

extension BookInfoQueryLinks
    on QueryBuilder<BookInfo, BookInfo, QFilterCondition> {}

extension BookInfoQuerySortBy on QueryBuilder<BookInfo, BookInfo, QSortBy> {
  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory1Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory1NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory2Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2Name', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCategory2NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2Name', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverLUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverLUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByEbookUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebookUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByEbookUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebookUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByLangId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langId', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByLangIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langId', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByLangName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langName', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByLangNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langName', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByLibAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libAvailable', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByLibAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libAvailable', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByOriginalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByOriginalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPubDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPublisherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherId', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPublisherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherId', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> sortByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension BookInfoQuerySortThenBy
    on QueryBuilder<BookInfo, BookInfo, QSortThenBy> {
  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory1Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory1NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory2Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2Name', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCategory2NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2Name', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverDomColor', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverLUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverLUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverLUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverSUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByCoverSUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverSUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByEbookUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebookUrl', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByEbookUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebookUrl', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByHasEbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasEbook', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByLangId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langId', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByLangIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langId', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByLangName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langName', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByLangNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langName', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByLibAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libAvailable', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByLibAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libAvailable', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByOriginalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByOriginalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalTitle', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPubDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubDate', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPublisherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherId', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPublisherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherId', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPublisherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByPublisherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisherName', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByShortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByShortDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDesc', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QAfterSortBy> thenByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension BookInfoQueryWhereDistinct
    on QueryBuilder<BookInfo, BookInfo, QDistinct> {
  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByAuthorIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorIds');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByAuthorNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorNames');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category1');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCategory1Name(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category1Name',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category2');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCategory2Name(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category2Name',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCoverDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverDomColor');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCoverLUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverLUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCoverMUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByCoverSUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverSUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByEbookUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ebookUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByHasEbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasEbook');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByLangId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'langId');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByLangName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'langName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByLibAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'libAvailable');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByOriginalTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalTitle',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByPubDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pubDate');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByPublisherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisherId');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByPublisherName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisherName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByShortDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortDesc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByTagIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagIds');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByTagNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagNames');
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookInfo, BookInfo, QDistinct> distinctByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordCount');
    });
  }
}

extension BookInfoQueryProperty
    on QueryBuilder<BookInfo, BookInfo, QQueryProperty> {
  QueryBuilder<BookInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookInfo, List<int>, QQueryOperations> authorIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorIds');
    });
  }

  QueryBuilder<BookInfo, List<String>, QQueryOperations> authorNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorNames');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> category1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category1');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> category1NameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category1Name');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> category2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category2');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> category2NameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category2Name');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> coverDomColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverDomColor');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> coverLUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverLUrl');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> coverSUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverSUrl');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc');
    });
  }

  QueryBuilder<BookInfo, String?, QQueryOperations> ebookUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ebookUrl');
    });
  }

  QueryBuilder<BookInfo, bool, QQueryOperations> hasEbookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasEbook');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> langIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'langId');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> langNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'langName');
    });
  }

  QueryBuilder<BookInfo, bool, QQueryOperations> libAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'libAvailable');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> originalTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalTitle');
    });
  }

  QueryBuilder<BookInfo, DateTime, QQueryOperations> pubDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pubDate');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> publisherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisherId');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> publisherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisherName');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> shortDescProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortDesc');
    });
  }

  QueryBuilder<BookInfo, List<int>, QQueryOperations> tagIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagIds');
    });
  }

  QueryBuilder<BookInfo, List<String>, QQueryOperations> tagNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagNames');
    });
  }

  QueryBuilder<BookInfo, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BookInfo, int, QQueryOperations> wordCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordCount');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookInfo _$BookInfoFromJson(Map<String, dynamic> json) => BookInfo(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      publisherId: (json['publisher_id'] as num).toInt(),
      publisherName: json['publisher_name'] as String,
      pubDate: DateTime.parse(json['pub_date'] as String),
      desc: json['desc'] as String,
      shortDesc: json['short_desc'] as String,
      wordCount: (json['word_count'] as num).toInt(),
      langId: (json['lang_id'] as num).toInt(),
      langName: json['lang_name'] as String,
      coverSUrl: json['cover_s_url'] as String,
      coverMUrl: json['cover_m_url'] as String,
      coverLUrl: json['cover_l_url'] as String,
      coverDomColor: (json['cover_dom_color'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      ebookUrl: json['ebookUrl'] as String?,
      category1: (json['category1'] as num).toInt(),
      category1Name: json['category1_name'] as String,
      category2: (json['category2'] as num).toInt(),
      category2Name: json['category2_name'] as String,
      authorIds: (json['author_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      authorNames: (json['author_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagIds: (json['tag_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      tagNames:
          (json['tag_names'] as List<dynamic>).map((e) => e as String).toList(),
      availableLibs: (json['available_libs'] as List<dynamic>?)
          ?.map((e) => SimpleLib.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedBooks: (json['related_books'] as List<dynamic>?)
          ?.map((e) => BookBriefFromAuthor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookInfoToJson(BookInfo instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'publisher_id': instance.publisherId,
      'publisher_name': instance.publisherName,
      'pub_date': instance.pubDate.toIso8601String(),
      'desc': instance.desc,
      'short_desc': instance.shortDesc,
      'word_count': instance.wordCount,
      'lang_id': instance.langId,
      'lang_name': instance.langName,
      'cover_s_url': instance.coverSUrl,
      'cover_m_url': instance.coverMUrl,
      'cover_l_url': instance.coverLUrl,
      'cover_dom_color': instance.coverDomColor,
      'rating': instance.rating,
      'ebookUrl': instance.ebookUrl,
      'category1': instance.category1,
      'category1_name': instance.category1Name,
      'category2': instance.category2,
      'category2_name': instance.category2Name,
      'author_ids': instance.authorIds,
      'author_names': instance.authorNames,
      'tag_ids': instance.tagIds,
      'tag_names': instance.tagNames,
      'available_libs': instance.availableLibs?.map((e) => e.toJson()).toList(),
      'related_books': instance.relatedBooks?.map((e) => e.toJson()).toList(),
    };
