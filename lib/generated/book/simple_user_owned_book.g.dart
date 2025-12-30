// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/simple_user_owned_book.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSimpleUserOwnedBookCollection on Isar {
  IsarCollection<SimpleUserOwnedBook> get simpleUserOwnedBooks =>
      this.collection();
}

const SimpleUserOwnedBookSchema = CollectionSchema(
  name: r'SimpleUserOwnedBook',
  id: 3814036185374807028,
  properties: {
    r'category1': PropertySchema(
      id: 0,
      name: r'category1',
      type: IsarType.long,
    ),
    r'category1Name': PropertySchema(
      id: 1,
      name: r'category1Name',
      type: IsarType.string,
    ),
    r'coverMUrl': PropertySchema(
      id: 2,
      name: r'coverMUrl',
      type: IsarType.string,
    ),
    r'isbn': PropertySchema(
      id: 3,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'shelfEleId': PropertySchema(
      id: 4,
      name: r'shelfEleId',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.long,
    ),
    r'time': PropertySchema(
      id: 6,
      name: r'time',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _simpleUserOwnedBookEstimateSize,
  serialize: _simpleUserOwnedBookSerialize,
  deserialize: _simpleUserOwnedBookDeserialize,
  deserializeProp: _simpleUserOwnedBookDeserializeProp,
  idName: r'id',
  indexes: {
    r'shelfEleId': IndexSchema(
      id: -3633623867685116449,
      name: r'shelfEleId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'shelfEleId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'userId_time': IndexSchema(
      id: 6368231919356958342,
      name: r'userId_time',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'time',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _simpleUserOwnedBookGetId,
  getLinks: _simpleUserOwnedBookGetLinks,
  attach: _simpleUserOwnedBookAttach,
  version: '3.1.0+1',
);

int _simpleUserOwnedBookEstimateSize(
  SimpleUserOwnedBook object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category1Name.length * 3;
  bytesCount += 3 + object.coverMUrl.length * 3;
  bytesCount += 3 + object.isbn.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _simpleUserOwnedBookSerialize(
  SimpleUserOwnedBook object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.category1);
  writer.writeString(offsets[1], object.category1Name);
  writer.writeString(offsets[2], object.coverMUrl);
  writer.writeString(offsets[3], object.isbn);
  writer.writeLong(offsets[4], object.shelfEleId);
  writer.writeLong(offsets[5], object.status);
  writer.writeDateTime(offsets[6], object.time);
  writer.writeString(offsets[7], object.title);
  writer.writeLong(offsets[8], object.userId);
}

SimpleUserOwnedBook _simpleUserOwnedBookDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SimpleUserOwnedBook(
    category1: reader.readLong(offsets[0]),
    category1Name: reader.readString(offsets[1]),
    coverMUrl: reader.readString(offsets[2]),
    isbn: reader.readString(offsets[3]),
    shelfEleId: reader.readLong(offsets[4]),
    status: reader.readLong(offsets[5]),
    time: reader.readDateTime(offsets[6]),
    title: reader.readString(offsets[7]),
  );
  object.id = id;
  object.userId = reader.readLong(offsets[8]);
  return object;
}

P _simpleUserOwnedBookDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _simpleUserOwnedBookGetId(SimpleUserOwnedBook object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _simpleUserOwnedBookGetLinks(
    SimpleUserOwnedBook object) {
  return [];
}

void _simpleUserOwnedBookAttach(
    IsarCollection<dynamic> col, Id id, SimpleUserOwnedBook object) {
  object.id = id;
}

extension SimpleUserOwnedBookByIndex on IsarCollection<SimpleUserOwnedBook> {
  Future<SimpleUserOwnedBook?> getByShelfEleId(int shelfEleId) {
    return getByIndex(r'shelfEleId', [shelfEleId]);
  }

  SimpleUserOwnedBook? getByShelfEleIdSync(int shelfEleId) {
    return getByIndexSync(r'shelfEleId', [shelfEleId]);
  }

  Future<bool> deleteByShelfEleId(int shelfEleId) {
    return deleteByIndex(r'shelfEleId', [shelfEleId]);
  }

  bool deleteByShelfEleIdSync(int shelfEleId) {
    return deleteByIndexSync(r'shelfEleId', [shelfEleId]);
  }

  Future<List<SimpleUserOwnedBook?>> getAllByShelfEleId(
      List<int> shelfEleIdValues) {
    final values = shelfEleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'shelfEleId', values);
  }

  List<SimpleUserOwnedBook?> getAllByShelfEleIdSync(
      List<int> shelfEleIdValues) {
    final values = shelfEleIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'shelfEleId', values);
  }

  Future<int> deleteAllByShelfEleId(List<int> shelfEleIdValues) {
    final values = shelfEleIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'shelfEleId', values);
  }

  int deleteAllByShelfEleIdSync(List<int> shelfEleIdValues) {
    final values = shelfEleIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'shelfEleId', values);
  }

  Future<Id> putByShelfEleId(SimpleUserOwnedBook object) {
    return putByIndex(r'shelfEleId', object);
  }

  Id putByShelfEleIdSync(SimpleUserOwnedBook object, {bool saveLinks = true}) {
    return putByIndexSync(r'shelfEleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByShelfEleId(List<SimpleUserOwnedBook> objects) {
    return putAllByIndex(r'shelfEleId', objects);
  }

  List<Id> putAllByShelfEleIdSync(List<SimpleUserOwnedBook> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'shelfEleId', objects, saveLinks: saveLinks);
  }
}

extension SimpleUserOwnedBookQueryWhereSort
    on QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QWhere> {
  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhere>
      anyShelfEleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'shelfEleId'),
      );
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhere>
      anyUserIdTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId_time'),
      );
    });
  }
}

extension SimpleUserOwnedBookQueryWhere
    on QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QWhereClause> {
  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      shelfEleIdEqualTo(int shelfEleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'shelfEleId',
        value: [shelfEleId],
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      shelfEleIdNotEqualTo(int shelfEleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shelfEleId',
              lower: [],
              upper: [shelfEleId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shelfEleId',
              lower: [shelfEleId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shelfEleId',
              lower: [shelfEleId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shelfEleId',
              lower: [],
              upper: [shelfEleId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      shelfEleIdGreaterThan(
    int shelfEleId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'shelfEleId',
        lower: [shelfEleId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      shelfEleIdLessThan(
    int shelfEleId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'shelfEleId',
        lower: [],
        upper: [shelfEleId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      shelfEleIdBetween(
    int lowerShelfEleId,
    int upperShelfEleId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'shelfEleId',
        lower: [lowerShelfEleId],
        includeLower: includeLower,
        upper: [upperShelfEleId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdEqualToAnyTime(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_time',
        value: [userId],
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdNotEqualToAnyTime(int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdGreaterThanAnyTime(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_time',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdLessThanAnyTime(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_time',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdBetweenAnyTime(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_time',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdTimeEqualTo(int userId, DateTime time) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_time',
        value: [userId, time],
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdEqualToTimeNotEqualTo(int userId, DateTime time) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [userId],
              upper: [userId, time],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [userId, time],
              includeLower: false,
              upper: [userId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [userId, time],
              includeLower: false,
              upper: [userId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_time',
              lower: [userId],
              upper: [userId, time],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdEqualToTimeGreaterThan(
    int userId,
    DateTime time, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_time',
        lower: [userId, time],
        includeLower: include,
        upper: [userId],
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdEqualToTimeLessThan(
    int userId,
    DateTime time, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_time',
        lower: [userId],
        upper: [userId, time],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterWhereClause>
      userIdEqualToTimeBetween(
    int userId,
    DateTime lowerTime,
    DateTime upperTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_time',
        lower: [userId, lowerTime],
        includeLower: includeLower,
        upper: [userId, upperTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SimpleUserOwnedBookQueryFilter on QueryBuilder<SimpleUserOwnedBook,
    SimpleUserOwnedBook, QFilterCondition> {
  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1EqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1GreaterThan(
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1LessThan(
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1Between(
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameEqualTo(
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameLessThan(
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameBetween(
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameEndsWith(
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category1Name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1Name',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      category1NameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category1Name',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      coverMUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      coverMUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      isbnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      shelfEleIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shelfEleId',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      shelfEleIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shelfEleId',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      shelfEleIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shelfEleId',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      shelfEleIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shelfEleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      statusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      statusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      timeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      timeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      timeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      timeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterFilterCondition>
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

extension SimpleUserOwnedBookQueryObject on QueryBuilder<SimpleUserOwnedBook,
    SimpleUserOwnedBook, QFilterCondition> {}

extension SimpleUserOwnedBookQueryLinks on QueryBuilder<SimpleUserOwnedBook,
    SimpleUserOwnedBook, QFilterCondition> {}

extension SimpleUserOwnedBookQuerySortBy
    on QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QSortBy> {
  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByCategory1Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByCategory1NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByShelfEleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelfEleId', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByShelfEleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelfEleId', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SimpleUserOwnedBookQuerySortThenBy
    on QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QSortThenBy> {
  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByCategory1Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByCategory1NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1Name', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByShelfEleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelfEleId', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByShelfEleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelfEleId', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SimpleUserOwnedBookQueryWhereDistinct
    on QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct> {
  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category1');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByCategory1Name({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category1Name',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByCoverMUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByIsbn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByShelfEleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shelfEleId');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension SimpleUserOwnedBookQueryProperty
    on QueryBuilder<SimpleUserOwnedBook, SimpleUserOwnedBook, QQueryProperty> {
  QueryBuilder<SimpleUserOwnedBook, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, int, QQueryOperations> category1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category1');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, String, QQueryOperations>
      category1NameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category1Name');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, String, QQueryOperations>
      coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, int, QQueryOperations>
      shelfEleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shelfEleId');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, DateTime, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<SimpleUserOwnedBook, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleUserOwnedBook _$SimpleUserOwnedBookFromJson(Map<String, dynamic> json) =>
    SimpleUserOwnedBook(
      shelfEleId: (json['shelf_ele_id'] as num).toInt(),
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      coverMUrl: json['cover_m_url'] as String,
      time: DateTime.parse(json['time'] as String),
      category1: (json['category1'] as num).toInt(),
      category1Name: json['category1_name'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$SimpleUserOwnedBookToJson(
        SimpleUserOwnedBook instance) =>
    <String, dynamic>{
      'shelf_ele_id': instance.shelfEleId,
      'isbn': instance.isbn,
      'title': instance.title,
      'cover_m_url': instance.coverMUrl,
      'time': instance.time.toIso8601String(),
      'category1': instance.category1,
      'category1_name': instance.category1Name,
      'status': instance.status,
    };
