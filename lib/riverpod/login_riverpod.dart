import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grock/grock.dart';
import 'package:waitech/components/loading_popup.dart';
import 'package:waitech/screens/login_sign-up/login_page2.dart';
import 'package:waitech/tab_bar_page/tab_bar_index.dart';
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
      final storage = new FlutterSecureStorage();
          try{
            if(value != null && value.success != false){
              await storage.write(key: 'jwt', value: value!.data!.token);
              await storage.write(key: 'username', value: value!.data!.name);
              await storage.write(key: 'email', value: value!.data!.email);
              await storage.write(key: 'id' ,value: value!.data!.id.toString());
              print('burası');

              Grock.to(LoginPage());
            }
            if (value != null && value.success! == false) {
              print('burası2');
              print(value.data!.token);
              print(value.message);
              print(value.success);

              Grock.back();
              Grock.to(TabBarIndex());
            }
            else {
              Grock.snackBar(
                  title: "Hata",
                  description: value?.message ?? "Kulanıcı adınız veya şifrenizi kontrol ediniz");
            }
          }
          catch(e){

          }

    });
  }
}
