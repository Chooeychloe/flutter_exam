import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address({
    required this.id,
    required this.street,
    required this.streetName,
    required this.buildingNumber,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.countyCode,
    required this.latitude,
    required this.longitude,
  });

  final int? id;
  static const String idKey = "id";

  final String? street;
  static const String streetKey = "street";

  final String? streetName;
  static const String streetNameKey = "streetName";

  final String? buildingNumber;
  static const String buildingNumberKey = "buildingNumber";

  final String? city;
  static const String cityKey = "city";

  final String? zipcode;
  static const String zipcodeKey = "zipcode";

  final String? country;
  static const String countryKey = "country";

  @JsonKey(name: 'county_code')
  final String? countyCode;
  static const String countyCodeKey = "county_code";

  final double? latitude;
  static const String latitudeKey = "latitude";

  final double? longitude;
  static const String longitudeKey = "longitude";

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
