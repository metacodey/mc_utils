// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mc_utils/mc_utils.dart';

class UserModel with CustomDropdownListFilter {
  final int id;
  final String name;
  final int age;
  const UserModel({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    //choose varible that you want to display in drop down btn
    return name;
  }

  @override
  bool filter(String query) {
    //choos varible that you want to search by it
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
