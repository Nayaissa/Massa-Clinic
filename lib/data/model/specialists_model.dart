class SpecialistsModel {
  Data? data;

  SpecialistsModel({this.data});

  SpecialistsModel.fromJson(Map<String, dynamic> json) {
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
  List<Specialists>? specialists;

  Data({this.serviceId, this.serviceName, this.specialists});

  Data.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    if (json['specialists'] != null) {
      specialists = <Specialists>[];
      json['specialists'].forEach((v) {
        specialists!.add(new Specialists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    if (this.specialists != null) {
      data['specialists'] = this.specialists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specialists {
  int? id;
  String? nameSpecialist;
  int? number;
  String? email;
  String? address;
  String? imageSpecialist;
  String? image;
  Null? deletedAt;

  Specialists({
    this.id,
    this.nameSpecialist,
    this.number,
    this.email,
    this.address,
    this.imageSpecialist,
    this.image,
    this.deletedAt,
  });

  Specialists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSpecialist = json['name Specialist'];
    number = json['number'];
    email = json['email'];
    address = json['address'];
    imageSpecialist = json['image Specialist'];
     imageSpecialist = json['image Specialist'];
  image = imageSpecialist?.replaceAll('127.0.0.1', '10.0.2.2');
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name Specialist'] = this.nameSpecialist;
    data['number'] = this.number;
    data['email'] = this.email;
    data['address'] = this.address;
    data['image Specialist'] = this.imageSpecialist;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
