/*
import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:waitech/components/loading_popup.dart';
import 'package:waitech/screens/login_sign-up/login_page2.dart';
import 'package:waitech/tab_bar_page/tab_bar_index.dart';
import '../services/login_services.dart';
import '../services/qr_service.dart';

class QrRiverpod extends ChangeNotifier {
  final service = QrService();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  void fetch() {
    loadingPopUp();
    service
        .qrCall(email: email!.text, password: password!.text)
        .then((value) {
      if (value != null && value.success! == true) {
        Grock.back();
        Grock.to(TabBarIndex());
      }if(value != null && value.success! == false){
        Grock.back();
        Grock.to(LoginPage());
      }
      else {
        Grock.snackBar(
            title: "Hata",
            description: value?.message ?? "Bir sorun oluştu, tekrar deneyin");
      }
    });
  }
}*/
