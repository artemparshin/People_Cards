import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {

  final UserName name;
  @JsonKey(name: 'picture')
  final UserPhoto photo;
  final UserDob dob;

  User(this.name, this.photo, this.dob);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}

@JsonSerializable()
class UserName {

  @JsonKey(name: 'first')
  final String firstName;
  @JsonKey(name: 'last')
  final String lastName;

  UserName(this.firstName, this.lastName);

   factory UserName.fromJson(Map<String, dynamic> json) => _$UserNameFromJson(json);
}

@JsonSerializable()
class UserPhoto {

  @JsonKey(name: 'large')
  final String photoUrl;
  
  UserPhoto(this.photoUrl);

   factory UserPhoto.fromJson(Map<String, dynamic> json) => _$UserPhotoFromJson(json);
}

@JsonSerializable()
class UserDob {

  final int age;// сортировку лучше сделать по дате рождения
  
  UserDob(this.age);

   factory UserDob.fromJson(Map<String, dynamic> json) => _$UserDobFromJson(json);
}