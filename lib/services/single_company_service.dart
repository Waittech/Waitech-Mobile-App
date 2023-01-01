import 'dart:convert';

import 'package:waitech/models/get_company.dart';


import 'package:http/http.dart' as http;

import '../screens/profile/profile_screen.dart';



class SingleCompanyService{
  Future<Data> fetchSingleCompany(int companyId) async {
    String? token = await storage.read(key: 'jwt');
    final String baseUrl = "https://amazing-gauss.213-142-157-85.plesk.page/api/company/${companyId}";
    final result= await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':'Bearer $token'
      },
    );
    if(result.statusCode==200){
      print('burada');
      print(result.body);
      print(jsonDecode(result.body)['data']);
      return Data.fromJson(jsonDecode(result.body)['data']);
    }
    else{
      throw Exception('İstek başarısız oldu ${result.statusCode}');
    }
  }
}