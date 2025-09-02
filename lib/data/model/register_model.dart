class RegisterModel {
  String? message;
  String? accessToken;
  YourAccount? yourAccount;
  String? profileImageUrl;

  RegisterModel(
      {this.message, this.accessToken, this.yourAccount, this.profileImageUrl});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    yourAccount = json['your_account'] != null
        ? new YourAccount.fromJson(json['your_account'])
        : null;
    profileImageUrl = json['profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    if (this.yourAccount != null) {
      data['your_account'] = this.yourAccount!.toJson();
    }
    data['profile_image_url'] = this.profileImageUrl;
    return data;
  }
}

class YourAccount {
  String? name;
  String? email;
  String? phonenumber;
  String? profileImage;
  String? updatedAt;
  String? createdAt;
  int? id;

  YourAccount(
      {this.name,
      this.email,
      this.phonenumber,
      this.profileImage,
      this.updatedAt,
      this.createdAt,
      this.id});

  YourAccount.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    profileImage = json['profile_image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['profile_image'] = this.profileImage;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}