import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/components/custom_category_card.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/services/all_categories_services.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static String id = 'categories screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Categories ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 200),
          child: FutureBuilder<List<dynamic>>(
            future: AllCategoriesServices().getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('there is a category data');

                List<dynamic> categories = snapshot.data!;
                return GridView.builder(
                  itemCount: categories.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return CustomCategoryCard(
                      categoryModel: categories[index],
                    );
                  },
                );
              } else {
                print('there is no category data XXXXX');
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
