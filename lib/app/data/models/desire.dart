import 'package:json_annotation/json_annotation.dart';
import 'package:myfamily/core/values/gender_types.dart';

part 'desire.g.dart';

@JsonSerializable()
class Desire {
  String title;
  String description;
  GenderTypes creator;
  String imagePath = 'null';
  String? id;

  Desire(
      {required this.title,
      required this.description,
      required this.creator,
      required this.imagePath,});

  factory Desire.fromJson(Map<String, dynamic> json) => _$DesireFromJson(json);

  Map<String, dynamic> toJson() => _$DesireToJson(this);
}
