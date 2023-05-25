import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProduct {
  Future<dynamic> updateProduct(
      {required String title,
        required String price,
        required String description,
        required String image,
        required String category}) async{
    Map<String,dynamic> data = await  Api().put(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },token: null
    );
    return ProductModel.fromJson(data);
  }
}