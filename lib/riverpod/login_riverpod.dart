import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grock/grock.dart';
import 'package:waitech/components/loading_popup.dart';
import 'package:waitech/screens/login_sign-up/login_page2.dart';
import 'package:waitech/tab_bar_page/tab_bar_index.dart';
import '../screens/profile/profile_screen.dart';
import '../services/login_services.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = LoginService();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  final token ='';
  final emailString = '';
  final int id=0;
  final name = Provider((ref) => '');

  void fetch() {
    loadingPopUp();
    service
        .loginCall(email: email!.text, password: password!.text)
        .then((value) async {
          print('riverpod');
          print(value);
            if(value != null && value.success != false){
              await storage.write(key: 'jwt', value: value!.data!.token);
              await storage.write(key: 'username', value: value!.data!.name);
              await storage.write(key: 'email', value: value!.data!.email);
              await storage.write(key: 'id' ,value: value!.data!.id.toString());
              print('burası');
              Grock.back();
              Grock.to(TabBarIndex());
            }
           if (value == null) {
             Grock.snackBar(
                 title: "Hata",
                 description: value?.message ?? "Girilmiş olan kullanıcı verileri sistemdekiler ile eşleşmemektedir");
             Grock.to(LoginPage());
           }
           else {
             print('value null değil ama false geldi');

           }




    });
  }
}
