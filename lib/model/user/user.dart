import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  List<Data>? data;
  int? total;
  int? page;
  int? limit;

  User({this.data, this.total, this.page, this.limit});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Data {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Data({this.id, this.title, this.firstName, this.lastName, this.picture});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

