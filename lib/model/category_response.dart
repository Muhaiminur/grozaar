class CategoryResponseDataMeta {
  /*
{
  "current_page": 1,
  "from": 1,
  "last_page": 1,
  "per_page": 20,
  "to": 9,
  "total": 9
}
*/

  String? currentPage;
  String? from;
  String? lastPage;
  String? perPage;
  String? to;
  String? total;

  CategoryResponseDataMeta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  CategoryResponseDataMeta.fromJson(Map<String, dynamic> json) {
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

class CategoryResponseDataData {
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

  CategoryResponseDataData({this.id, this.name, this.image, this.imageUrl});

  CategoryResponseDataData.fromJson(Map<String, dynamic> json) {
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

class CategoryResponseData {
  /*
{
  "data": [
    {
      "id": 9,
      "name": "dfd",
      "image": null,
      "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
    }
  ],
  "meta": {
    "current_page": 1,
    "from": 1,
    "last_page": 1,
    "per_page": 20,
    "to": 9,
    "total": 9
  }
}
*/

  List<CategoryResponseDataData?>? data;
  CategoryResponseDataMeta? meta;

  CategoryResponseData({this.data, this.meta});

  CategoryResponseData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && (json['data'] is List)) {
      final v = json['data'];
      final arr0 = <CategoryResponseDataData>[];
      v.forEach((v) {
        arr0.add(CategoryResponseDataData.fromJson(v));
      });
      this.data = arr0;
    }
    meta =
        (json['meta'] != null && (json['meta'] is Map))
            ? CategoryResponseDataMeta.fromJson(json['meta'])
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
    return data;
  }
}

class CategoryResponse {
  /*
{
  "success": true,
  "message": "Success",
  "data": {
    "data": [
      {
        "id": 9,
        "name": "dfd",
        "image": null,
        "image_url": "https://grozaar.heizoelscout.com/images/default/default.png"
      }
    ],
    "meta": {
      "current_page": 1,
      "from": 1,
      "last_page": 1,
      "per_page": 20,
      "to": 9,
      "total": 9
    }
  }
}
*/

  bool? success;
  String? message;
  CategoryResponseData? data;

  CategoryResponse({this.success, this.message, this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
    data =
        (json['data'] != null && (json['data'] is Map))
            ? CategoryResponseData.fromJson(json['data'])
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
