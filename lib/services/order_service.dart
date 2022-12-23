
import 'package:waitech/models/basket_model.dart';
import 'package:dio/dio.dart';
import 'package:waitech/models/order_model.dart';

class OrderService{
  final String baseUrl ='https://amazing-gauss.213-142-157-85.plesk.page/api/';
  final dio = Dio();
  Future<OrderModel?> basketCall(
  {required dynamic items}) async{
    var response = await dio.post(baseUrl+'orders');
    if(response.statusCode==200){
      var result= OrderModel.fromJson(response.data);
      return result;
    }
    else{
      throw('bir sorun oluştu ${response.statusCode}');
    }
  }


}

