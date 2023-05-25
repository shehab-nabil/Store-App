import 'package:store_app/helper/api.dart';

class AddProduct {
  Future<dynamic> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) {
    Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
  }
}
