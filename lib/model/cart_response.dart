class CartResponseItemsCategory {
  /*
{
  "id": 1,
  "name": "Fruits & Vegetables",
  "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
}
*/

  String? id;
  String? name;
  String? imageUrl;

  CartResponseItemsCategory({this.id, this.name, this.imageUrl});

  CartResponseItemsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    imageUrl = json['image_url']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    return data;
  }
}

class CartResponseItemsProductMeta {
  /*
{
  "id": 1,
  "product_id": 1,
  "unit_value": "10"
}
*/

  String? id;
  String? productId;
  String? unitValue;

  CartResponseItemsProductMeta({this.id, this.productId, this.unitValue});

  CartResponseItemsProductMeta.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    productId = json['product_id']?.toString();
    unitValue = json['unit_value']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['unit_value'] = unitValue;
    return data;
  }
}

class CartResponseItemsProductUnit {
  /*
{
  "id": 1,
  "name": "Ps",
  "symbol": "ps",
  "type": "quantity"
}
*/

  String? id;
  String? name;
  String? symbol;
  String? type;

  CartResponseItemsProductUnit({this.id, this.name, this.symbol, this.type});

  CartResponseItemsProductUnit.fromJson(Map<String, dynamic> json) {
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

class CartResponseItemsRating {
  /*
{
  "averageRating": "1.5",
  "totalReviewCount": 1
}
*/

  String? averageRating;
  String? totalReviewCount;

  CartResponseItemsRating({this.averageRating, this.totalReviewCount});

  CartResponseItemsRating.fromJson(Map<String, dynamic> json) {
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

class CartResponseItems {
  /*
{
  "product_id": 1,
  "cart_id": 4,
  "product_name": "Both Product",
  "image_url": "products/1745483907_841631781_1.jpeg",
  "price": "20.91",
  "tax_price": "0.42",
  "promotion_price": "0.00",
  "sub_total": "21.33",
  "quantity": 10,
  "total_price": "213.30",
  "rating": {
    "averageRating": "1.5",
    "totalReviewCount": 1
  },
  "total_stock_quantity": 1987,
  "product_unit": {
    "id": 1,
    "name": "Ps",
    "symbol": "ps",
    "type": "quantity"
  },
  "product_meta": {
    "id": 1,
    "product_id": 1,
    "unit_value": "10"
  },
  "category": {
    "id": 1,
    "name": "Fruits & Vegetables",
    "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
  },
  "promotion": null
}
*/

  String? productId;
  String? cartId;
  String? productName;
  String? imageUrl;
  String? price;
  String? taxPrice;
  String? promotionPrice;
  String? subTotal;
  String? quantity;
  String? totalPrice;
  CartResponseItemsRating? rating;
  String? totalStockQuantity;
  CartResponseItemsProductUnit? productUnit;
  CartResponseItemsProductMeta? productMeta;
  CartResponseItemsCategory? category;
  String? promotion;

  CartResponseItems({
    this.productId,
    this.cartId,
    this.productName,
    this.imageUrl,
    this.price,
    this.taxPrice,
    this.promotionPrice,
    this.subTotal,
    this.quantity,
    this.totalPrice,
    this.rating,
    this.totalStockQuantity,
    this.productUnit,
    this.productMeta,
    this.category,
    this.promotion,
  });

  CartResponseItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id']?.toString();
    cartId = json['cart_id']?.toString();
    productName = json['product_name']?.toString();
    imageUrl = json['image_url']?.toString();
    price = json['price']?.toString();
    taxPrice = json['tax_price']?.toString();
    promotionPrice = json['promotion_price']?.toString();
    subTotal = json['sub_total']?.toString();
    quantity = json['quantity']?.toString();
    totalPrice = json['total_price']?.toString();
    rating =
        (json['rating'] != null && (json['rating'] is Map))
            ? CartResponseItemsRating.fromJson(json['rating'])
            : null;
    totalStockQuantity = json['total_stock_quantity']?.toString();
    productUnit =
        (json['product_unit'] != null && (json['product_unit'] is Map))
            ? CartResponseItemsProductUnit.fromJson(json['product_unit'])
            : null;
    productMeta =
        (json['product_meta'] != null && (json['product_meta'] is Map))
            ? CartResponseItemsProductMeta.fromJson(json['product_meta'])
            : null;
    category =
        (json['category'] != null && (json['category'] is Map))
            ? CartResponseItemsCategory.fromJson(json['category'])
            : null;
    promotion = json['promotion']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product_id'] = productId;
    data['cart_id'] = cartId;
    data['product_name'] = productName;
    data['image_url'] = imageUrl;
    data['price'] = price;
    data['tax_price'] = taxPrice;
    data['promotion_price'] = promotionPrice;
    data['sub_total'] = subTotal;
    data['quantity'] = quantity;
    data['total_price'] = totalPrice;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['total_stock_quantity'] = totalStockQuantity;
    if (productUnit != null) {
      data['product_unit'] = productUnit!.toJson();
    }
    if (productMeta != null) {
      data['product_meta'] = productMeta!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['promotion'] = promotion;
    return data;
  }
}

class CartResponse {
  /*
{
  "items": [
    {
      "product_id": 1,
      "cart_id": 4,
      "product_name": "Both Product",
      "image_url": "products/1745483907_841631781_1.jpeg",
      "price": "20.91",
      "tax_price": "0.42",
      "promotion_price": "0.00",
      "sub_total": "21.33",
      "quantity": 10,
      "total_price": "213.30",
      "rating": {
        "averageRating": "1.5",
        "totalReviewCount": 1
      },
      "total_stock_quantity": 1987,
      "product_unit": {
        "id": 1,
        "name": "Ps",
        "symbol": "ps",
        "type": "quantity"
      },
      "product_meta": {
        "id": 1,
        "product_id": 1,
        "unit_value": "10"
      },
      "category": {
        "id": 1,
        "name": "Fruits & Vegetables",
        "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
      },
      "promotion": null
    }
  ],
  "total": 213.3,
  "delivery_cost": 50,
  "total_tax_price": 0.42
}
*/

  List<CartResponseItems?>? items;
  String? total;
  String? deliveryCost;
  String? totalTaxPrice;

  CartResponse({this.items, this.total, this.deliveryCost, this.totalTaxPrice});

  CartResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null && (json['items'] is List)) {
      final v = json['items'];
      final arr0 = <CartResponseItems>[];
      v.forEach((v) {
        arr0.add(CartResponseItems.fromJson(v));
      });
      items = arr0;
    }
    total = json['total']?.toString();
    deliveryCost = json['delivery_cost']?.toString();
    totalTaxPrice = json['total_tax_price']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (items != null) {
      final v = items;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['items'] = arr0;
    }
    data['total'] = total;
    data['delivery_cost'] = deliveryCost;
    data['total_tax_price'] = totalTaxPrice;
    return data;
  }
}
