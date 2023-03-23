import 'package:my_app/store/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://fakestoreapi.com/products"));

  Future<List<Product>> getProduct() async {
    final reponse = await _dio.get("");
    return (reponse.data as List)
        .map((json) => Product(
              id: json['id'],
              title: json['title'],
              image: json['image'],
            ))
        .toList();
  }
}
