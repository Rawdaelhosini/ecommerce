class Product {
  String? title;
  double? price;
  String? id;
  String? description;
  String? image;
  String? category;
  Product(
      {required this.title,
      required this.price,
      required this.id,
      required this.description,
      required this.image,
      required this.category});

  factory Product.formJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] ?? "",
        title: json['title'] ?? "",
        image: json['image'] ?? "",
        price: json['price'] ?? 0,
        description: json['description'] ?? "",
        category: json['category'] ?? "");
  }

  Map<String, dynamic>? get toJson {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
  }
}

class ProductModel // كده انشات ال product model بتاعي
//ديه حاجات ثابته بعملها لما باجي اعمل اي مودل
{
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  // final Map<String , dynamic> rating ;
  final RatingModel rating;

  final String category;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating,
      required this.category});
  factory ProductModel.formJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: RatingModel.formJson(jsonData['rating']),
        category: jsonData['category']);
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.formJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
