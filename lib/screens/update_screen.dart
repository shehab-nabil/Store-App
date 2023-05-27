import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/components/custom_button.dart';
import 'package:store_app/components/custom_text_form_field.dart';

class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({Key? key}) : super(key: key);
  static String id = 'Update product screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Update products ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomFormTextField(
              circularBorderRadius: 16,
              focusBorderColor: Colors.blueGrey,
              hintText: 'Enter product name',
              hintColor: Colors.grey,
              labelColor: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomFormTextField(
              circularBorderRadius: 16,
              focusBorderColor: Colors.blueGrey,
              hintText: 'Enter description',
              hintColor: Colors.grey,
              labelColor: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomFormTextField(
              circularBorderRadius: 16,
              focusBorderColor: Colors.blueGrey,
              hintText: 'Enter product price',
              hintColor: Colors.grey,
              labelColor: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomFormTextField(
              circularBorderRadius: 16,
              focusBorderColor: Colors.blueGrey,
              hintText: 'Enter product image link ',
              hintColor: Colors.grey,
              labelColor: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Custombutton(label: 'Update', onTap: () {},buttonColor: Colors.blueGrey,height: 50,width: 300,),
          )
        ],
      ),
    );
  }
}
