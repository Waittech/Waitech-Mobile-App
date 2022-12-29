import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:waitech/main.dart';
import 'package:waitech/riverpod/riverpod_management.dart';
import '../models/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl = "https://amazing-gauss.213-142-157-85.plesk.page/api/";
  final dio = Dio();
  Future<LoginModel?> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "password": password};
    var response = await dio.post(baseUrl + "login", data: json);
    if (response.statusCode == 200) {
      Options (
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType:ResponseType.json,
      );
      var result = LoginModel.fromJson(response.data);
      print(response.data.toString());
      return result;
    }
    else{
      throw Exception('başarısız');

    }

  }


}
