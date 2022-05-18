// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserLocationModel _$$_UserLocationModelFromJson(Map<String, dynamic> json) =>
    _$_UserLocationModel(
      latitude: json['latitude'] as bool?,
      longitude: json['longitude'] as String?,
      bitmapImage: json['bitmapImage'] as String?,
      isLocationEnabled: json['isLocationEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserLocationModelToJson(
        _$_UserLocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'bitmapImage': instance.bitmapImage,
      'isLocationEnabled': instance.isLocationEnabled,
    };
