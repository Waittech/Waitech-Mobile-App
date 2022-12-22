import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:waitech/main.dart';
import '../models/qr_model.dart';

class QRService extends ChangeNotifier{
  final String baseUrl = "https://amazing-gauss.213-142-157-85.plesk.page/api/qr/company/$companyId/table/$tableId";
  final dio = Dio();
  Future<QrModel> qrCall(
      {required String companyId, required String tableId,required String tableName}) async {
    Map<String, dynamic> json = {"companyId": companyId, "tableId": tableId,"tableName": tableName};
    var response = await dio.post(baseUrl, data: json);
    if (response.statusCode == 200) {
      var result = QrModel.fromJson(response.data);
      print(response.data.toString());
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
