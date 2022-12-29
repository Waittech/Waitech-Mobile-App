import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:waitech/components/loading_popup.dart';
import 'package:waitech/tab_bar_page/tab_bar_index.dart';
import '../screens/profile/profile_screen.dart';
import '../services/sign_up_services.dart';

class SignUpRiverpod extends ChangeNotifier {
  final service = SignUpService();
  TextEditingController? name = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();


  void fetch() {
    loadingPopUp();
    service
        .signUpCall(name: name!.text, email: email!.text, password: password!.text)
        .then((value) async {
          try{
            if (value != null && value.success == true) {
              await storage.write(key: 'jwt', value: value!.data!.token);
              await storage.write(key: 'username', value: name!.text);
              await storage.write(key: 'email', value: email!.text);
              Grock.back();
              Grock.to(TabBarIndex());
            }
            if(value !=null && value.success == false){
              print('burası yanlış yer');
              Grock.back();
            }
            else {
              Grock.snackBar(
                  title: "Hata",
                  description: value?.message ?? "Bir sorun oluştu, tekrar deneyin");
            }

          }
          catch (e){

          }

    });
  }
}
/*final SignUpRiverpod = ChangeNotifierProvider<SignUpRiverpod>((ref) {
  return TodosNotifier();
});*/
