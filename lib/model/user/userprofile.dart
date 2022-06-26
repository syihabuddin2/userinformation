import 'package:json_annotation/json_annotation.dart';

part 'userprofile.g.dart';

@JsonSerializable()
class UserProfile {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;
  String? gender;
  String? email;
  String? dateOfBirth;
  String? phone;
  Location? location;
  String? registerDate;
  String? updatedDate;

  UserProfile(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.picture,
      this.gender,
      this.email,
      this.dateOfBirth,
      this.phone,
      this.location,
      this.registerDate,
      this.updatedDate});

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class Location {
  String? street;
  String? city;
  String? state;
  String? country;
  String? timezone;

  Location({this.street, this.city, this.state, this.country, this.timezone});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

