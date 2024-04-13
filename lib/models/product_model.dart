class ProductModel {
  String? name;
  String? image;
  String? descreption;
  int? id;
  int? price;
  int? oldPrice;
  int? discount;

  ProductModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'].toString();
    descreption = data['description'].toString();
    id = data['id'].toInt();
    price = data['price'].toInt();
    oldPrice = data['old_price'].toInt();
    discount = data['discount'].toInt();
    image = data['image'].toString();
  }
}
