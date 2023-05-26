import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/products_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key,required this.product});

  ProductModel product ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          color: Colors.white,
          elevation: 10,

          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title.substring(0,9),
                    style: TextStyle(color: Colors.black45, fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r"$""${product.price.toString()}",
                        style: TextStyle(
                             fontSize: 16)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.black,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 90,
            bottom: 75,
            child: Stack(
              children: [Image.network(
                product.image,
                height: 100,
                width: 100,
              )],
            ))
      ],
    );
  }
}
