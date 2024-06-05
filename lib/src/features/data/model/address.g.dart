// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num?)?.toInt(),
      street: json['street'] as String?,
      streetName: json['streetName'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      country: json['country'] as String?,
      countyCode: json['county_code'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'streetName': instance.streetName,
      'buildingNumber': instance.buildingNumber,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'country': instance.country,
      'county_code': instance.countyCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
