import 'dart:convert';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "https://shamo-backend.buildwithangga.id/api";

  Future<UserModel?> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });
    var response = await http.post(url, headers: header, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Anda Gagal Register');
    }
  }

  Future<UserModel?> login({
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var header = {'Content-Type': 'aplication/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response = await http.post(url, headers: header, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login !');
    }
  }
}
