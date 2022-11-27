import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:waitech/components/loading_popup.dart';
import 'package:waitech/tab_bar_page/tab_bar_index.dart';
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
        .then((value) {
      if (value != null && value.success == true) {
        Grock.back();
        Grock.to(TabBarIndex());
      } else {
        Grock.snackBar(
            title: "Hata",
            description: value?.message ?? "Bir sorun oluştu, tekrar deneyin");
      }
    });
  }
}
/*final SignUpRiverpod = ChangeNotifierProvider<SignUpRiverpod>((ref) {
  return TodosNotifier();
});*/
