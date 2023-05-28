import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProductServices {
  Future<dynamic> updateProduct(
      {required String title,
        required String price,
        required String description,
        required String image,
        required dynamic id,
        required String category}) async{
    print('product id = $id');
    Map<String,dynamic> data = await  Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },token: null
    );
   // print('$data');
    return ProductModel.fromJsonUpdate(data);
  }
}