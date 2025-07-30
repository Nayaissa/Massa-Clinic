class AddFavoriteModel {
  int? isFavorite;
  String? message;
  String? serviceId;
  int? userId;

  AddFavoriteModel(
      {this.isFavorite, this.message, this.serviceId, this.userId});

  AddFavoriteModel.fromJson(Map<String, dynamic> json) {
    isFavorite = json['is_favorite'];
    message = json['message'];
    serviceId = json['service_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_favorite'] = this.isFavorite;
    data['message'] = this.message;
    data['service_id'] = this.serviceId;
    data['user_id'] = this.userId;
    return data;
  }
}