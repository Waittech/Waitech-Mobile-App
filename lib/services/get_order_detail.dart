import 'dart:convert';

import '../models/get_orders_detail.dart';
import '../screens/profile/profile_screen.dart';
import 'package:http/http.dart' as http;




class GetOrdersDetailService{
  Future<GetOrdersDetail> showOrder(int orderId) async {
    String url = 'https://amazing-gauss.213-142-157-85.plesk.page/api/orders/$orderId';
    String? token = await storage.read(key: 'jwt');
    final result= await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':'Bearer $token'
      },
    );
    if(result.statusCode==200){
      return GetOrdersDetail.fromJson(jsonDecode(result.body));
    }
    else{
      throw Exception('İstek başarısız oldu ${result.statusCode}');
    }
  }






}