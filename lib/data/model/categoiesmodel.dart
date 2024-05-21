class CategoryModel {
  String? sId;
  String? name;
  String? categoryImage;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Products>? products;
  String? id;

  CategoryModel(
      {this.sId,
        this.name,
        this.categoryImage,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.products,
        this.id});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    categoryImage = json['categoryImage'];
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
    data['categoryImage'] = this.categoryImage;
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
  bool? available;
  bool? isdiscount;
  int? discountPrice;
  int? maxallowedpiecesondiscount;
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
  String? id;

  Products(
      {
        this.available,
        this.isdiscount,
        this.discountPrice,
        this.maxallowedpiecesondiscount,
        this.sId,
        this.title,
        this.price,
        this.brand,
        this.category,
        this.visible,
        this.images,
        this.amount,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.id});

  Products.fromJson(Map<String, dynamic> json) {


    available = json['available'];
    isdiscount = json['isdiscount'];
    discountPrice = json['discountPrice'];
    maxallowedpiecesondiscount = json['maxallowedpiecesondiscount'];
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
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['isdiscount'] = this.isdiscount;
    data['discountPrice'] = this.discountPrice;
    data['maxallowedpiecesondiscount'] = this.maxallowedpiecesondiscount;
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
    data['id'] = this.id;
    return data;
  }
}