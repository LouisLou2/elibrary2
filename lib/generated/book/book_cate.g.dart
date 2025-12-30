// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_cate.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookCateCollection on Isar {
  IsarCollection<BookCate> get bookCates => this.collection();
}

const BookCateSchema = CollectionSchema(
  name: r'BookCate',
  id: 2359108297523573723,
  properties: {
    r'bookNum': PropertySchema(
      id: 0,
      name: r'bookNum',
      type: IsarType.long,
    ),
    r'cateId': PropertySchema(
      id: 1,
      name: r'cateId',
      type: IsarType.long,
    ),
    r'cateName': PropertySchema(
      id: 2,
      name: r'cateName',
      type: IsarType.string,
    ),
    r'coverUrl': PropertySchema(
      id: 3,
      name: r'coverUrl',
      type: IsarType.string,
    ),
    r'desc': PropertySchema(
      id: 4,
      name: r'desc',
      type: IsarType.string,
    ),
    r'domColor': PropertySchema(
      id: 5,
      name: r'domColor',
      type: IsarType.long,
    ),
    r'parentId': PropertySchema(
      id: 6,
      name: r'parentId',
      type: IsarType.long,
    )
  },
  estimateSize: _bookCateEstimateSize,
  serialize: _bookCateSerialize,
  deserialize: _bookCateDeserialize,
  deserializeProp: _bookCateDeserializeProp,
  idName: r'id',
  indexes: {
    r'cateId': IndexSchema(
      id: 6671251479217636544,
      name: r'cateId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'cateId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookCateGetId,
  getLinks: _bookCateGetLinks,
  attach: _bookCateAttach,
  version: '3.1.0+1',
);

int _bookCateEstimateSize(
  BookCate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cateName.length * 3;
  bytesCount += 3 + object.coverUrl.length * 3;
  bytesCount += 3 + object.desc.length * 3;
  return bytesCount;
}

void _bookCateSerialize(
  BookCate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bookNum);
  writer.writeLong(offsets[1], object.cateId);
  writer.writeString(offsets[2], object.cateName);
  writer.writeString(offsets[3], object.coverUrl);
  writer.writeString(offsets[4], object.desc);
  writer.writeLong(offsets[5], object.domColor);
  writer.writeLong(offsets[6], object.parentId);
}

BookCate _bookCateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookCate(
    bookNum: reader.readLong(offsets[0]),
    cateId: reader.readLong(offsets[1]),
    cateName: reader.readString(offsets[2]),
    coverUrl: reader.readString(offsets[3]),
    desc: reader.readString(offsets[4]),
    domColor: reader.readLong(offsets[5]),
    parentId: reader.readLong(offsets[6]),
  );
  object.id = id;
  return object;
}

P _bookCateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookCateGetId(BookCate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookCateGetLinks(BookCate object) {
  return [];
}

void _bookCateAttach(IsarCollection<dynamic> col, Id id, BookCate object) {
  object.id = id;
}

extension BookCateByIndex on IsarCollection<BookCate> {
  Future<BookCate?> getByCateId(int cateId) {
    return getByIndex(r'cateId', [cateId]);
  }

  BookCate? getByCateIdSync(int cateId) {
    return getByIndexSync(r'cateId', [cateId]);
  }

  Future<bool> deleteByCateId(int cateId) {
    return deleteByIndex(r'cateId', [cateId]);
  }

  bool deleteByCateIdSync(int cateId) {
    return deleteByIndexSync(r'cateId', [cateId]);
  }

  Future<List<BookCate?>> getAllByCateId(List<int> cateIdValues) {
    final values = cateIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'cateId', values);
  }

  List<BookCate?> getAllByCateIdSync(List<int> cateIdValues) {
    final values = cateIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'cateId', values);
  }

  Future<int> deleteAllByCateId(List<int> cateIdValues) {
    final values = cateIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'cateId', values);
  }

  int deleteAllByCateIdSync(List<int> cateIdValues) {
    final values = cateIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'cateId', values);
  }

  Future<Id> putByCateId(BookCate object) {
    return putByIndex(r'cateId', object);
  }

  Id putByCateIdSync(BookCate object, {bool saveLinks = true}) {
    return putByIndexSync(r'cateId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCateId(List<BookCate> objects) {
    return putAllByIndex(r'cateId', objects);
  }

  List<Id> putAllByCateIdSync(List<BookCate> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'cateId', objects, saveLinks: saveLinks);
  }
}

extension BookCateQueryWhereSort on QueryBuilder<BookCate, BookCate, QWhere> {
  QueryBuilder<BookCate, BookCate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhere> anyCateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'cateId'),
      );
    });
  }
}

extension BookCateQueryWhere on QueryBuilder<BookCate, BookCate, QWhereClause> {
  QueryBuilder<BookCate, BookCate, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> cateIdEqualTo(
      int cateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cateId',
        value: [cateId],
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> cateIdNotEqualTo(
      int cateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cateId',
              lower: [],
              upper: [cateId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cateId',
              lower: [cateId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cateId',
              lower: [cateId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cateId',
              lower: [],
              upper: [cateId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> cateIdGreaterThan(
    int cateId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cateId',
        lower: [cateId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> cateIdLessThan(
    int cateId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cateId',
        lower: [],
        upper: [cateId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterWhereClause> cateIdBetween(
    int lowerCateId,
    int upperCateId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cateId',
        lower: [lowerCateId],
        includeLower: includeLower,
        upper: [upperCateId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookCateQueryFilter
    on QueryBuilder<BookCate, BookCate, QFilterCondition> {
  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> bookNumEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookNum',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> bookNumGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookNum',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> bookNumLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookNum',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> bookNumBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookNum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cateId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cateId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cateId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cateName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> cateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cateName',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> coverUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descEqualTo(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descGreaterThan(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descLessThan(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descBetween(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descStartsWith(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descEndsWith(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descContains(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descMatches(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> domColorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> domColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'domColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> domColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'domColor',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> domColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'domColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> parentIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> parentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> parentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterFilterCondition> parentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookCateQueryObject
    on QueryBuilder<BookCate, BookCate, QFilterCondition> {}

extension BookCateQueryLinks
    on QueryBuilder<BookCate, BookCate, QFilterCondition> {}

extension BookCateQuerySortBy on QueryBuilder<BookCate, BookCate, QSortBy> {
  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByBookNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNum', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByBookNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNum', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByCateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateId', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByCateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateId', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByCateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateName', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByCateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateName', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domColor', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domColor', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }
}

extension BookCateQuerySortThenBy
    on QueryBuilder<BookCate, BookCate, QSortThenBy> {
  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByBookNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNum', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByBookNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNum', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByCateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateId', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByCateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateId', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByCateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateName', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByCateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cateName', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domColor', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByDomColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domColor', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<BookCate, BookCate, QAfterSortBy> thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }
}

extension BookCateQueryWhereDistinct
    on QueryBuilder<BookCate, BookCate, QDistinct> {
  QueryBuilder<BookCate, BookCate, QDistinct> distinctByBookNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookNum');
    });
  }

  QueryBuilder<BookCate, BookCate, QDistinct> distinctByCateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cateId');
    });
  }

  QueryBuilder<BookCate, BookCate, QDistinct> distinctByCateName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cateName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookCate, BookCate, QDistinct> distinctByCoverUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookCate, BookCate, QDistinct> distinctByDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookCate, BookCate, QDistinct> distinctByDomColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'domColor');
    });
  }

  QueryBuilder<BookCate, BookCate, QDistinct> distinctByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId');
    });
  }
}

extension BookCateQueryProperty
    on QueryBuilder<BookCate, BookCate, QQueryProperty> {
  QueryBuilder<BookCate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookCate, int, QQueryOperations> bookNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookNum');
    });
  }

  QueryBuilder<BookCate, int, QQueryOperations> cateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cateId');
    });
  }

  QueryBuilder<BookCate, String, QQueryOperations> cateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cateName');
    });
  }

  QueryBuilder<BookCate, String, QQueryOperations> coverUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverUrl');
    });
  }

  QueryBuilder<BookCate, String, QQueryOperations> descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc');
    });
  }

  QueryBuilder<BookCate, int, QQueryOperations> domColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'domColor');
    });
  }

  QueryBuilder<BookCate, int, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCate _$BookCateFromJson(Map<String, dynamic> json) => BookCate(
      parentId: (json['parent_id'] as num).toInt(),
      cateId: (json['cate_id'] as num).toInt(),
      cateName: json['cate_name'] as String,
      coverUrl: json['cover_url'] as String,
      bookNum: (json['book_num'] as num).toInt(),
      domColor: (json['dom_color'] as num).toInt(),
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$BookCateToJson(BookCate instance) => <String, dynamic>{
      'parent_id': instance.parentId,
      'cate_id': instance.cateId,
      'cate_name': instance.cateName,
      'cover_url': instance.coverUrl,
      'book_num': instance.bookNum,
      'dom_color': instance.domColor,
      'desc': instance.desc,
    };
