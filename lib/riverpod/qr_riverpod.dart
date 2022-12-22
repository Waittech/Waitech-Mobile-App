import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:waitech/components/loading_popup.dart';
import 'package:waitech/services/qr_service.dart';
import 'package:waitech/tab_bar_page/tab_bar_index.dart';
import '../services/login_services.dart';

class QrRiverpod extends ChangeNotifier {
  final service = QRService();

  void fetch() {
    loadingPopUp();
    service
        .qrCall(companyId: '', tableId: '', tableName: '')
        .then((value) {
      if (value != null && value.success! == true) {
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
