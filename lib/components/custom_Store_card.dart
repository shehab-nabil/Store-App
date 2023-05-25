import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});


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
                Text('productName',
                    style: TextStyle(color: Colors.black45, fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r"$250",
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
                'https://raw.githubusercontent.com/keikaavousi/fake-store-api/master/public/img/61IBBVJvSDL._AC_SY879_.jpg',
                height: 100,
              )],
            ))
      ],
    );
  }
}
