class HomeResponseDataBestSellingProductsRating {
  /*
{
  "averageRating": "1.5",
  "totalReviewCount": 1
}
*/

  String? averageRating;
  String? totalReviewCount;

  HomeResponseDataBestSellingProductsRating({
    this.averageRating,
    this.totalReviewCount,
  });

  HomeResponseDataBestSellingProductsRating.fromJson(
    Map<String, dynamic> json,
  ) {
    averageRating = json['averageRating']?.toString();
    totalReviewCount = json['totalReviewCount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['averageRating'] = averageRating;
    data['totalReviewCount'] = totalReviewCount;
    return data;
  }
}

class HomeResponseDataBestSellingProducts {
/*
{
  "id": 37,
  "price": "10.20",
  "tax_price": "0.00",
  "promotion_price": "0.00",
  "sub_total": "10.20",
  "image_url": "https://inventory.grozaarbd.com/storage/products/1748770754_1755049383_1.webp",
  "name": "Leilani Manning",
  "rating": {
    "averageRating": "0",
    "totalReviewCount": 0
  },
  "promotion_text": "",
  "old_price": ""
}
*/

  String? id;
  String? price;
  String? taxPrice;
  String? promotionPrice;
  String? subTotal;
  String? imageUrl;
  String? name;
  HomeResponseDataBestSellingProductsRating? rating;
  String? promotionText;
  String? oldPrice;

  HomeResponseDataBestSellingProducts({
    this.id,
    this.price,
    this.taxPrice,
    this.promotionPrice,
    this.subTotal,
    this.imageUrl,
    this.name,
    this.rating,
    this.promotionText,
    this.oldPrice,
  });
  HomeResponseDataBestSellingProducts.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    price = json['price']?.toString();
    taxPrice = json['tax_price']?.toString();
    promotionPrice = json['promotion_price']?.toString();
    subTotal = json['sub_total']?.toString();
    imageUrl = json['image_url']?.toString();
    name = json['name']?.toString();
    rating = (json['rating'] != null && (json['rating'] is Map)) ? HomeResponseDataBestSellingProductsRating.fromJson(json['rating']) : null;
    promotionText = json['promotion_text']?.toString();
    oldPrice = json['old_price']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['tax_price'] = taxPrice;
    data['promotion_price'] = promotionPrice;
    data['sub_total'] = subTotal;
    data['image_url'] = imageUrl;
    data['name'] = name;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['promotion_text'] = promotionText;
    data['old_price'] = oldPrice;
    return data;
  }
}

class HomeResponseDataNewArrivalProductsRating {
  /*
{
  "averageRating": "0",
  "totalReviewCount": 0
}
*/

  String? averageRating;
  String? totalReviewCount;

  HomeResponseDataNewArrivalProductsRating({
    this.averageRating,
    this.totalReviewCount,
  });

  HomeResponseDataNewArrivalProductsRating.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating']?.toString();
    totalReviewCount = json['totalReviewCount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['averageRating'] = averageRating;
    data['totalReviewCount'] = totalReviewCount;
    return data;
  }
}

class HomeResponseDataNewArrivalProducts {
  /*
{
  "id": 37,
  "price": "10.20",
  "tax_price": "0.00",
  "promotion_price": "0.00",
  "sub_total": "10.20",
  "image_url": "https://inventory.grozaarbd.com/storage/products/1748770754_1755049383_1.webp",
  "name": "Leilani Manning",
  "rating": {
    "averageRating": "0",
    "totalReviewCount": 0
  },
  "promotion_text": "",
  "old_price": ""
}
*/

  String? id;
  String? price;
  String? taxPrice;
  String? promotionPrice;
  String? subTotal;
  String? imageUrl;
  String? name;
  HomeResponseDataNewArrivalProductsRating? rating;
  String? promotionText;
  String? oldPrice;

  HomeResponseDataNewArrivalProducts({
    this.id,
    this.price,
    this.taxPrice,
    this.promotionPrice,
    this.subTotal,
    this.imageUrl,
    this.name,
    this.rating,
    this.promotionText,
    this.oldPrice,
  });

  HomeResponseDataNewArrivalProducts.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    price = json['price']?.toString();
    taxPrice = json['tax_price']?.toString();
    promotionPrice = json['promotion_price']?.toString();
    subTotal = json['sub_total']?.toString();
    imageUrl = json['image_url']?.toString();
    name = json['name']?.toString();
    rating =
        (json['rating'] != null && (json['rating'] is Map))
            ? HomeResponseDataNewArrivalProductsRating.fromJson(json['rating'])
            : null;
    promotionText = json['promotion_text']?.toString();
    oldPrice = json['old_price']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['tax_price'] = taxPrice;
    data['promotion_price'] = promotionPrice;
    data['sub_total'] = subTotal;
    data['image_url'] = imageUrl;
    data['name'] = name;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['promotion_text'] = promotionText;
    data['old_price'] = oldPrice;
    return data;
  }
}

class HomeResponseDataPromotions {
  /*
{
  "id": 3,
  "title": "upto 20% off",
  "image": "promotions/1746612747_1933831446_1.jfif",
  "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
  "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
  "valid_from": "May 7, 2025",
  "valid_to": "May 7, 2025",
  "promotion_type": "Running"
}
*/

  String? id;
  String? title;
  String? image;
  String? imageUrl;
  String? message;
  String? validFrom;
  String? validTo;
  String? promotionType;

  HomeResponseDataPromotions({
    this.id,
    this.title,
    this.image,
    this.imageUrl,
    this.message,
    this.validFrom,
    this.validTo,
    this.promotionType,
  });

  HomeResponseDataPromotions.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    image = json['image']?.toString();
    imageUrl = json['image_url']?.toString();
    message = json['message']?.toString();
    validFrom = json['valid_from']?.toString();
    validTo = json['valid_to']?.toString();
    promotionType = json['promotion_type']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['image_url'] = imageUrl;
    data['message'] = message;
    data['valid_from'] = validFrom;
    data['valid_to'] = validTo;
    data['promotion_type'] = promotionType;
    return data;
  }
}

class HomeResponseDataCategories {
  /*
{
  "id": 9,
  "name": "dfd",
  "image": null,
  "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
}
*/

  String? id;
  String? name;
  String? image;
  String? imageUrl;

  HomeResponseDataCategories({this.id, this.name, this.image, this.imageUrl});

  HomeResponseDataCategories.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    image = json['image']?.toString();
    imageUrl = json['image_url']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['image_url'] = imageUrl;
    return data;
  }
}

class HomeResponseData {
  /*
{
  "categories": [
    {
      "id": 9,
      "name": "dfd",
      "image": null,
      "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
    }
  ],
  "promotions": [
    {
      "id": 3,
      "title": "upto 20% off",
      "image": "promotions/1746612747_1933831446_1.jfif",
      "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
      "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
      "valid_from": "May 7, 2025",
      "valid_to": "May 7, 2025",
      "promotion_type": "Running"
    }
  ],
  "new_arrival_products": [
    {
      "id": 2,
      "price": "22.95",
      "image": "products/1745483961_598300393_1.jpg",
      "image_url": "https://grozaar.heizoelscout.com/storage/products/1745483961_598300393_1.jpg",
      "name": "customer product",
      "barcode_image_url": "https://grozaar.heizoelscout.com/storage",
      "rating": {
        "averageRating": "0",
        "totalReviewCount": 0
      }
    }
  ],
  "best_selling_products": [
    {
      "id": 1,
      "price": "20.91",
      "image": "products/1745483907_841631781_1.jpeg",
      "image_url": "https://grozaar.heizoelscout.com/storage/products/1745483907_841631781_1.jpeg",
      "name": "Both Product",
      "barcode_image_url": "https://grozaar.heizoelscout.com/storage",
      "rating": {
        "averageRating": "1.5",
        "totalReviewCount": 1
      }
    }
  ]
}
*/

  List<HomeResponseDataCategories?>? categories;
  List<HomeResponseDataPromotions?>? promotions;
  List<HomeResponseDataNewArrivalProducts?>? newArrivalProducts;
  List<HomeResponseDataBestSellingProducts?>? bestSellingProducts;

  HomeResponseData({
    this.categories,
    this.promotions,
    this.newArrivalProducts,
    this.bestSellingProducts,
  });

  HomeResponseData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null && (json['categories'] is List)) {
      final v = json['categories'];
      final arr0 = <HomeResponseDataCategories>[];
      v.forEach((v) {
        arr0.add(HomeResponseDataCategories.fromJson(v));
      });
      categories = arr0;
    }
    if (json['promotions'] != null && (json['promotions'] is List)) {
      final v = json['promotions'];
      final arr0 = <HomeResponseDataPromotions>[];
      v.forEach((v) {
        arr0.add(HomeResponseDataPromotions.fromJson(v));
      });
      promotions = arr0;
    }
    if (json['new_arrival_products'] != null &&
        (json['new_arrival_products'] is List)) {
      final v = json['new_arrival_products'];
      final arr0 = <HomeResponseDataNewArrivalProducts>[];
      v.forEach((v) {
        arr0.add(HomeResponseDataNewArrivalProducts.fromJson(v));
      });
      newArrivalProducts = arr0;
    }
    if (json['best_selling_products'] != null &&
        (json['best_selling_products'] is List)) {
      final v = json['best_selling_products'];
      final arr0 = <HomeResponseDataBestSellingProducts>[];
      v.forEach((v) {
        arr0.add(HomeResponseDataBestSellingProducts.fromJson(v));
      });
      bestSellingProducts = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (categories != null) {
      final v = categories;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['categories'] = arr0;
    }
    if (promotions != null) {
      final v = promotions;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['promotions'] = arr0;
    }
    if (newArrivalProducts != null) {
      final v = newArrivalProducts;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['new_arrival_products'] = arr0;
    }
    if (bestSellingProducts != null) {
      final v = bestSellingProducts;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['best_selling_products'] = arr0;
    }
    return data;
  }
}

class HomeResponse {
  /*
{
  "success": true,
  "message": "Homepage data loaded successfully",
  "data": {
    "categories": [
      {
        "id": 9,
        "name": "dfd",
        "image": null,
        "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
      }
    ],
    "promotions": [
      {
        "id": 3,
        "title": "upto 20% off",
        "image": "promotions/1746612747_1933831446_1.jfif",
        "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
        "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
        "valid_from": "May 7, 2025",
        "valid_to": "May 7, 2025",
        "promotion_type": "Running"
      }
    ],
    "new_arrival_products": [
      {
        "id": 2,
        "price": "22.95",
        "image": "products/1745483961_598300393_1.jpg",
        "image_url": "https://grozaar.heizoelscout.com/storage/products/1745483961_598300393_1.jpg",
        "name": "customer product",
        "barcode_image_url": "https://grozaar.heizoelscout.com/storage",
        "rating": {
          "averageRating": "0",
          "totalReviewCount": 0
        }
      }
    ],
    "best_selling_products": [
      {
        "id": 1,
        "price": "20.91",
        "image": "products/1745483907_841631781_1.jpeg",
        "image_url": "https://grozaar.heizoelscout.com/storage/products/1745483907_841631781_1.jpeg",
        "name": "Both Product",
        "barcode_image_url": "https://grozaar.heizoelscout.com/storage",
        "rating": {
          "averageRating": "1.5",
          "totalReviewCount": 1
        }
      }
    ]
  }
}
*/

  bool? success;
  String? message;
  HomeResponseData? data;

  HomeResponse({this.success, this.message, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
    data =
        (json['data'] != null && (json['data'] is Map))
            ? HomeResponseData.fromJson(json['data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data!.toJson();
    return data;
  }
}
