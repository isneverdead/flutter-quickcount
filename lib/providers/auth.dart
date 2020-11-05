// import 'dart:html';

import 'package:fluttertoast/fluttertoast.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'data_tps.dart';

class Auth with ChangeNotifier {
  String _token;
  String _responseMessage;
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    // 'Accept': 'application/json',
  };
  String get token {
    return _token;
  }

  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('userToken');
    print('token is > $_token');
    notifyListeners();
  }

  static final String endPoint = 'http://goapp.iniakbar.xyz';
  Future<void> auth(
      String username, String password, BuildContext context) async {
    print('pressed ========');
    final url = '$endPoint/api/auth/login';
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: json.encode(
          {
            // 'email': username,
            'username': username,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['access_token'] != null) {
        prefs.setString('userToken', responseData['access_token']);
      }
      print(response.statusCode);
      await getUserData();
      print(token);
      if (token != null) {
            Fluttertoast.showToast(
            msg: 'Login Berhasil',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<void> tryAutoLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('userToken');
    print('token is > $_token');
    notifyListeners();
    if (token != null) {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }
  }

  Future<void> logout(BuildContext context) async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userToken');
    notifyListeners();
    Fluttertoast.showToast(
        msg: 'Logout Berhasil',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  }
}
