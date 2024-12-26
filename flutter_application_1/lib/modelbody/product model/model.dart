import 'package:hive/hive.dart';
  part 'model.g.dart';
@HiveType(typeId:0)
class KidsModel{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? price;
  @HiveField(2)
  String? discription;
  @HiveField(3)
  String? category;
  @HiveField(4)
  String? color;
  @HiveField(5)
  String? size;
  @HiveField(6)
  String? image;
  KidsModel(
    {required this.name,
    required this.price,
    required this.discription,
    required this.category,
    required this.color,
    required this.size,
     this.image
    }
  );
}