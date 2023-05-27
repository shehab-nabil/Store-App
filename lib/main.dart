  import 'package:flutter/material.dart';
import 'package:store_app/screens/home_screen.dart';
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
        HomeScreen.id : (context)=> const HomeScreen(),
        UpdateProductScreen.id :(context) => const UpdateProductScreen(),
      },
   initialRoute: HomeScreen.id,
    );
  }
}



