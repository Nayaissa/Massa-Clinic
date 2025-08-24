class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? phonenumber;
  int? age;
  String? location;
  String? profileImageUrl;
  String? imageUrl;
  String? createdAt;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phonenumber,
    this.age,
    this.location,
    this.profileImageUrl,
    this.createdAt,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    age = json['age'];
    location = json['location'];
    profileImageUrl = json['profile_image_url'];
    imageUrl = json['image_url'] ?? profileImageUrl;
    
   
    if (imageUrl != null) {
      imageUrl = imageUrl!.replaceAll('127.0.0.1', '10.0.2.2');
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['age'] = this.age;
    data['location'] = this.location;
    data['profile_image_url'] = this.profileImageUrl;
    data['created_at'] = this.createdAt;
    return data;
  }
}
