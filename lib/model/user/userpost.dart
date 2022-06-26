import 'package:json_annotation/json_annotation.dart';

part 'userpost.g.dart';

@JsonSerializable()
class UserPost {
  List<Data>? data;
  int? total;
  int? page;
  int? limit;

  UserPost({this.data, this.total, this.page, this.limit});

  factory UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);
  Map<String, dynamic> toJson() => _$UserPostToJson(this);
}

@JsonSerializable()
class Data {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  Owner? owner;

  Data(
      {this.id,
      this.image,
      this.likes,
      this.tags,
      this.text,
      this.publishDate,
      this.owner});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Owner {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Owner({this.id, this.title, this.firstName, this.lastName, this.picture});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}

