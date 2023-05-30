import 'package:store_app/helper/api.dart';
import 'package:store_app/models/category_model.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
   // print(' data is : $data');
    List<dynamic> categoriesList = [];

    for (int i = 0; i < data.length; i++) {
      categoriesList.add(CategoryModel.fromJson(data[i]) );
      print(' data is : ${data[i]}');
    }

    return categoriesList;
  }
}
