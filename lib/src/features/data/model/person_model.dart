import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  PersonModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.website,
    required this.image,
  });

  final int? id;
  static const String idKey = "id";

  final String? firstname;
  static const String firstnameKey = "firstname";

  final String? lastname;
  static const String lastnameKey = "lastname";

  final String? email;
  static const String emailKey = "email";

  final String? phone;
  static const String phoneKey = "phone";

  final DateTime? birthday;
  static const String birthdayKey = "birthday";

  final String? gender;
  static const String genderKey = "gender";

  final Address? address;
  static const String addressKey = "address";

  final String? website;
  static const String websiteKey = "website";

  final String? image;
  static const String imageKey = "image";

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
