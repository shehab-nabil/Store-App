import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/screens/one_type_product.dart';

class CustomCategoryCard  extends StatelessWidget {
   CustomCategoryCard({Key? key ,required this.categoryModel}) ;
CategoryModel categoryModel ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, OneTypeProduct.id,arguments: categoryModel);
      },
      child: Card(
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            categoryModel.categoryName,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
      ),
    );;
  }
}
