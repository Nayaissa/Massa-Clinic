class LoginModel {
  String? message;
  String? token;
  YourAccount? yourAccount;
  String? imageUrl;

  LoginModel({this.message, this.token, this.yourAccount, this.imageUrl});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    yourAccount = json['your account '] != null
        ? new YourAccount.fromJson(json['your account '])
        : null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.yourAccount != null) {
      data['your account '] = this.yourAccount!.toJson();
    }
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class YourAccount {
  int? id;
  String? name;
  String? email;
  String? phonenumber;
  int? age;
  String? location;
  String? emailVerifiedAt;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  List<Roles>? roles;

  YourAccount(
      {this.id,
      this.name,
      this.email,
      this.phonenumber,
      this.age,
      this.location,
      this.emailVerifiedAt,
      this.fcmToken,
      this.createdAt,
      this.updatedAt,
      this.profileImage,
      this.roles});

  YourAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    age = json['age'];
    location = json['location'];
    emailVerifiedAt = json['email_verified_at'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['age'] = this.age;
    data['location'] = this.location;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['fcm_token'] = this.fcmToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_image'] = this.profileImage;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
      this.name,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? modelType;
  int? modelId;
  int? roleId;

  Pivot({this.modelType, this.modelId, this.roleId});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelType = json['model_type'];
    modelId = json['model_id'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    return data;
  }
}