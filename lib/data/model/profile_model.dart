class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? phonenumber;
  String? profileImageUrl;
  String? createdAt;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phonenumber,
    this.profileImageUrl,
    this.createdAt,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];

    profileImageUrl = json['profile_image_url'];

    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['profile_image_url'] = profileImageUrl;
    data['created_at'] = createdAt;
    return data;
  }
}
