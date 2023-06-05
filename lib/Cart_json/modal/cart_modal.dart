import 'dart:convert';

class CartModal {
  int? id, userId, v;
  String? date;
  List<ProductModal>? productList;

  CartModal({this.id, this.date, this.userId, this.v, this.productList});

  factory CartModal.fromjson(Map m1) {

    List list = m1['products'];
    List<ProductModal> items = list.map((e) => ProductModal.fromjson(e)).toList();

    return CartModal(
        id: m1['id'],
        date: m1['date'],
        userId: m1['userId'],
        v: m1['__v'],productList: items);
  }
}

class ProductModal {
  int? productId, quantity;

  ProductModal({this.productId, this.quantity});

  factory ProductModal.fromjson(Map m1) {
    return ProductModal(productId: m1['productId'], quantity: m1['quantity']);
  }
}
