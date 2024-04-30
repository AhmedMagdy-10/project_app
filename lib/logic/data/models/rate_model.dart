import 'package:hive/hive.dart';

part 'rate_model.g.dart';

@HiveType(typeId: 0)
class RateModel extends HiveObject {
  @HiveField(0)
  int rate;
  @HiveField(1)
  final String date;
  // @HiveField(2)
  // String subTitle;
  // @HiveField(3)
  // int color;

  RateModel({
    required this.rate,
    // required this.color,
    required this.date,
    // required this.subTitle,
  });
}
