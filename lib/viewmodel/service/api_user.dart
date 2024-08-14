import 'package:dio/dio.dart';

import 'package:test_suitmedia_intern/models/user_data.dart';

class ApiUserService {
  final Dio _dio = Dio();
  final String _endpoint = 'https://reqres.in/api/users?page=1&per_page=10';

  Future<List<Datum>> fetchUserData() async {
    try {
      final response = await _dio.get(_endpoint);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Datum.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to load user data: $e');
    }
  }
}
