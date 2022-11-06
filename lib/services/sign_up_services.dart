import 'package:dio/dio.dart';
import 'package:waitech/screens/login_sign-up/sign_up_page.dart';

class SignUpService{
  final String baseUrl = "https://haunted-ghost-08609.herokuapp.com/api/";
  final dio = Dio();

  void postRequest() async {
    try {
      var response = await Dio().post('$baseUrl',
      data: {'firma-adı': 'mete' ,'ad-soyad':'mete','email':'mete2@gmail.com','password':'123456'});
      print(response);
    } catch (e) {
      print(e);
    }
  }



}