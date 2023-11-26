// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Desire _$DesireFromJson(Map<String, dynamic> json) => Desire(
      title: json['title'] as String,
      description: json['description'] as String,
      creator: json['creator'] as String,
    )..id = json['id'] as String?;

Map<String, dynamic> _$DesireToJson(Desire instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'creator': instance.creator,
      'id': instance.id,
    };
