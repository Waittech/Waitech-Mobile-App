
import 'package:dio/dio.dart';

import '../models/sign_up_model.dart';

class SignUpService {
  final String baseUrl = "https://amazing-gauss.213-142-157-85.plesk.page/api/";
  final dio = Dio();
  Future<SignUpModel?> signUpCall(
      {required String name,required String email, required String password}) async {
    try{
      Map<String, dynamic> json = {"name":name,"email": email, "password": password};
      var response = await dio.post(baseUrl+ "register", data: json);
      if (response.statusCode == 200) {
        var result = SignUpModel.fromJson(response.data);
        return result;
      } else {
        throw ("Bir sorun oluştu ${response.statusCode}");
      }
    }
    on DioError catch(e){
      if (e.response!.statusCode == 200) {
        Options (
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
        );
        var result = SignUpModel.fromJson(e.response!.data);
        print(e.response!.data.toString());
        return result;
      }
      else{
        print(e.response!.data);

      }

    }

  }
}
