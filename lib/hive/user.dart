import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserList {
  UserList(
      {required this.userName, required this.name, required this.password});
  @HiveField(0)
  String userName;

  @HiveField(1)
  String name;

  @HiveField(2)
  String password;
}
