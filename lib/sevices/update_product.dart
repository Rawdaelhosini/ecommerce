import '../helper/api.dart';
import '../models/product.dart';

class UpdateProductService {
  Future<ProductModel> updateaddProduct(
      {required title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    print('product id = $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
      token: '',
    );
    return ProductModel.formJson(data);
  }
}
