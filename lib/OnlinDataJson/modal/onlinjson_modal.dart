class ProducteModal {
  num? id, price;
  String? title, description, image,Img;
  RatingModal? ratingModal;

  ProducteModal(
      {this.id,
      this.image,
      this.price,
      this.description,
      this.title,
      this.ratingModal,this.Img});

  factory ProducteModal.fromjson(Map m1) {
    return ProducteModal(
        id: m1['id'],
        title: m1['title'],
        image: m1['image'],
        price: m1['price'],
        description: m1['description'],
        ratingModal: RatingModal.fromjson(m1['rating']));
  }


}

class RatingModal {
  num? rate, count;

  RatingModal({this.count, this.rate});

  factory RatingModal.fromjson(Map m1) {
    return RatingModal(count: m1['count'], rate: m1['rate']);
  }
}
