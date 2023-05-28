import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/components/custom_button.dart';
import 'package:store_app/components/custom_text_form_field.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_products_services.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({Key? key}) : super(key: key);
  static String id = 'Update product screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

bool isLoading = false;

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, price, image;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Update products ',
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
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Custombutton(
                  label: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
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

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
    print('the product updated to :$product');
  }
}
