// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResponse _$$_AuthResponseFromJson(Map<String, dynamic> json) =>
    _$_AuthResponse(
      user: json['user'] ?? const {},
      error: json['error'] ?? '',
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AuthResponseToJson(_$_AuthResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'error': instance.error,
      'hasError': instance.hasError,
    };
