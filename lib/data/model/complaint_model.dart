class ComplaintModel {
  List<Data>? data;

  ComplaintModel({this.data});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
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
  String? content;
  String? status;
  String? createdAt;
  String? resolvedAt;
  User? user;

  Data({
    this.id,
    this.content,
    this.status,
    this.createdAt,
    this.resolvedAt,
    this.user,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    status = json['status'];
    createdAt = json['created_at'];
    resolvedAt = json['resolved_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['resolved_at'] = this.resolvedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? image;
  String? imageUrl;

  User({this.name, this.image, this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    imageUrl = image?.replaceAll('127.0.0.1', '10.0.2.2');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
