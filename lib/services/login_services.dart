import 'package:dio/dio.dart';

import '../models/login_model.dart';

class LoginService {
  final String baseUrl = "https://amazing-gauss.213-142-157-85.plesk.page/api/";
  final dio = Dio();
  Future<LoginModel?> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "password": password};
    var response = await dio.post(baseUrl + "login", data: json);
    if (response.statusCode == 200) {
      var result = LoginModel.fromJson(response.data);
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
