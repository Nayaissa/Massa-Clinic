class ReservationsModel {
  List<Reservation>? reservation;

  ReservationsModel({this.reservation});

  ReservationsModel.fromJson(Map<String, dynamic> json) {
    if (json['reservation'] != null) {
      reservation = <Reservation>[];
      json['reservation'].forEach((v) {
        reservation!.add(new Reservation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reservation {
  int? id;
  String? status;
  String? createdAt;
  Service? service;

  Reservation({this.id, this.status, this.createdAt, this.service});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Service {
  int? id;
  int? classificationId;
  String? name;
  String? image;
  String? price;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? isFavorite;
  Classification? classification;

  Service(
      {this.id,
      this.classificationId,
      this.name,
      this.image,
      this.price,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.isFavorite,
      this.classification});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classificationId = json['classification_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
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