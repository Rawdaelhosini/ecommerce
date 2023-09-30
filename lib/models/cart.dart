class Cart {
  String title;
  double price;
  String id;
  String description;
  String image;
  String category;
  int count = 0;
  Cart(
      {required this.title,
      required this.price,
      required this.id,
      required this.description,
      required this.image,
      required this.category,
      required this.count});

  factory Cart.formJson(Map<String, dynamic> json) {
    return Cart(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        count: json['count']);
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
  }
}
