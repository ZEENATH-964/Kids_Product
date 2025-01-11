import 'package:hive/hive.dart';
 part 'userData.g.dart';
 
@HiveType(typeId:1)
class UserData {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String?phoneNumber;
  @HiveField(4)
  String?address;
  @HiveField(5)
  String? image;


  UserData({
    required this.name,
    required this.email,
     this.password,
    this.image,
    this.phoneNumber,
    this.address
  });
}