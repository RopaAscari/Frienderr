// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LatestMessage _$$_LatestMessageFromJson(Map<String, dynamic> json) =>
    _$_LatestMessage(
      date: json['date'] as int? ?? 0,
      count: json['count'] as int? ?? 0,
      message: json['message'] ?? const {},
    );

Map<String, dynamic> _$$_LatestMessageToJson(_$_LatestMessage instance) =>
    <String, dynamic>{
      'date': instance.date,
      'count': instance.count,
      'message': instance.message,
    };
