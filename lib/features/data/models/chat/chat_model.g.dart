// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['id'] as String,
      dateUpdated: json['dateUpdated'] as int,
      typing:
          (json['typing'] as List<dynamic>).map((e) => e as String).toList(),
      unread: json['unread'] as Map<String, dynamic>,
      participants: json['participants'] as List<dynamic>,
      latestMessage: json['latestMessage'] == null
          ? null
          : LatestMessage.fromJson(
              json['latestMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateUpdated': instance.dateUpdated,
      'typing': instance.typing,
      'unread': instance.unread,
      'participants': instance.participants,
      'latestMessage': instance.latestMessage,
    };
