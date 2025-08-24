class CouponModel {
  List<Data>? data;

  CouponModel({this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? description;
  String? startDate;
  String? endDate;
  int? numOfParticipant;
  String? couponCode;
  String? percentage;
  List<Services>? services;

  Data(
      {this.id,
      this.image,
      this.description,
      this.startDate,
      this.endDate,
      this.numOfParticipant,
      this.couponCode,
      this.percentage,
      this.services});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    numOfParticipant = json['num_of_participant'];
    couponCode = json['coupon_code'];
    percentage = json['percentage'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['num_of_participant'] = this.numOfParticipant;
    data['coupon_code'] = this.couponCode;
    data['percentage'] = this.percentage;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  int? classificationId;
  String? name;
  String? image;
  String? price;
  int? totalSessions;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? isFavorite;
  Classification? classification;

  Services(
      {this.id,
      this.classificationId,
      this.name,
      this.image,
      this.price,
      this.totalSessions,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.isFavorite,
      this.classification});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classificationId = json['classification_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    totalSessions = json['total_sessions'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFavorite = json['is_favorite'];
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
    data['total_sessions'] = this.totalSessions;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_favorite'] = this.isFavorite;
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