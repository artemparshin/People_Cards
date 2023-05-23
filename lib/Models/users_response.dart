import 'package:json_annotation/json_annotation.dart';
import 'package:people_cards_test/Models/user.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {

  @JsonKey(name: 'results')
  final List<User> users;

  UsersResponse(this.users);

  factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);
}
