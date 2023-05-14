import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cms_final_final/models/userModel.dart';

class AuthService {
  static const String baseUrl = 'http://192.168.1.118:3000';
  

   Future<void> signUp(User user) async {
    final url = '$baseUrl/api/users/signup';
    final headers = {'Content-Type' :'application/json'};
    final body = jsonEncode(user.toJson());

    
    final response = await http
        .post(Uri.parse(url), headers: headers, body: body)
        .catchError((error) {
      print('Error: $error');
    });

  
    if (response.statusCode != 201) {
      throw Exception('Failed to sign up: ${response.statusCode}');
    }
  }
  
  Future<void> login(email , password) async {
    final url = '$baseUrl/api/users/login';
    final headers = {
      'Content-Type' :'application/json' ,
      'entity-type' :'staff' 
      };
    final body = jsonEncode({email: email, password: password});
    
    final response = await http
        .post(Uri.parse(url), headers: headers, body: body)
        .catchError((error) {
      print('Error: $error');
    });


    if (response.statusCode != 200) {
      throw Exception('Failed to sign up: ${response.statusCode}');
    }
  }
}


