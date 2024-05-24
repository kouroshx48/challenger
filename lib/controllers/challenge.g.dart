// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ChallengeSchema = Schema(
  name: r'Challenge',
  id: 784059437258421421,
  properties: {
    r'dailySteps': PropertySchema(
      id: 0,
      name: r'dailySteps',
      type: IsarType.objectList,
      target: r'DailyQuest',
    ),
    r'days': PropertySchema(
      id: 1,
      name: r'days',
      type: IsarType.long,
    ),
    r'goal': PropertySchema(
      id: 2,
      name: r'goal',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'relatedTopics': PropertySchema(
      id: 4,
      name: r'relatedTopics',
      type: IsarType.objectList,
      target: r'Topic',
    ),
    r'startDate': PropertySchema(
      id: 5,
      name: r'startDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _challengeEstimateSize,
  serialize: _challengeSerialize,
  deserialize: _challengeDeserialize,
  deserializeProp: _challengeDeserializeProp,
);

int _challengeEstimateSize(
  Challenge object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dailySteps.length * 3;
  {
    final offsets = allOffsets[DailyQuest]!;
    for (var i = 0; i < object.dailySteps.length; i++) {
      final value = object.dailySteps[i];
      bytesCount += DailyQuestSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.relatedTopics.length * 3;
  {
    final offsets = allOffsets[Topic]!;
    for (var i = 0; i < object.relatedTopics.length; i++) {
      final value = object.relatedTopics[i];
      bytesCount += TopicSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _challengeSerialize(
  Challenge object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<DailyQuest>(
    offsets[0],
    allOffsets,
    DailyQuestSchema.serialize,
    object.dailySteps,
  );
  writer.writeLong(offsets[1], object.days);
  writer.writeLong(offsets[2], object.goal);
  writer.writeString(offsets[3], object.name);
  writer.writeObjectList<Topic>(
    offsets[4],
    allOffsets,
    TopicSchema.serialize,
    object.relatedTopics,
  );
  writer.writeDateTime(offsets[5], object.startDate);
}

Challenge _challengeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Challenge();
  object.dailySteps = reader.readObjectList<DailyQuest>(
        offsets[0],
        DailyQuestSchema.deserialize,
        allOffsets,
        DailyQuest(),
      ) ??
      [];
  object.days = reader.readLongOrNull(offsets[1]);
  object.goal = reader.readLongOrNull(offsets[2]);
  object.name = reader.readStringOrNull(offsets[3]);
  object.relatedTopics = reader.readObjectList<Topic>(
        offsets[4],
        TopicSchema.deserialize,
        allOffsets,
        Topic(),
      ) ??
      [];
  object.startDate = reader.readDateTimeOrNull(offsets[5]);
  return object;
}

P _challengeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<DailyQuest>(
            offset,
            DailyQuestSchema.deserialize,
            allOffsets,
            DailyQuest(),
          ) ??
          []) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<Topic>(
            offset,
            TopicSchema.deserialize,
            allOffsets,
            Topic(),
          ) ??
          []) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ChallengeQueryFilter
    on QueryBuilder<Challenge, Challenge, QFilterCondition> {
  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      dailyStepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dailySteps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      dailyStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dailySteps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      dailyStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dailySteps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      dailyStepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dailySteps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      dailyStepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dailySteps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      dailyStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dailySteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> daysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'days',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> daysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'days',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> daysEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> daysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> daysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> daysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'days',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> goalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'goal',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> goalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'goal',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> goalEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goal',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> goalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goal',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> goalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goal',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> goalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      relatedTopicsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedTopics',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      relatedTopicsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedTopics',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      relatedTopicsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedTopics',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      relatedTopicsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedTopics',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      relatedTopicsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedTopics',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      relatedTopicsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedTopics',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> startDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChallengeQueryObject
    on QueryBuilder<Challenge, Challenge, QFilterCondition> {
  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> dailyStepsElement(
      FilterQuery<DailyQuest> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dailySteps');
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      relatedTopicsElement(FilterQuery<Topic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'relatedTopics');
    });
  }
}
