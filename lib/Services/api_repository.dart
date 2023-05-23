import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:people_cards_test/Models/user.dart';
import 'package:people_cards_test/Models/users_response.dart';

class ApiClient {

  Future<List<User>> fetchUser() async {
    var url = Uri.https('randomuser.me', '/api/', {'results': '20'});
    var response = await http.get(url);
    if (response.statusCode == HttpStatus.ok){
      var usersResponse = UsersResponse.fromJson(jsonDecode(response.body));
      return usersResponse.users;
    }
    return [];
  }  
}


