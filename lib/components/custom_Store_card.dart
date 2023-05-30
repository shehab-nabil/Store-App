import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/update_screen.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});

  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isRed=false ;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: Colors.white,
            elevation: 10,
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title.substring(0, 9),
                      style:
                          const TextStyle(color: Colors.black45, fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r"$" "${widget.product.price.toString()}",
                          style: const TextStyle(fontSize: 16)),
                      IconButton(
                          onPressed: ( ) {
                            isRed ? isRed =false :isRed =true ;
                            setState(() {

                            });
                          },
                          icon:isRed ? const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                          ):const Icon(
                            CupertinoIcons.heart,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 71,
              bottom: 70,
              child: Stack(
                children: [
                  Image.network(
                    widget.product.image,
                    height: 100,
                    width: 100,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
