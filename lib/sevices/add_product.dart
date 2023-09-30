import 'dart:async';

import 'package:ecommerce/models/product.dart';

import '../helper/api.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
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
