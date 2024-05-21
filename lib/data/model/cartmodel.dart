class ProductCartModel {
  String? productId;
  int? quantity;
  int? price;
  String? img;
  int? totalPrice;
  String? sId;

  ProductCartModel(
      {this.productId,
        this.quantity,
        this.price,
        this.img,
        this.totalPrice,
        this.sId});

  ProductCartModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
    price = json['price'];
    img = json['img'];
    totalPrice = json['totalPrice'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['img'] = this.img;
    data['totalPrice'] = this.totalPrice;
    data['_id'] = this.sId;
    return data;
  }
}