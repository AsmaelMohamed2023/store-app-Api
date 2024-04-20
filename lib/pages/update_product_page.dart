import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  static String id = 'UpdateProductPage';

  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image, price;

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update Product',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      hint: 'Product Name',
                      onChange: (data) {
                        productName = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'Description',
                      onChange: (data) {
                        description = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      inputType: TextInputType.number,
                      hint: 'Price',
                      onChange: (data) {
                        price = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'Image',
                      onChange: (data) {
                        image = data;
                      },
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      text: 'Update',
                      onTap: () async {
                        isLoding = true;
                        setState(() {});

                        try {
                          await updateProduct(product);
                          print('success');
                        } catch (e) {
                          print(e.toString());
                        }
                        isLoding = false;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      category: product.category,
      image: image == null ? product.image : image!,
    );
  }
}
