class Products {
  List<Products1>? products;
  int? total;
  int? skip;
  int? limit;

  Products({this.products, this.total, this.skip, this.limit});

  Products.fromJson(Map<String, dynamic> json) {
    products = json["products"] == null
        ? null
        : (json["products"] as List).map((e) => Products1.fromJson(e)).toList();
    total = json["total"];
    skip = json["skip"];
    limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    data["total"] = total;
    data["skip"] = skip;
    data["limit"] = limit;
    return data;
  }

  static List<Products> ofProducts(List value) {
    return value.map((e) => Products.fromJson(e)).toList();
  }
}

class Products1 {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  String? returnPolicy;
  int? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;

  Products1(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.images,
      this.thumbnail});

  Products1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    category = json["category"];
    price = json["price"];
    rating = json["rating"];
    stock = json["stock"];
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    brand = json["brand"];
    sku = json["sku"];
    weight = json["weight"];
    warrantyInformation = json["warrantyInformation"];
    shippingInformation = json["shippingInformation"];
    availabilityStatus = json["availabilityStatus"];
    returnPolicy = json["returnPolicy"];
    minimumOrderQuantity = json["minimumOrderQuantity"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["category"] = category;
    data["price"] = price;
    data["discountPercentage"] = discountPercentage;
    data["rating"] = rating;
    data["stock"] = stock;
    if (tags != null) {
      data["tags"] = tags;
    }
    data["brand"] = brand;
    data["sku"] = sku;
    data["weight"] = weight;

    data["warrantyInformation"] = warrantyInformation;
    data["shippingInformation"] = shippingInformation;
    data["availabilityStatus"] = availabilityStatus;

    data["returnPolicy"] = returnPolicy;
    data["minimumOrderQuantity"] = minimumOrderQuantity;

    if (images != null) {
      data["images"] = images;
    }
    data["thumbnail"] = thumbnail;
    return data;
  }
}
