import 'package:store_app/helper/api.dart';
import 'package:store_app/model/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String category,
      required String image}) async {
    print('id $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image
      },
      token: null,
    );
    return ProductModel.fromJson(data);
  }
}
