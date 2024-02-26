import 'package:isar/isar.dart';
part 'mission.g.dart';

@embedded
class Mission{
  final String? name;
  final int? expAmount;
  final String? description;

  Mission({
    this.name,
    this.expAmount,
    this.description
  });

}