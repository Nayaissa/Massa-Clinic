class StatusesModel {
  List<String>? statuses;

  StatusesModel({this.statuses});

  StatusesModel.fromJson(Map<String, dynamic> json) {
    statuses = json['statuses'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuses'] = this.statuses;
    return data;
  }
}