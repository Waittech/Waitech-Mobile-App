import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/get_order_model.dart';
import 'package:http/http.dart' as http;

import '../screens/profile/profile_screen.dart';

class OrderService{
  final String baseUrl = "https://amazing-gauss.213-142-157-85.plesk.page/api/orders";
  Future<GetOrderModel> createOrder() async {
    String? token = await storage.read(key: 'jwt');
    final result= await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':'Bearer $token'
      },
    );
    if(result.statusCode==200){
      return GetOrderModel.fromJson(jsonDecode(result.body));
    }
    else{
      throw Exception('İstek başarısız oldu ${result.statusCode}');
    }
  }
  }