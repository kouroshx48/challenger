import 'package:hive_flutter/adapters.dart';
part 'mission.g.dart';

@HiveType(typeId: 5)
class Mission{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int expAmount;
  @HiveField(2)
  final String description;

  Mission({
   required this.name,
   required this.expAmount,
    this.description = ''
  });

}