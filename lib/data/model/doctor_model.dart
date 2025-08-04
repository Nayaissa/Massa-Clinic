class DoctorModel {
  Data? data;

  DoctorModel({this.data});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? serviceId;
  String? serviceName;
  List<Doctors>? doctors;

  Data({this.serviceId, this.serviceName, this.doctors});

  Data.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? id;
  String? name;
  int? number;
  String? email;
  String? address;
  String? imageDoctor;
  String? image;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Doctors({
    this.id,
    this.name,
    this.number,
    this.email,
    this.address,
    this.imageDoctor,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    email = json['email'];
    address = json['address'];
    imageDoctor = json['image_Doctor'];
    image = imageDoctor?.replaceAll('127.0.0.1', '10.0.2.2');
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['email'] = this.email;
    data['address'] = this.address;
    data['image_Doctor'] = this.imageDoctor;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
