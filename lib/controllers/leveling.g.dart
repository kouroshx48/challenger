// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leveling.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LevelingSchema = Schema(
  name: r'Leveling',
  id: 6772248074131685390,
  properties: {
    r'configer': PropertySchema(
      id: 0,
      name: r'configer',
      type: IsarType.long,
    ),
    r'exp': PropertySchema(
      id: 1,
      name: r'exp',
      type: IsarType.long,
    ),
    r'level': PropertySchema(
      id: 2,
      name: r'level',
      type: IsarType.long,
    ),
    r'levelUpExp': PropertySchema(
      id: 3,
      name: r'levelUpExp',
      type: IsarType.long,
    )
  },
  estimateSize: _levelingEstimateSize,
  serialize: _levelingSerialize,
  deserialize: _levelingDeserialize,
  deserializeProp: _levelingDeserializeProp,
);

int _levelingEstimateSize(
  Leveling object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _levelingSerialize(
  Leveling object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.configer);
  writer.writeLong(offsets[1], object.exp);
  writer.writeLong(offsets[2], object.level);
  writer.writeLong(offsets[3], object.levelUpExp);
}

Leveling _levelingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Leveling(
    configer: reader.readLongOrNull(offsets[0]),
  );
  object.exp = reader.readLong(offsets[1]);
  object.level = reader.readLong(offsets[2]);
  object.levelUpExp = reader.readLong(offsets[3]);
  return object;
}

P _levelingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LevelingQueryFilter
    on QueryBuilder<Leveling, Leveling, QFilterCondition> {
  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> configerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'configer',
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> configerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'configer',
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> configerEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'configer',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> configerGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'configer',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> configerLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'configer',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> configerBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'configer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> expEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exp',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> expGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exp',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> expLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exp',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> expBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelUpExpEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelUpExp',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelUpExpGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'levelUpExp',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelUpExpLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'levelUpExp',
        value: value,
      ));
    });
  }

  QueryBuilder<Leveling, Leveling, QAfterFilterCondition> levelUpExpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'levelUpExp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LevelingQueryObject
    on QueryBuilder<Leveling, Leveling, QFilterCondition> {}
