// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_quest.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DailyQuestSchema = Schema(
  name: r'DailyQuest',
  id: -2538479229630709128,
  properties: {
    r'canceledDates': PropertySchema(
      id: 0,
      name: r'canceledDates',
      type: IsarType.dateTimeList,
    ),
    r'completedDates': PropertySchema(
      id: 1,
      name: r'completedDates',
      type: IsarType.dateTimeList,
    ),
    r'expAmount': PropertySchema(
      id: 2,
      name: r'expAmount',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'repeat': PropertySchema(
      id: 4,
      name: r'repeat',
      type: IsarType.bool,
    ),
    r'streak': PropertySchema(
      id: 5,
      name: r'streak',
      type: IsarType.long,
    ),
    r'timeToBeDone': PropertySchema(
      id: 6,
      name: r'timeToBeDone',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _dailyQuestEstimateSize,
  serialize: _dailyQuestSerialize,
  deserialize: _dailyQuestDeserialize,
  deserializeProp: _dailyQuestDeserializeProp,
);

int _dailyQuestEstimateSize(
  DailyQuest object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.canceledDates.length * 8;
  bytesCount += 3 + object.completedDates.length * 8;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dailyQuestSerialize(
  DailyQuest object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTimeList(offsets[0], object.canceledDates);
  writer.writeDateTimeList(offsets[1], object.completedDates);
  writer.writeLong(offsets[2], object.expAmount);
  writer.writeString(offsets[3], object.name);
  writer.writeBool(offsets[4], object.repeat);
  writer.writeLong(offsets[5], object.streak);
  writer.writeDateTime(offsets[6], object.timeToBeDone);
}

DailyQuest _dailyQuestDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyQuest(
    expAmount: reader.readLongOrNull(offsets[2]),
    name: reader.readStringOrNull(offsets[3]),
  );
  object.canceledDates = reader.readDateTimeList(offsets[0]) ?? [];
  object.completedDates = reader.readDateTimeList(offsets[1]) ?? [];
  object.repeat = reader.readBool(offsets[4]);
  object.streak = reader.readLong(offsets[5]);
  object.timeToBeDone = reader.readDateTimeOrNull(offsets[6]);
  return object;
}

P _dailyQuestDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTimeList(offset) ?? []) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DailyQuestQueryFilter
    on QueryBuilder<DailyQuest, DailyQuest, QFilterCondition> {
  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canceledDates',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canceledDates',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canceledDates',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canceledDates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canceledDates',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canceledDates',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canceledDates',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canceledDates',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canceledDates',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      canceledDatesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'canceledDates',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedDates',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedDates',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedDates',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedDates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDates',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDates',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDates',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDates',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDates',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      completedDatesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDates',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      expAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expAmount',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      expAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expAmount',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> expAmountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      expAmountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> expAmountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> expAmountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> repeatEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeat',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> streakEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> streakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> streakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition> streakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      timeToBeDoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeToBeDone',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      timeToBeDoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeToBeDone',
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      timeToBeDoneEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeToBeDone',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      timeToBeDoneGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeToBeDone',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      timeToBeDoneLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeToBeDone',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuest, DailyQuest, QAfterFilterCondition>
      timeToBeDoneBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeToBeDone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyQuestQueryObject
    on QueryBuilder<DailyQuest, DailyQuest, QFilterCondition> {}
