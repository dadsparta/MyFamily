// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Desire _$DesireFromJson(Map<String, dynamic> json) => Desire(
      title: json['title'] as String,
      description: json['description'] as String,
      creator: $enumDecode(_$GenderTypesEnumMap, json['creator']),
      imagePath: json['imagePath'] as String,
    )..id = json['id'] as String?;

Map<String, dynamic> _$DesireToJson(Desire instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'creator': _$GenderTypesEnumMap[instance.creator]!,
      'imagePath': instance.imagePath,
      'id': instance.id,
    };

const _$GenderTypesEnumMap = {
  GenderTypes.male: 'male',
  GenderTypes.female: 'female',
  GenderTypes.Own: 'Our',
};
