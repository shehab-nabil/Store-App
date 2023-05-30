
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/components/custom_Store_card.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/add_new_product.dart';
import 'package:store_app/screens/category_screen.dart';
import 'package:store_app/services/all_products_services.dart';

import '../services/get_category_services.dart';

class OneTypeProduct extends StatelessWidget {
   OneTypeProduct({Key? key}) : super(key: key);
  static String id = 'one category type';

  @override
  Widget build(BuildContext context) {
    CategoryModel category =
    ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: .02,
        title:  Text(
          category.categoryName,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 10, top: 90),
          child: FutureBuilder<List<ProductModel>>(
            future: GetCategoryServices().getCategoriesProducts(categoryName: category.categoryName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('there is a data');
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.68,
                        mainAxisSpacing: 90,
                        crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    });
              } else {
                print('there is no data');
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),

    );
  }
}
