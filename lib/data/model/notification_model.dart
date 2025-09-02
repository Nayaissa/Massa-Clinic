class NotificationModel {
  bool? status;
  String? message;
  List<Data>? data;

  NotificationModel({this.status, this.message, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? notificationId;
  String? title;
  String? body;
  int? userId;
  String? customerName;
  String? createdAt;
  String? timeAgo;

  Data(
      {this.notificationId,
      this.title,
      this.body,
      this.userId,
      this.customerName,
      this.createdAt,
      this.timeAgo});

  Data.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    title = json['title'];
    body = json['body'];
    userId = json['user_id'];
    customerName = json['customer_name'];
    createdAt = json['created_at'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['user_id'] = this.userId;
    data['customer_name'] = this.customerName;
    data['created_at'] = this.createdAt;
    data['time_ago'] = this.timeAgo;
    return data;
  }
}