
import 'package:dio/dio.dart';

import '../models/sign_up_model.dart';

class SignUpService {
  final String baseUrl = "https://haunted-ghost-08609.herokuapp.com/api/";
  final dio = Dio();
  Future<SignUpModel?> signUpCall(
      {required String name,required String email, required String password}) async {
    Map<String, dynamic> json = {"name":name,"email": email, "password": password};
    var response = await dio.post(baseUrl+ "register", data: json);
    if (response.statusCode == 200) {
      var result = SignUpModel.fromJson(response.data);
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
