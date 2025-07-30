class ServicesModel {
  List<Data>? data;

  ServicesModel({this.data});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? classificationId;
  String? name;
  String? image;
  String? price;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? is_favorite;
  Classification? classification;

  Data(
      {this.id,
      this.classificationId,
      this.name,
      this.image,
      this.price,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.is_favorite,
      this.classification});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classificationId = json['classification_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    is_favorite = json['is_favorite'];
    classification = json['classification'] != null
        ? new Classification.fromJson(json['classification'])
        : null;
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
    if (this.classification != null) {
      data['classification'] = this.classification!.toJson();
    }
    return data;
  }
}

class Classification {
  int? id;
  String? title;
  String? createdAt;
  String? updatedAt;

  Classification({this.id, this.title, this.createdAt, this.updatedAt});

  Classification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}