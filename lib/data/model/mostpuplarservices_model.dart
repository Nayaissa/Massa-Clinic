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
  int? id;
  String? name;
  String? price;
  String? description;
  String? imageUrl;

  PopularServices(
      {this.id, this.name, this.price, this.description, this.imageUrl});

  PopularServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}