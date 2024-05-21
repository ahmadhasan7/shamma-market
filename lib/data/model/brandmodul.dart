class BrandModel {
  String? sId;
  String? name;
  String? brandImage;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Products>? products;
  String? id;

  BrandModel(
      {this.sId,
        this.name,
        this.brandImage,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.products,
        this.id});

  BrandModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    brandImage = json['brandImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['brandImage'] = this.brandImage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Products {
  String? sId;
  String? title;
  int? price;
  String? brand;
  List<String>? category;
  bool? visible;
  List<String>? images;
  int? amount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products(
      {this.sId,
        this.title,
        this.price,
        this.brand,
        this.category,
        this.visible,
        this.images,
        this.amount,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    brand = json['brand'];
    category = json['category'].cast<String>();
    visible = json['visible'];
    images = json['images'].cast<String>();
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['visible'] = this.visible;
    data['images'] = this.images;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}