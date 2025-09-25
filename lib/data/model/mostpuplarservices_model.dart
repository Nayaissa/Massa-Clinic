class MostPuplarServicesModel {
  List<PopularServices>? popularServices;

  MostPuplarServicesModel({this.popularServices});

  MostPuplarServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['popular_services'] != null) {
      popularServices = <PopularServices>[];
      json['popular_services'].forEach((v) {
        popularServices!.add(new PopularServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.popularServices != null) {
      data['popular_services'] =
          this.popularServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PopularServices {
  int? serviceId;
  String? serviceName;
  String? serviceImage;
  int? reservations;
  int? percentage;

  PopularServices(
      {this.serviceId,
      this.serviceName,
      this.serviceImage,
      this.reservations,
      this.percentage});

  PopularServices.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceImage = json['service_image'];
    reservations = json['reservations'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['service_image'] = this.serviceImage;
    data['reservations'] = this.reservations;
    data['percentage'] = this.percentage;
    return data;
  }
}