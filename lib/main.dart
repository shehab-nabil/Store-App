  import 'package:flutter/material.dart';
import 'package:store_app/screens/add_new_product.dart';
import 'package:store_app/screens/category_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/one_type_product.dart';
import 'package:store_app/screens/update_screen.dart';

void main() {
  runApp( StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.id : (context)=>  HomeScreen(),
        UpdateProductScreen.id :(context) =>  UpdateProductScreen(),
        AddNewProductScreen.id : (context) => AddNewProductScreen(),
        CategoriesScreen.id :(context) => CategoriesScreen(),
        OneTypeProduct.id:(context) => OneTypeProduct(),
      },
   initialRoute: HomeScreen.id,
    );
  }
}



