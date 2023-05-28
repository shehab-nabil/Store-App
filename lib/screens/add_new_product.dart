import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/components/custom_button.dart';
import 'package:store_app/components/custom_text_form_field.dart';
import 'package:store_app/services/add_product_service.dart';

class AddNewProductScreen extends StatefulWidget {
  AddNewProductScreen({Key? key}) : super(key: key);
  static String id = 'add product screen';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreen();
}

bool isLoading = false;

class _AddNewProductScreen extends State<AddNewProductScreen> {
  String? productName, description, price, image ,category;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Add new product ',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomFormTextField(
                  onChange: (data) {
                    productName = data;
                  },
                  circularBorderRadius: 16,
                  focusBorderColor: Colors.blueGrey,
                  hintText: 'Enter product name',
                  hintColor: Colors.grey,
                  labelColor: Colors.black54,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomFormTextField(

                  onChange: (data) {
                    description = data;
                  },
                  circularBorderRadius: 16,
                  focusBorderColor: Colors.blueGrey,
                  hintText: 'Enter description',
                  hintColor: Colors.grey,
                  labelColor: Colors.black54,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomFormTextField(
                  textType: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                  circularBorderRadius: 16,
                  focusBorderColor: Colors.blueGrey,
                  hintText: 'Enter product price',
                  hintColor: Colors.grey,
                  labelColor: Colors.black54,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomFormTextField(
                  onChange: (data) {
                    image = data;
                  },
                  circularBorderRadius: 16,
                  focusBorderColor: Colors.blueGrey,
                  hintText: 'Enter product image link ',
                  hintColor: Colors.grey,
                  labelColor: Colors.black54,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomFormTextField(
                  onChange: (data) {
                    category = data;
                  },
                  circularBorderRadius: 16,
                  focusBorderColor: Colors.blueGrey,
                  hintText: 'Enter product category ',
                  hintColor: Colors.grey,
                  labelColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Custombutton(
                  label: 'Add',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                     await addNewProduct();
                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  buttonColor: Colors.blueGrey,
                  height: 50,
                  width: 300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addNewProduct() async {
    await AddProductService().addProduct(
      title:  productName!,
      price:  price!,
      description:  description!,
      image:  image!,
      category:category!,
    );

    //print('the product updated to :$product');
  }
}
