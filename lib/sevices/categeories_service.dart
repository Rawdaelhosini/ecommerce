import '../helper/api.dart';
import '../models/product.dart';

class categoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products/category/$categoryName',
        token: ''); //بعمل كده لو كان في نقطتين

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.formJson(data[i]),
      );
    }
    return productsList;
  }
}
