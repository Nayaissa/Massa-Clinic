class PostModel {
  List<Data>? data;

  PostModel({this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? description;
  List<String>? images;
  int? commentsCount;
  List<Comment> comments = []; 
  int? favoritesCount;
  String? createdAt;

  Data({
    this.id,
    this.description,
    this.images,
    this.commentsCount,
    List<Comment>? comments,
    this.favoritesCount,
    this.createdAt,
  }) {
    this.comments = comments ?? [];
  }

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    images = json['images'] != null ? List<String>.from(json['images']) : [];
    commentsCount = json['comments_count'];
    if (json['comments'] != null) {
      comments = List<Comment>.from(json['comments'].map((v) => Comment.fromJson(v)));
    } else {
      comments = [];
    }
    favoritesCount = json['favorites_count'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['description'] = this.description;
    data['images'] = this.images;
    data['comments_count'] = this.commentsCount;
    data['comments'] = this.comments.map((v) => v.toJson()).toList();
    data['favorites_count'] = this.favoritesCount;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Comment {
  int? id;
  String? content;
  String? userName;
  String? createdAt;

  Comment({this.id, this.content, this.userName, this.createdAt});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    userName = json['user_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['content'] = this.content;
    data['user_name'] = this.userName;
    data['created_at'] = this.createdAt;
    return data;
  }
}
