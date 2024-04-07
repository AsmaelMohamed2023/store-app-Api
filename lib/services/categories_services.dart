import 'package:store_app/helper/api.dart';
import 'package:store_app/model/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategories(
      {required String categoriesName}) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoriesName',
      token: null,
    );

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
}
