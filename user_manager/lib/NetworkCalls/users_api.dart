import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_manager/Models/users_model.dart';

class UserApi {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> fetchUsers() async {
    final _userUrl = Uri.parse(_baseUrl + '/users');
    try {
      final _userRaw = await http.get(_userUrl);
      final _userJson = jsonDecode(_userRaw.body) as List;
      return _userJson
          .map(
            (user) => User(
                id: user['id'],
                name: user['name'],
                username: user['username'],
                email: user['email'],
                address: Address(
                  street: user['address']['street'],
                  suite: user['address']['suite'],
                  city: user['address']['city'],
                  zipcode: user['address']['zipcode'],
                ),
                phoneNumber: (user['phone'] as String)
                    .replaceAll(RegExp(r'[^0-9 x]'), ''),
                website: user['website'],
                companyName: user['company']['name']),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
