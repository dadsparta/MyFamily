import 'package:json_annotation/json_annotation.dart';

part 'desire.g.dart';

@JsonSerializable()
class Desire {
  final String title;
  final String description;
  final String creator;
  String imagePath = 'null';
  String imageId = 'null';
  String? id;

  Desire(
      {required this.title,
      required this.description,
      required this.creator,
      required this.imagePath, required this.imageId});

  factory Desire.fromJson(Map<String, dynamic> json) => _$DesireFromJson(json);

  Map<String, dynamic> toJson() => _$DesireToJson(this);
}
