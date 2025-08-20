class EditProfile {
  String? message;
  User? user;

  EditProfile({this.message, this.user});

  EditProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phonenumber;
  String? age;
  String? location;
  String? imageUrl;

  User(
      {this.id,
      this.name,
      this.email,
      this.phonenumber,
      this.age,
      this.location,
      this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    age = json['age'];
    location = json['location'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['age'] = this.age;
    data['location'] = this.location;
    data['image_url'] = this.imageUrl;
    return data;
  }
}