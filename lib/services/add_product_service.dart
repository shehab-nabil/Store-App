import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class AddProductService {
  Future<dynamic> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async{
 Map<String,dynamic> data = await  Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
   token: null
    );
 return ProductModel.fromJsonAdd(data);
  }
}
