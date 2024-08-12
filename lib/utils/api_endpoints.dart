import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/data_user.dart';

class ApiService {
  final String baseUrl = 'https://reqres.in/api/users?page=1&per_page=10';

  Future<List<User>> fetchUsers({int page = 1, int perPage = 10}) async {
    final response =
        await http.get(Uri.parse('$baseUrl?page=$page&per_page=$perPage'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> usersJson = data['data'];
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
