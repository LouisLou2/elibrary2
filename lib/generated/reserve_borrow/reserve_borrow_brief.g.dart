// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/reserve_borrow/reserve_borrow_brief.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReserveBorrowBriefCollection on Isar {
  IsarCollection<ReserveBorrowBrief> get reserveBorrowBriefs =>
      this.collection();
}

const ReserveBorrowBriefSchema = CollectionSchema(
  name: r'ReserveBorrowBrief',
  id: -4551235672382916008,
  properties: {
    r'coverMUrl': PropertySchema(
      id: 0,
      name: r'coverMUrl',
      type: IsarType.string,
    ),
    r'deadlineStr': PropertySchema(
      id: 1,
      name: r'deadlineStr',
      type: IsarType.string,
    ),
    r'dueTime': PropertySchema(
      id: 2,
      name: r'dueTime',
      type: IsarType.dateTime,
    ),
    r'isbn': PropertySchema(
      id: 3,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'pickUpDeadline': PropertySchema(
      id: 4,
      name: r'pickUpDeadline',
      type: IsarType.dateTime,
    ),
    r'reserveId': PropertySchema(
      id: 5,
      name: r'reserveId',
      type: IsarType.long,
    ),
    r'reserveTime': PropertySchema(
      id: 6,
      name: r'reserveTime',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.long,
      enumMap: _ReserveBorrowBriefstatusEnumValueMap,
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
  estimateSize: _reserveBorrowBriefEstimateSize,
  serialize: _reserveBorrowBriefSerialize,
  deserialize: _reserveBorrowBriefDeserialize,
  deserializeProp: _reserveBorrowBriefDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId_status': IndexSchema(
      id: 4561524919065236789,
      name: r'userId_status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'reserveId': IndexSchema(
      id: 8112811362481228815,
      name: r'reserveId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'reserveId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'reserveTime': IndexSchema(
      id: 8483073778675482765,
      name: r'reserveTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reserveTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _reserveBorrowBriefGetId,
  getLinks: _reserveBorrowBriefGetLinks,
  attach: _reserveBorrowBriefAttach,
  version: '3.1.0+1',
);

int _reserveBorrowBriefEstimateSize(
  ReserveBorrowBrief object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.coverMUrl.length * 3;
  bytesCount += 3 + object.deadlineStr.length * 3;
  bytesCount += 3 + object.isbn.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _reserveBorrowBriefSerialize(
  ReserveBorrowBrief object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.coverMUrl);
  writer.writeString(offsets[1], object.deadlineStr);
  writer.writeDateTime(offsets[2], object.dueTime);
  writer.writeString(offsets[3], object.isbn);
  writer.writeDateTime(offsets[4], object.pickUpDeadline);
  writer.writeLong(offsets[5], object.reserveId);
  writer.writeDateTime(offsets[6], object.reserveTime);
  writer.writeLong(offsets[7], object.status.code);
  writer.writeString(offsets[8], object.title);
  writer.writeLong(offsets[9], object.userId);
}

ReserveBorrowBrief _reserveBorrowBriefDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReserveBorrowBrief(
    coverMUrl: reader.readString(offsets[0]),
    dueTime: reader.readDateTime(offsets[2]),
    isbn: reader.readString(offsets[3]),
    pickUpDeadline: reader.readDateTime(offsets[4]),
    reserveId: reader.readLong(offsets[5]),
    reserveTime: reader.readDateTime(offsets[6]),
    status: _ReserveBorrowBriefstatusValueEnumMap[
            reader.readLongOrNull(offsets[7])] ??
        ReserveBorrowStatus.WaitingPickUp,
    title: reader.readString(offsets[8]),
  );
  object.id = id;
  object.userId = reader.readLong(offsets[9]);
  return object;
}

P _reserveBorrowBriefDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (_ReserveBorrowBriefstatusValueEnumMap[
              reader.readLongOrNull(offset)] ??
          ReserveBorrowStatus.WaitingPickUp) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ReserveBorrowBriefstatusEnumValueMap = {
  'WaitingPickUp': 0,
  'OverduePickUp': 1,
  'Cancelled': 2,
  'WaitingReturn': 3,
  'Returned': 4,
  'OverdueReturn': 5,
  'CantReturn': 6,
};
const _ReserveBorrowBriefstatusValueEnumMap = {
  0: ReserveBorrowStatus.WaitingPickUp,
  1: ReserveBorrowStatus.OverduePickUp,
  2: ReserveBorrowStatus.Cancelled,
  3: ReserveBorrowStatus.WaitingReturn,
  4: ReserveBorrowStatus.Returned,
  5: ReserveBorrowStatus.OverdueReturn,
  6: ReserveBorrowStatus.CantReturn,
};

Id _reserveBorrowBriefGetId(ReserveBorrowBrief object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reserveBorrowBriefGetLinks(
    ReserveBorrowBrief object) {
  return [];
}

void _reserveBorrowBriefAttach(
    IsarCollection<dynamic> col, Id id, ReserveBorrowBrief object) {
  object.id = id;
}

extension ReserveBorrowBriefByIndex on IsarCollection<ReserveBorrowBrief> {
  Future<ReserveBorrowBrief?> getByReserveId(int reserveId) {
    return getByIndex(r'reserveId', [reserveId]);
  }

  ReserveBorrowBrief? getByReserveIdSync(int reserveId) {
    return getByIndexSync(r'reserveId', [reserveId]);
  }

  Future<bool> deleteByReserveId(int reserveId) {
    return deleteByIndex(r'reserveId', [reserveId]);
  }

  bool deleteByReserveIdSync(int reserveId) {
    return deleteByIndexSync(r'reserveId', [reserveId]);
  }

  Future<List<ReserveBorrowBrief?>> getAllByReserveId(
      List<int> reserveIdValues) {
    final values = reserveIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'reserveId', values);
  }

  List<ReserveBorrowBrief?> getAllByReserveIdSync(List<int> reserveIdValues) {
    final values = reserveIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'reserveId', values);
  }

  Future<int> deleteAllByReserveId(List<int> reserveIdValues) {
    final values = reserveIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'reserveId', values);
  }

  int deleteAllByReserveIdSync(List<int> reserveIdValues) {
    final values = reserveIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'reserveId', values);
  }

  Future<Id> putByReserveId(ReserveBorrowBrief object) {
    return putByIndex(r'reserveId', object);
  }

  Id putByReserveIdSync(ReserveBorrowBrief object, {bool saveLinks = true}) {
    return putByIndexSync(r'reserveId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByReserveId(List<ReserveBorrowBrief> objects) {
    return putAllByIndex(r'reserveId', objects);
  }

  List<Id> putAllByReserveIdSync(List<ReserveBorrowBrief> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'reserveId', objects, saveLinks: saveLinks);
  }
}

extension ReserveBorrowBriefQueryWhereSort
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QWhere> {
  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhere>
      anyUserIdStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId_status'),
      );
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhere>
      anyReserveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'reserveId'),
      );
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhere>
      anyReserveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'reserveTime'),
      );
    });
  }
}

extension ReserveBorrowBriefQueryWhere
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QWhereClause> {
  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdEqualToAnyStatus(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_status',
        value: [userId],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdNotEqualToAnyStatus(int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdGreaterThanAnyStatus(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_status',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdLessThanAnyStatus(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_status',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdBetweenAnyStatus(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_status',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdStatusEqualTo(int userId, ReserveBorrowStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_status',
        value: [userId, status],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdEqualToStatusNotEqualTo(int userId, ReserveBorrowStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [userId],
              upper: [userId, status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [userId, status],
              includeLower: false,
              upper: [userId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [userId, status],
              includeLower: false,
              upper: [userId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_status',
              lower: [userId],
              upper: [userId, status],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdEqualToStatusGreaterThan(
    int userId,
    ReserveBorrowStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_status',
        lower: [userId, status],
        includeLower: include,
        upper: [userId],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdEqualToStatusLessThan(
    int userId,
    ReserveBorrowStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_status',
        lower: [userId],
        upper: [userId, status],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      userIdEqualToStatusBetween(
    int userId,
    ReserveBorrowStatus lowerStatus,
    ReserveBorrowStatus upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_status',
        lower: [userId, lowerStatus],
        includeLower: includeLower,
        upper: [userId, upperStatus],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveIdEqualTo(int reserveId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reserveId',
        value: [reserveId],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveIdNotEqualTo(int reserveId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveId',
              lower: [],
              upper: [reserveId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveId',
              lower: [reserveId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveId',
              lower: [reserveId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveId',
              lower: [],
              upper: [reserveId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveIdGreaterThan(
    int reserveId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reserveId',
        lower: [reserveId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveIdLessThan(
    int reserveId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reserveId',
        lower: [],
        upper: [reserveId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveIdBetween(
    int lowerReserveId,
    int upperReserveId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reserveId',
        lower: [lowerReserveId],
        includeLower: includeLower,
        upper: [upperReserveId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveTimeEqualTo(DateTime reserveTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reserveTime',
        value: [reserveTime],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveTimeNotEqualTo(DateTime reserveTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveTime',
              lower: [],
              upper: [reserveTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveTime',
              lower: [reserveTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveTime',
              lower: [reserveTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reserveTime',
              lower: [],
              upper: [reserveTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveTimeGreaterThan(
    DateTime reserveTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reserveTime',
        lower: [reserveTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveTimeLessThan(
    DateTime reserveTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reserveTime',
        lower: [],
        upper: [reserveTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterWhereClause>
      reserveTimeBetween(
    DateTime lowerReserveTime,
    DateTime upperReserveTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reserveTime',
        lower: [lowerReserveTime],
        includeLower: includeLower,
        upper: [upperReserveTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReserveBorrowBriefQueryFilter
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QFilterCondition> {
  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      coverMUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverMUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      coverMUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverMUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      coverMUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      coverMUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverMUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deadlineStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deadlineStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deadlineStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deadlineStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deadlineStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deadlineStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deadlineStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deadlineStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deadlineStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      deadlineStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deadlineStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      dueTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      dueTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      dueTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      dueTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      isbnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      pickUpDeadlineEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickUpDeadline',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      pickUpDeadlineGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickUpDeadline',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      pickUpDeadlineLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickUpDeadline',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      pickUpDeadlineBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickUpDeadline',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reserveId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reserveId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reserveId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reserveId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reserveTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reserveTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reserveTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      reserveTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reserveTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      statusEqualTo(ReserveBorrowStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      statusGreaterThan(
    ReserveBorrowStatus value, {
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      statusLessThan(
    ReserveBorrowStatus value, {
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      statusBetween(
    ReserveBorrowStatus lower,
    ReserveBorrowStatus upper, {
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterFilterCondition>
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

extension ReserveBorrowBriefQueryObject
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QFilterCondition> {}

extension ReserveBorrowBriefQueryLinks
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QFilterCondition> {}

extension ReserveBorrowBriefQuerySortBy
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QSortBy> {
  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByDeadlineStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadlineStr', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByDeadlineStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadlineStr', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByDueTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueTime', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByDueTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueTime', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByPickUpDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickUpDeadline', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByPickUpDeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickUpDeadline', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByReserveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveId', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByReserveIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveId', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByReserveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveTime', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByReserveTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveTime', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ReserveBorrowBriefQuerySortThenBy
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QSortThenBy> {
  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByCoverMUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByCoverMUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverMUrl', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByDeadlineStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadlineStr', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByDeadlineStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadlineStr', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByDueTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueTime', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByDueTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueTime', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByPickUpDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickUpDeadline', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByPickUpDeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickUpDeadline', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByReserveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveId', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByReserveIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveId', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByReserveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveTime', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByReserveTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserveTime', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ReserveBorrowBriefQueryWhereDistinct
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct> {
  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByCoverMUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverMUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByDeadlineStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deadlineStr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByDueTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueTime');
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByIsbn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByPickUpDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickUpDeadline');
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByReserveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reserveId');
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByReserveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reserveTime');
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension ReserveBorrowBriefQueryProperty
    on QueryBuilder<ReserveBorrowBrief, ReserveBorrowBrief, QQueryProperty> {
  QueryBuilder<ReserveBorrowBrief, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReserveBorrowBrief, String, QQueryOperations>
      coverMUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverMUrl');
    });
  }

  QueryBuilder<ReserveBorrowBrief, String, QQueryOperations>
      deadlineStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deadlineStr');
    });
  }

  QueryBuilder<ReserveBorrowBrief, DateTime, QQueryOperations>
      dueTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueTime');
    });
  }

  QueryBuilder<ReserveBorrowBrief, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<ReserveBorrowBrief, DateTime, QQueryOperations>
      pickUpDeadlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickUpDeadline');
    });
  }

  QueryBuilder<ReserveBorrowBrief, int, QQueryOperations> reserveIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reserveId');
    });
  }

  QueryBuilder<ReserveBorrowBrief, DateTime, QQueryOperations>
      reserveTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reserveTime');
    });
  }

  QueryBuilder<ReserveBorrowBrief, ReserveBorrowStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ReserveBorrowBrief, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ReserveBorrowBrief, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReserveBorrowBrief _$ReserveBorrowBriefFromJson(Map<String, dynamic> json) =>
    ReserveBorrowBrief(
      reserveId: (json['reserve_id'] as num).toInt(),
      status: $enumDecode(_$ReserveBorrowStatusEnumMap, json['status']),
      title: json['title'] as String,
      isbn: json['isbn'] as String,
      reserveTime: DateTime.parse(json['reserve_time'] as String),
      pickUpDeadline: DateTime.parse(json['pick_up_deadline'] as String),
      dueTime: DateTime.parse(json['due_time'] as String),
      coverMUrl: json['cover_m_url'] as String,
    );

Map<String, dynamic> _$ReserveBorrowBriefToJson(ReserveBorrowBrief instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'reserve_id': instance.reserveId,
      'status': _$ReserveBorrowStatusEnumMap[instance.status]!,
      'title': instance.title,
      'isbn': instance.isbn,
      'reserve_time': instance.reserveTime.toIso8601String(),
      'pick_up_deadline': instance.pickUpDeadline.toIso8601String(),
      'due_time': instance.dueTime.toIso8601String(),
      'cover_m_url': instance.coverMUrl,
    };

const _$ReserveBorrowStatusEnumMap = {
  ReserveBorrowStatus.WaitingPickUp: 0,
  ReserveBorrowStatus.OverduePickUp: 1,
  ReserveBorrowStatus.Cancelled: 2,
  ReserveBorrowStatus.WaitingReturn: 3,
  ReserveBorrowStatus.Returned: 4,
  ReserveBorrowStatus.OverdueReturn: 5,
  ReserveBorrowStatus.CantReturn: 6,
};
