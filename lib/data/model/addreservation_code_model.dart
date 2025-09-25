class AddReservationCodeModel {
  String? message;
  Reservation? reservation;
  String? bookedSessionName;
  int? newPrice;

  AddReservationCodeModel(
      {this.message, this.reservation, this.bookedSessionName, this.newPrice});

  AddReservationCodeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    reservation = json['reservation'] != null
        ? new Reservation.fromJson(json['reservation'])
        : null;
    bookedSessionName = json['booked_session_name'];
    newPrice = json['new_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.toJson();
    }
    data['booked_session_name'] = this.bookedSessionName;
    data['new_price'] = this.newPrice;
    return data;
  }
}

class Reservation {
  int? userId;
  int? serviceId;
  String? status;
  String? sessionType;
  int? sessionId;
  String? updatedAt;
  String? createdAt;
  int? id;
  Service? service;

  Reservation(
      {this.userId,
      this.serviceId,
      this.status,
      this.sessionType,
      this.sessionId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.service});

  Reservation.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    serviceId = json['service_id'];
    status = json['status'];
    sessionType = json['session_type'];
    sessionId = json['session_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['status'] = this.status;
    data['session_type'] = this.sessionType;
    data['session_id'] = this.sessionId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
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
  int? totalSessions;
  String? createdAt;
  String? updatedAt;

  Service(
      {this.id,
      this.classificationId,
      this.name,
      this.image,
      this.price,
      this.description,
      this.totalSessions,
      this.createdAt,
      this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classificationId = json['classification_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    totalSessions = json['total_sessions'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classification_id'] = this.classificationId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    data['total_sessions'] = this.totalSessions;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}