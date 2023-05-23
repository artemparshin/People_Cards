// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      UserName.fromJson(json['name'] as Map<String, dynamic>),
      UserPhoto.fromJson(json['picture'] as Map<String, dynamic>),
      UserDob.fromJson(json['dob'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'picture': instance.photo,
      'dob': instance.dob,
    };

UserName _$UserNameFromJson(Map<String, dynamic> json) => UserName(
      json['first'] as String,
      json['last'] as String,
    );

Map<String, dynamic> _$UserNameToJson(UserName instance) => <String, dynamic>{
      'first': instance.firstName,
      'last': instance.lastName,
    };

UserPhoto _$UserPhotoFromJson(Map<String, dynamic> json) => UserPhoto(
      json['large'] as String,
    );

Map<String, dynamic> _$UserPhotoToJson(UserPhoto instance) => <String, dynamic>{
      'large': instance.photoUrl,
    };

UserDob _$UserDobFromJson(Map<String, dynamic> json) => UserDob(
      json['age'] as int,
    );

Map<String, dynamic> _$UserDobToJson(UserDob instance) => <String, dynamic>{
      'age': instance.age,
    };
