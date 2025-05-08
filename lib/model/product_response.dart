class ProductResponseDataLinks {
  /*
{
  "first": "https://grozaar.heizoelscout.com/api/v1/user/get-products?page=1",
  "last": "https://grozaar.heizoelscout.com/api/v1/user/get-products?page=1",
  "prev": null,
  "next": null
}
*/

  String? first;
  String? last;
  String? prev;
  String? next;

  ProductResponseDataLinks({this.first, this.last, this.prev, this.next});

  ProductResponseDataLinks.fromJson(Map<String, dynamic> json) {
    first = json['first']?.toString();
    last = json['last']?.toString();
    prev = json['prev']?.toString();
    next = json['next']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class ProductResponseDataMeta {
  /*
{
  "current_page": 1,
  "from": 1,
  "last_page": 1,
  "per_page": 20,
  "to": 2,
  "total": 2
}
*/

  String? currentPage;
  String? from;
  String? lastPage;
  String? perPage;
  String? to;
  String? total;

  ProductResponseDataMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  ProductResponseDataMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page']?.toString();
    from = json['from']?.toString();
    lastPage = json['last_page']?.toString();
    perPage = json['per_page']?.toString();
    to = json['to']?.toString();
    total = json['total']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class ProductResponseDataDataLatestPromotionItemPromotion {
  /*
{
  "id": 3,
  "title": "upto 20% off",
  "image": "promotions/1746612747_1933831446_1.jfif",
  "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
  "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
  "valid_from": "May 8, 2025",
  "valid_to": "May 8, 2025",
  "offer_type": "percent",
  "offer_value": "20.00",
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
  String? offerType;
  String? offerValue;
  String? promotionType;

  ProductResponseDataDataLatestPromotionItemPromotion({
    this.id,
    this.title,
    this.image,
    this.imageUrl,
    this.message,
    this.validFrom,
    this.validTo,
    this.offerType,
    this.offerValue,
    this.promotionType,
  });

  ProductResponseDataDataLatestPromotionItemPromotion.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    image = json['image']?.toString();
    imageUrl = json['image_url']?.toString();
    message = json['message']?.toString();
    validFrom = json['valid_from']?.toString();
    validTo = json['valid_to']?.toString();
    offerType = json['offer_type']?.toString();
    offerValue = json['offer_value']?.toString();
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
    data['offer_type'] = offerType;
    data['offer_value'] = offerValue;
    data['promotion_type'] = promotionType;
    return data;
  }
}

class ProductResponseDataDataLatestPromotionItem {
  /*
{
  "id": 42,
  "category": null,
  "promotion": {
    "id": 3,
    "title": "upto 20% off",
    "image": "promotions/1746612747_1933831446_1.jfif",
    "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
    "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
    "valid_from": "May 8, 2025",
    "valid_to": "May 8, 2025",
    "offer_type": "percent",
    "offer_value": "20.00",
    "promotion_type": "Running"
  }
}
*/

  String? id;
  String? category;
  ProductResponseDataDataLatestPromotionItemPromotion? promotion;

  ProductResponseDataDataLatestPromotionItem({
    this.id,
    this.category,
    this.promotion,
  });

  ProductResponseDataDataLatestPromotionItem.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['id']?.toString();
    category = json['category']?.toString();
    promotion =
        (json['promotion'] != null && (json['promotion'] is Map))
            ? ProductResponseDataDataLatestPromotionItemPromotion.fromJson(
              json['promotion'],
            )
            : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    if (promotion != null) {
      data['promotion'] = promotion!.toJson();
    }
    return data;
  }
}

class ProductResponseDataDataProductMeta {
  /*
{
  "id": 2,
  "product_id": 2,
  "unit_value": "1.5",
  "notes": "",
  "description": "<p>sdfds</p>"
}
*/

  String? id;
  String? productId;
  String? unitValue;
  String? notes;
  String? description;

  ProductResponseDataDataProductMeta({
    this.id,
    this.productId,
    this.unitValue,
    this.notes,
    this.description,
  });

  ProductResponseDataDataProductMeta.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    productId = json['product_id']?.toString();
    unitValue = json['unit_value']?.toString();
    notes = json['notes']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['unit_value'] = unitValue;
    data['notes'] = notes;
    data['description'] = description;
    return data;
  }
}

class ProductResponseDataDataProductUnit {
  /*
{
  "id": 2,
  "name": "Kg",
  "symbol": "kg",
  "type": "weight"
}
*/

  String? id;
  String? name;
  String? symbol;
  String? type;

  ProductResponseDataDataProductUnit({
    this.id,
    this.name,
    this.symbol,
    this.type,
  });

  ProductResponseDataDataProductUnit.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    symbol = json['symbol']?.toString();
    type = json['type']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['type'] = type;
    return data;
  }
}

class ProductResponseDataDataBrand {
  /*
{
  "id": 2,
  "name": "Kroger",
  "image": null,
  "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
  "status": "active"
}
*/

  String? id;
  String? name;
  String? image;
  String? imageUrl;
  String? status;

  ProductResponseDataDataBrand({
    this.id,
    this.name,
    this.image,
    this.imageUrl,
    this.status,
  });

  ProductResponseDataDataBrand.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    image = json['image']?.toString();
    imageUrl = json['image_url']?.toString();
    status = json['status']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['image_url'] = imageUrl;
    data['status'] = status;
    return data;
  }
}

class ProductResponseDataDataCategory {
  /*
{
  "id": 1,
  "name": "Fruits & Vegetables",
  "image": null,
  "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
  "slug": "fruits-vegetables",
  "status": "active"
}
*/

  String? id;
  String? name;
  String? image;
  String? imageUrl;
  String? slug;
  String? status;

  ProductResponseDataDataCategory({
    this.id,
    this.name,
    this.image,
    this.imageUrl,
    this.slug,
    this.status,
  });

  ProductResponseDataDataCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    image = json['image']?.toString();
    imageUrl = json['image_url']?.toString();
    slug = json['slug']?.toString();
    status = json['status']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['image_url'] = imageUrl;
    data['slug'] = slug;
    data['status'] = status;
    return data;
  }
}

class ProductResponseDataDataRating {
  /*
{
  "averageRating": "0",
  "totalReviewCount": 0
}
*/

  String? averageRating;
  String? totalReviewCount;

  ProductResponseDataDataRating({this.averageRating, this.totalReviewCount});

  ProductResponseDataDataRating.fromJson(Map<String, dynamic> json) {
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

class ProductResponseDataDataTaxes {
  /*
{
  "has_tax": "1",
  "tax_amount": "1"
}
*/

  String? hasTax;
  String? taxAmount;

  ProductResponseDataDataTaxes({this.hasTax, this.taxAmount});

  ProductResponseDataDataTaxes.fromJson(Map<String, dynamic> json) {
    hasTax = json['has_tax']?.toString();
    taxAmount = json['tax_amount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['has_tax'] = hasTax;
    data['tax_amount'] = taxAmount;
    return data;
  }
}

class ProductResponseDataData {
  /*
{
  "id": 2,
  "price": "22.95",
  "image": "products/1745483961_598300393_1.jpg",
  "image_url": "https://grozaar.heizoelscout.com/storage/products/1745483961_598300393_1.jpg",
  "category_id": 1,
  "brand_id": 2,
  "product_unit_id": 2,
  "name": "customer product",
  "barcode_image_url": "https://grozaar.heizoelscout.com/storage",
  "total_stock_quantity": 990,
  "available_for": "Customer",
  "taxes": {
    "has_tax": "1",
    "tax_amount": "1"
  },
  "rating": {
    "averageRating": "0",
    "totalReviewCount": 0
  },
  "created_at": "2025-04-24T08:39:21.000000Z",
  "category": {
    "id": 1,
    "name": "Fruits & Vegetables",
    "image": null,
    "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
    "slug": "fruits-vegetables",
    "status": "active"
  },
  "brand": {
    "id": 2,
    "name": "Kroger",
    "image": null,
    "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
    "status": "active"
  },
  "product_unit": {
    "id": 2,
    "name": "Kg",
    "symbol": "kg",
    "type": "weight"
  },
  "product_meta": {
    "id": 2,
    "product_id": 2,
    "unit_value": "1.5",
    "notes": "",
    "description": "<p>sdfds</p>"
  },
  "latest_promotion_item": {
    "id": 42,
    "category": null,
    "promotion": {
      "id": 3,
      "title": "upto 20% off",
      "image": "promotions/1746612747_1933831446_1.jfif",
      "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
      "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
      "valid_from": "May 8, 2025",
      "valid_to": "May 8, 2025",
      "offer_type": "percent",
      "offer_value": "20.00",
      "promotion_type": "Running"
    }
  }
}
*/

  String? id;
  String? price;
  String? image;
  String? imageUrl;
  String? categoryId;
  String? brandId;
  String? productUnitId;
  String? name;
  String? barcodeImageUrl;
  String? totalStockQuantity;
  String? availableFor;
  ProductResponseDataDataTaxes? taxes;
  ProductResponseDataDataRating? rating;
  String? createdAt;
  ProductResponseDataDataCategory? category;
  ProductResponseDataDataBrand? brand;
  ProductResponseDataDataProductUnit? productUnit;
  ProductResponseDataDataProductMeta? productMeta;
  ProductResponseDataDataLatestPromotionItem? latestPromotionItem;

  ProductResponseDataData({
    this.id,
    this.price,
    this.image,
    this.imageUrl,
    this.categoryId,
    this.brandId,
    this.productUnitId,
    this.name,
    this.barcodeImageUrl,
    this.totalStockQuantity,
    this.availableFor,
    this.taxes,
    this.rating,
    this.createdAt,
    this.category,
    this.brand,
    this.productUnit,
    this.productMeta,
    this.latestPromotionItem,
  });

  ProductResponseDataData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    price = json['price']?.toString();
    image = json['image']?.toString();
    imageUrl = json['image_url']?.toString();
    categoryId = json['category_id']?.toString();
    brandId = json['brand_id']?.toString();
    productUnitId = json['product_unit_id']?.toString();
    name = json['name']?.toString();
    barcodeImageUrl = json['barcode_image_url']?.toString();
    totalStockQuantity = json['total_stock_quantity']?.toString();
    availableFor = json['available_for']?.toString();
    taxes =
        (json['taxes'] != null && (json['taxes'] is Map))
            ? ProductResponseDataDataTaxes.fromJson(json['taxes'])
            : null;
    rating =
        (json['rating'] != null && (json['rating'] is Map))
            ? ProductResponseDataDataRating.fromJson(json['rating'])
            : null;
    createdAt = json['created_at']?.toString();
    category =
        (json['category'] != null && (json['category'] is Map))
            ? ProductResponseDataDataCategory.fromJson(json['category'])
            : null;
    brand =
        (json['brand'] != null && (json['brand'] is Map))
            ? ProductResponseDataDataBrand.fromJson(json['brand'])
            : null;
    productUnit =
        (json['product_unit'] != null && (json['product_unit'] is Map))
            ? ProductResponseDataDataProductUnit.fromJson(json['product_unit'])
            : null;
    productMeta =
        (json['product_meta'] != null && (json['product_meta'] is Map))
            ? ProductResponseDataDataProductMeta.fromJson(json['product_meta'])
            : null;
    latestPromotionItem =
        (json['latest_promotion_item'] != null &&
                (json['latest_promotion_item'] is Map))
            ? ProductResponseDataDataLatestPromotionItem.fromJson(
              json['latest_promotion_item'],
            )
            : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['image'] = image;
    data['image_url'] = imageUrl;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['product_unit_id'] = productUnitId;
    data['name'] = name;
    data['barcode_image_url'] = barcodeImageUrl;
    data['total_stock_quantity'] = totalStockQuantity;
    data['available_for'] = availableFor;
    if (taxes != null) {
      data['taxes'] = taxes!.toJson();
    }
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['created_at'] = createdAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (productUnit != null) {
      data['product_unit'] = productUnit!.toJson();
    }
    if (productMeta != null) {
      data['product_meta'] = productMeta!.toJson();
    }
    if (latestPromotionItem != null) {
      data['latest_promotion_item'] = latestPromotionItem!.toJson();
    }
    return data;
  }
}

class ProductResponseData {
  /*
{
  "data": [
    {
      "id": 2,
      "price": "22.95",
      "image": "products/1745483961_598300393_1.jpg",
      "image_url": "https://grozaar.heizoelscout.com/storage/products/1745483961_598300393_1.jpg",
      "category_id": 1,
      "brand_id": 2,
      "product_unit_id": 2,
      "name": "customer product",
      "barcode_image_url": "https://grozaar.heizoelscout.com/storage",
      "total_stock_quantity": 990,
      "available_for": "Customer",
      "taxes": {
        "has_tax": "1",
        "tax_amount": "1"
      },
      "rating": {
        "averageRating": "0",
        "totalReviewCount": 0
      },
      "created_at": "2025-04-24T08:39:21.000000Z",
      "category": {
        "id": 1,
        "name": "Fruits & Vegetables",
        "image": null,
        "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
        "slug": "fruits-vegetables",
        "status": "active"
      },
      "brand": {
        "id": 2,
        "name": "Kroger",
        "image": null,
        "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
        "status": "active"
      },
      "product_unit": {
        "id": 2,
        "name": "Kg",
        "symbol": "kg",
        "type": "weight"
      },
      "product_meta": {
        "id": 2,
        "product_id": 2,
        "unit_value": "1.5",
        "notes": "",
        "description": "<p>sdfds</p>"
      },
      "latest_promotion_item": {
        "id": 42,
        "category": null,
        "promotion": {
          "id": 3,
          "title": "upto 20% off",
          "image": "promotions/1746612747_1933831446_1.jfif",
          "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
          "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
          "valid_from": "May 8, 2025",
          "valid_to": "May 8, 2025",
          "offer_type": "percent",
          "offer_value": "20.00",
          "promotion_type": "Running"
        }
      }
    }
  ],
  "meta": {
    "current_page": 1,
    "from": 1,
    "last_page": 1,
    "per_page": 20,
    "to": 2,
    "total": 2
  },
  "links": {
    "first": "https://grozaar.heizoelscout.com/api/v1/user/get-products?page=1",
    "last": "https://grozaar.heizoelscout.com/api/v1/user/get-products?page=1",
    "prev": null,
    "next": null
  }
}
*/

  List<ProductResponseDataData?>? data;
  ProductResponseDataMeta? meta;
  ProductResponseDataLinks? links;

  ProductResponseData({this.data, this.meta, this.links});

  ProductResponseData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && (json['data'] is List)) {
      final v = json['data'];
      final arr0 = <ProductResponseDataData>[];
      v.forEach((v) {
        arr0.add(ProductResponseDataData.fromJson(v));
      });
      this.data = arr0;
    }
    meta =
        (json['meta'] != null && (json['meta'] is Map))
            ? ProductResponseDataMeta.fromJson(json['meta'])
            : null;
    links =
        (json['links'] != null && (json['links'] is Map))
            ? ProductResponseDataLinks.fromJson(json['links'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class ProductResponse {
  /*
{
  "success": true,
  "message": "Success",
  "data": {
    "data": [
      {
        "id": 2,
        "price": "22.95",
        "image": "products/1745483961_598300393_1.jpg",
        "image_url": "https://grozaar.heizoelscout.com/storage/products/1745483961_598300393_1.jpg",
        "category_id": 1,
        "brand_id": 2,
        "product_unit_id": 2,
        "name": "customer product",
        "barcode_image_url": "https://grozaar.heizoelscout.com/storage",
        "total_stock_quantity": 990,
        "available_for": "Customer",
        "taxes": {
          "has_tax": "1",
          "tax_amount": "1"
        },
        "rating": {
          "averageRating": "0",
          "totalReviewCount": 0
        },
        "created_at": "2025-04-24T08:39:21.000000Z",
        "category": {
          "id": 1,
          "name": "Fruits & Vegetables",
          "image": null,
          "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
          "slug": "fruits-vegetables",
          "status": "active"
        },
        "brand": {
          "id": 2,
          "name": "Kroger",
          "image": null,
          "image_url": "https://grozaar.heizoelscout.com/images/default/default.png",
          "status": "active"
        },
        "product_unit": {
          "id": 2,
          "name": "Kg",
          "symbol": "kg",
          "type": "weight"
        },
        "product_meta": {
          "id": 2,
          "product_id": 2,
          "unit_value": "1.5",
          "notes": "",
          "description": "<p>sdfds</p>"
        },
        "latest_promotion_item": {
          "id": 42,
          "category": null,
          "promotion": {
            "id": 3,
            "title": "upto 20% off",
            "image": "promotions/1746612747_1933831446_1.jfif",
            "image_url": "https://grozaar.heizoelscout.com/storage/promotions/1746612747_1933831446_1.jfif",
            "message": "<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>",
            "valid_from": "May 8, 2025",
            "valid_to": "May 8, 2025",
            "offer_type": "percent",
            "offer_value": "20.00",
            "promotion_type": "Running"
          }
        }
      }
    ],
    "meta": {
      "current_page": 1,
      "from": 1,
      "last_page": 1,
      "per_page": 20,
      "to": 2,
      "total": 2
    },
    "links": {
      "first": "https://grozaar.heizoelscout.com/api/v1/user/get-products?page=1",
      "last": "https://grozaar.heizoelscout.com/api/v1/user/get-products?page=1",
      "prev": null,
      "next": null
    }
  }
}
*/

  bool? success;
  String? message;
  ProductResponseData? data;

  ProductResponse({this.success, this.message, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
    data =
        (json['data'] != null && (json['data'] is Map))
            ? ProductResponseData.fromJson(json['data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
