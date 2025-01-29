import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jyothi_labs_ecommerce/Model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  List<Auth>? _auth;
  List<Auth>? get auth => _auth;

  String? _authToken;
  String? get authtoken => _authToken;

  void login(String email, password) async {
    var response =
        await http.post(Uri.parse("https://dummyjson.com/auth/login"), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      _auth = Auth.ofAuth(jsonDecode(response.body));
      _authToken = auth?[0].accessToken.toString();
      notifyListeners();
    }
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("authToken", authtoken.toString());
  }
}
