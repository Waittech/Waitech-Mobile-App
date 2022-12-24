import '../models/restaurant_model.dart';
import 'package:http/http.dart' as http;

class ApiController{

  Future<List<Product>?> getProductData() async {
    @override
    var uri = Uri.parse('https://amazing-gauss.213-142-157-85.plesk.page/api/');
    var response = await http.get(uri); //(Uri.http('10.27.57.135:8080', "api/Product/listProducts",{'page': '0', 'size': '100'})));
    print(uri);
    if (response.statusCode == 200) {
      var products = productFromJson(response.body);
      print(products.length);
      print('başarılı');
      return products;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }



}

