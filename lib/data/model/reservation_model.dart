class ReservationsModel {
  List<Data>? data;

  ReservationsModel({this.data});

  ReservationsModel.fromJson(Map<String, dynamic> json) {
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
  int? reservationId;
  String? reservationDate;
  String? status;
  String? serviceName;
  String? classificationName;
  int? sessionId;
  String? sessionName;
  int? sessionPrice;

  Data(
      {this.reservationId,
      this.reservationDate,
      this.status,
      this.serviceName,
      this.classificationName,
      this.sessionId,
      this.sessionName,
      this.sessionPrice});

  Data.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservation_id'];
reservationDate = json['reservation_date']?.toString();
    status = json['status'];
    serviceName = json['service_name'];
    classificationName = json['classification_name'];
    sessionId = json['session_id'];
    sessionName = json['session_name'];
    sessionPrice = json['session_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reservation_id'] = this.reservationId;
    data['reservation_date'] = this.reservationDate;
    data['status'] = this.status;
    data['service_name'] = this.serviceName;
    data['classification_name'] = this.classificationName;
    data['session_id'] = this.sessionId;
    data['session_name'] = this.sessionName;
    data['session_price'] = this.sessionPrice;
    return data;
  }
}