import 'package:store_app/helper/api.dart';
import 'package:store_app/model/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
      token: null,
    );

    // Create a list of ProductModel objects from the data.
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    // Return the list of ProductModel objects.
    return productsList;
  }
}
