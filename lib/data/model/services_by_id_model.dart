class ServicesModelById {
  List<Services>? services;

  ServicesModelById({this.services});

  ServicesModelById.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      services = <Services>[];
      json['data'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (services != null) {
      data['data'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Services {
  int? id;
  int? classificationId;
  String? name;
  String? image;
  String? imageUp;
  String? price;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? is_favorite;

  Services({
    this.id,
    this.classificationId,
    this.name,
    this.image,
    this.imageUp,
    this.price,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.is_favorite,
  });

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classificationId = json['classification_id'];
    name = json['name'];
    image = json['image'];
    imageUp = image!.replaceAll('127.0.0.1', '10.0.2.2');
    price = json['price'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    is_favorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classification_id'] = this.classificationId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_favorite'] = this.is_favorite;
    return data;
  }
}
