class CommentPostModel {
  List<Data>? data;

  CommentPostModel({this.data});

  CommentPostModel.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? userImage;
  String? image;

  String? content;
  String? createdAt;

  Data({this.id, this.userName, this.userImage, this.content, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    userImage = json['user_image'];
    image = userImage!.replaceAll('127.0.0.1', '10.0.2.2');
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    return data;
  }
}
