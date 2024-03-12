// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChallengerCollection on Isar {
  IsarCollection<Challenger> get challengers => this.collection();
}

const ChallengerSchema = CollectionSchema(
  name: r'Challenger',
  id: 7817116215072824805,
  properties: {
    r'email': PropertySchema(
      id: 0,
      name: r'email',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 1,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'topicsList': PropertySchema(
      id: 2,
      name: r'topicsList',
      type: IsarType.objectList,
      target: r'Topic',
    ),
    r'userLeveling': PropertySchema(
      id: 3,
      name: r'userLeveling',
      type: IsarType.object,
      target: r'Leveling',
    ),
    r'userMissions': PropertySchema(
      id: 4,
      name: r'userMissions',
      type: IsarType.objectList,
      target: r'Mission',
    ),
    r'userQuests': PropertySchema(
      id: 5,
      name: r'userQuests',
      type: IsarType.objectList,
      target: r'DailyQuest',
    ),
    r'userSettings': PropertySchema(
      id: 6,
      name: r'userSettings',
      type: IsarType.object,
      target: r'UserSettings',
    ),
    r'userSkills': PropertySchema(
      id: 7,
      name: r'userSkills',
      type: IsarType.objectList,
      target: r'Skill',
    )
  },
  estimateSize: _challengerEstimateSize,
  serialize: _challengerSerialize,
  deserialize: _challengerDeserialize,
  deserializeProp: _challengerDeserializeProp,
  idName: r'id',
  indexes: {
    r'email': IndexSchema(
      id: -26095440403582047,
      name: r'email',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'email',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'Leveling': LevelingSchema,
    r'UserSettings': UserSettingsSchema,
    r'Topic': TopicSchema,
    r'Mission': MissionSchema,
    r'Skill': SkillSchema,
    r'SkillTimer': SkillTimerSchema,
    r'DailyQuest': DailyQuestSchema
  },
  getId: _challengerGetId,
  getLinks: _challengerGetLinks,
  attach: _challengerAttach,
  version: '3.1.0+1',
);

int _challengerEstimateSize(
  Challenger object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.topicsList.length * 3;
  {
    final offsets = allOffsets[Topic]!;
    for (var i = 0; i < object.topicsList.length; i++) {
      final value = object.topicsList[i];
      bytesCount += TopicSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 +
      LevelingSchema.estimateSize(
          object.userLeveling, allOffsets[Leveling]!, allOffsets);
  bytesCount += 3 + object.userMissions.length * 3;
  {
    final offsets = allOffsets[Mission]!;
    for (var i = 0; i < object.userMissions.length; i++) {
      final value = object.userMissions[i];
      bytesCount += MissionSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.userQuests.length * 3;
  {
    final offsets = allOffsets[DailyQuest]!;
    for (var i = 0; i < object.userQuests.length; i++) {
      final value = object.userQuests[i];
      bytesCount += DailyQuestSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 +
      UserSettingsSchema.estimateSize(
          object.userSettings, allOffsets[UserSettings]!, allOffsets);
  bytesCount += 3 + object.userSkills.length * 3;
  {
    final offsets = allOffsets[Skill]!;
    for (var i = 0; i < object.userSkills.length; i++) {
      final value = object.userSkills[i];
      bytesCount += SkillSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _challengerSerialize(
  Challenger object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.email);
  writer.writeString(offsets[1], object.fullName);
  writer.writeObjectList<Topic>(
    offsets[2],
    allOffsets,
    TopicSchema.serialize,
    object.topicsList,
  );
  writer.writeObject<Leveling>(
    offsets[3],
    allOffsets,
    LevelingSchema.serialize,
    object.userLeveling,
  );
  writer.writeObjectList<Mission>(
    offsets[4],
    allOffsets,
    MissionSchema.serialize,
    object.userMissions,
  );
  writer.writeObjectList<DailyQuest>(
    offsets[5],
    allOffsets,
    DailyQuestSchema.serialize,
    object.userQuests,
  );
  writer.writeObject<UserSettings>(
    offsets[6],
    allOffsets,
    UserSettingsSchema.serialize,
    object.userSettings,
  );
  writer.writeObjectList<Skill>(
    offsets[7],
    allOffsets,
    SkillSchema.serialize,
    object.userSkills,
  );
}

Challenger _challengerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Challenger(
    fullName: reader.readString(offsets[1]),
  );
  object.email = reader.readStringOrNull(offsets[0]);
  object.challengerId = id;
  object.userLeveling = reader.readObjectOrNull<Leveling>(
        offsets[3],
        LevelingSchema.deserialize,
        allOffsets,
      ) ??
      Leveling();
  object.userMissions = reader.readObjectList<Mission>(
        offsets[4],
        MissionSchema.deserialize,
        allOffsets,
        Mission(),
      ) ??
      [];
  object.userQuests = reader.readObjectList<DailyQuest>(
        offsets[5],
        DailyQuestSchema.deserialize,
        allOffsets,
        DailyQuest(),
      ) ??
      [];
  object.userSettings = reader.readObjectOrNull<UserSettings>(
        offsets[6],
        UserSettingsSchema.deserialize,
        allOffsets,
      ) ??
      UserSettings();
  object.userSkills = reader.readObjectList<Skill>(
        offsets[7],
        SkillSchema.deserialize,
        allOffsets,
        Skill(),
      ) ??
      [];
  return object;
}

P _challengerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectList<Topic>(
            offset,
            TopicSchema.deserialize,
            allOffsets,
            Topic(),
          ) ??
          []) as P;
    case 3:
      return (reader.readObjectOrNull<Leveling>(
            offset,
            LevelingSchema.deserialize,
            allOffsets,
          ) ??
          Leveling()) as P;
    case 4:
      return (reader.readObjectList<Mission>(
            offset,
            MissionSchema.deserialize,
            allOffsets,
            Mission(),
          ) ??
          []) as P;
    case 5:
      return (reader.readObjectList<DailyQuest>(
            offset,
            DailyQuestSchema.deserialize,
            allOffsets,
            DailyQuest(),
          ) ??
          []) as P;
    case 6:
      return (reader.readObjectOrNull<UserSettings>(
            offset,
            UserSettingsSchema.deserialize,
            allOffsets,
          ) ??
          UserSettings()) as P;
    case 7:
      return (reader.readObjectList<Skill>(
            offset,
            SkillSchema.deserialize,
            allOffsets,
            Skill(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _challengerGetId(Challenger object) {
  return object.challengerId;
}

List<IsarLinkBase<dynamic>> _challengerGetLinks(Challenger object) {
  return [];
}

void _challengerAttach(IsarCollection<dynamic> col, Id id, Challenger object) {
  object.challengerId = id;
}

extension ChallengerByIndex on IsarCollection<Challenger> {
  Future<Challenger?> getByEmail(String? email) {
    return getByIndex(r'email', [email]);
  }

  Challenger? getByEmailSync(String? email) {
    return getByIndexSync(r'email', [email]);
  }

  Future<bool> deleteByEmail(String? email) {
    return deleteByIndex(r'email', [email]);
  }

  bool deleteByEmailSync(String? email) {
    return deleteByIndexSync(r'email', [email]);
  }

  Future<List<Challenger?>> getAllByEmail(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndex(r'email', values);
  }

  List<Challenger?> getAllByEmailSync(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'email', values);
  }

  Future<int> deleteAllByEmail(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'email', values);
  }

  int deleteAllByEmailSync(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'email', values);
  }

  Future<Id> putByEmail(Challenger object) {
    return putByIndex(r'email', object);
  }

  Id putByEmailSync(Challenger object, {bool saveLinks = true}) {
    return putByIndexSync(r'email', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEmail(List<Challenger> objects) {
    return putAllByIndex(r'email', objects);
  }

  List<Id> putAllByEmailSync(List<Challenger> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'email', objects, saveLinks: saveLinks);
  }
}

extension ChallengerQueryWhereSort
    on QueryBuilder<Challenger, Challenger, QWhere> {
  QueryBuilder<Challenger, Challenger, QAfterWhere> anyChallengerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChallengerQueryWhere
    on QueryBuilder<Challenger, Challenger, QWhereClause> {
  QueryBuilder<Challenger, Challenger, QAfterWhereClause> challengerIdEqualTo(
      Id challengerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: challengerId,
        upper: challengerId,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause>
      challengerIdNotEqualTo(Id challengerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: challengerId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: challengerId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: challengerId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: challengerId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause>
      challengerIdGreaterThan(Id challengerId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: challengerId, includeLower: include),
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause> challengerIdLessThan(
      Id challengerId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: challengerId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause> challengerIdBetween(
    Id lowerChallengerId,
    Id upperChallengerId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerChallengerId,
        includeLower: includeLower,
        upper: upperChallengerId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'email',
        value: [null],
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'email',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause> emailEqualTo(
      String? email) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'email',
        value: [email],
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterWhereClause> emailNotEqualTo(
      String? email) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ChallengerQueryFilter
    on QueryBuilder<Challenger, Challenger, QFilterCondition> {
  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> fullNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      fullNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> fullNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> fullNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> fullNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> fullNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      challengerIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      challengerIdGreaterThan(
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

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      challengerIdLessThan(
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

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      challengerIdBetween(
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

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      topicsListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicsList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      topicsListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicsList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      topicsListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicsList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      topicsListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicsList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      topicsListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicsList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      topicsListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicsList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userMissionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userMissions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userMissionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userMissions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userMissionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userMissions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userMissionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userMissions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userMissionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userMissions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userMissionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userMissions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userQuestsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userQuests',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userQuestsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userQuests',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userQuestsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userQuests',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userQuestsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userQuests',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userQuestsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userQuests',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userQuestsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userQuests',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userSkillsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userSkills',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userSkillsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userSkills',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userSkillsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userSkills',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userSkillsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userSkills',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userSkillsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userSkills',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userSkillsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userSkills',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ChallengerQueryObject
    on QueryBuilder<Challenger, Challenger, QFilterCondition> {
  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> topicsListElement(
      FilterQuery<Topic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'topicsList');
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> userLeveling(
      FilterQuery<Leveling> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'userLeveling');
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition>
      userMissionsElement(FilterQuery<Mission> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'userMissions');
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> userQuestsElement(
      FilterQuery<DailyQuest> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'userQuests');
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> userSettings(
      FilterQuery<UserSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'userSettings');
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterFilterCondition> userSkillsElement(
      FilterQuery<Skill> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'userSkills');
    });
  }
}

extension ChallengerQueryLinks
    on QueryBuilder<Challenger, Challenger, QFilterCondition> {}

extension ChallengerQuerySortBy
    on QueryBuilder<Challenger, Challenger, QSortBy> {
  QueryBuilder<Challenger, Challenger, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }
}

extension ChallengerQuerySortThenBy
    on QueryBuilder<Challenger, Challenger, QSortThenBy> {
  QueryBuilder<Challenger, Challenger, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> thenByChallengerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Challenger, Challenger, QAfterSortBy> thenByChallengerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ChallengerQueryWhereDistinct
    on QueryBuilder<Challenger, Challenger, QDistinct> {
  QueryBuilder<Challenger, Challenger, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Challenger, Challenger, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }
}

extension ChallengerQueryProperty
    on QueryBuilder<Challenger, Challenger, QQueryProperty> {
  QueryBuilder<Challenger, int, QQueryOperations> challengerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Challenger, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<Challenger, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<Challenger, List<Topic>, QQueryOperations> topicsListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicsList');
    });
  }

  QueryBuilder<Challenger, Leveling, QQueryOperations> userLevelingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLeveling');
    });
  }

  QueryBuilder<Challenger, List<Mission>, QQueryOperations>
      userMissionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userMissions');
    });
  }

  QueryBuilder<Challenger, List<DailyQuest>, QQueryOperations>
      userQuestsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userQuests');
    });
  }

  QueryBuilder<Challenger, UserSettings, QQueryOperations>
      userSettingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userSettings');
    });
  }

  QueryBuilder<Challenger, List<Skill>, QQueryOperations> userSkillsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userSkills');
    });
  }
}
