// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_timer.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SkillTimerSchema = Schema(
  name: r'SkillTimer',
  id: 8933754147982868619,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'timeSpent': PropertySchema(
      id: 1,
      name: r'timeSpent',
      type: IsarType.long,
    ),
    r'timerEnd': PropertySchema(
      id: 2,
      name: r'timerEnd',
      type: IsarType.long,
    ),
    r'timerStart': PropertySchema(
      id: 3,
      name: r'timerStart',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _skillTimerEstimateSize,
  serialize: _skillTimerSerialize,
  deserialize: _skillTimerDeserialize,
  deserializeProp: _skillTimerDeserializeProp,
);

int _skillTimerEstimateSize(
  SkillTimer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _skillTimerSerialize(
  SkillTimer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.timeSpent);
  writer.writeLong(offsets[2], object.timerEnd);
  writer.writeDateTime(offsets[3], object.timerStart);
}

SkillTimer _skillTimerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SkillTimer();
  object.isActive = reader.readBool(offsets[0]);
  object.timeSpent = reader.readLong(offsets[1]);
  object.timerEnd = reader.readLong(offsets[2]);
  object.timerStart = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _skillTimerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SkillTimerQueryFilter
    on QueryBuilder<SkillTimer, SkillTimer, QFilterCondition> {
  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timeSpentEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeSpent',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition>
      timeSpentGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeSpent',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timeSpentLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeSpent',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timeSpentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeSpent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timerEndEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition>
      timerEndGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timerEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timerEndLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timerEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timerEndBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timerEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition>
      timerStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timerStart',
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition>
      timerStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timerStart',
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timerStartEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerStart',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition>
      timerStartGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timerStart',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition>
      timerStartLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timerStart',
        value: value,
      ));
    });
  }

  QueryBuilder<SkillTimer, SkillTimer, QAfterFilterCondition> timerStartBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timerStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SkillTimerQueryObject
    on QueryBuilder<SkillTimer, SkillTimer, QFilterCondition> {}
