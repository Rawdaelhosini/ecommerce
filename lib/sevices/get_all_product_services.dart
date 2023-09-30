import '../helper/api.dart';
import '../models/product.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products', token: '');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.formJson(data[i]),
      );
    }
    return productsList;
  }
}
