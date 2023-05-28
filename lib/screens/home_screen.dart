import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/components/custom_Store_card.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/add_new_product.dart';
import 'package:store_app/services/all_products_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddNewProductScreen.id,);
          },
          child: const Icon(Icons.add, color: Colors.blueGrey,size: 30),
          backgroundColor: Colors.white,
      ),

      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: .02,
        title: const Text(
          'New trend',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 10, top: 90),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
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
