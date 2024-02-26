// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SkillSchema = Schema(
  name: r'Skill',
  id: 4092444674663721600,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'relatedTopics': PropertySchema(
      id: 1,
      name: r'relatedTopics',
      type: IsarType.objectList,
      target: r'Topic',
    ),
    r'skillLeveling': PropertySchema(
      id: 2,
      name: r'skillLeveling',
      type: IsarType.object,
      target: r'Leveling',
    ),
    r'skillType': PropertySchema(
      id: 3,
      name: r'skillType',
      type: IsarType.string,
    )
  },
  estimateSize: _skillEstimateSize,
  serialize: _skillSerialize,
  deserialize: _skillDeserialize,
  deserializeProp: _skillDeserializeProp,
);

int _skillEstimateSize(
  Skill object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.relatedTopics;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Topic]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += TopicSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 +
      LevelingSchema.estimateSize(
          object.skillLeveling, allOffsets[Leveling]!, allOffsets);
  {
    final value = object.skillType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _skillSerialize(
  Skill object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<Topic>(
    offsets[1],
    allOffsets,
    TopicSchema.serialize,
    object.relatedTopics,
  );
  writer.writeObject<Leveling>(
    offsets[2],
    allOffsets,
    LevelingSchema.serialize,
    object.skillLeveling,
  );
  writer.writeString(offsets[3], object.skillType);
}

Skill _skillDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Skill(
    name: reader.readStringOrNull(offsets[0]),
    relatedTopics: reader.readObjectList<Topic>(
      offsets[1],
      TopicSchema.deserialize,
      allOffsets,
      Topic(),
    ),
    skillType: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _skillDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Topic>(
        offset,
        TopicSchema.deserialize,
        allOffsets,
        Topic(),
      )) as P;
    case 2:
      return (reader.readObjectOrNull<Leveling>(
            offset,
            LevelingSchema.deserialize,
            allOffsets,
          ) ??
          Leveling()) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SkillQueryFilter on QueryBuilder<Skill, Skill, QFilterCondition> {
  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relatedTopics',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relatedTopics',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsLengthEqualTo(
      int length) {
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsIsEmpty() {
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsIsNotEmpty() {
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsLengthLessThan(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition>
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsLengthBetween(
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

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skillType',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skillType',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skillType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skillType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skillType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skillType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'skillType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'skillType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'skillType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'skillType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skillType',
        value: '',
      ));
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skillType',
        value: '',
      ));
    });
  }
}

extension SkillQueryObject on QueryBuilder<Skill, Skill, QFilterCondition> {
  QueryBuilder<Skill, Skill, QAfterFilterCondition> relatedTopicsElement(
      FilterQuery<Topic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'relatedTopics');
    });
  }

  QueryBuilder<Skill, Skill, QAfterFilterCondition> skillLeveling(
      FilterQuery<Leveling> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'skillLeveling');
    });
  }
}
