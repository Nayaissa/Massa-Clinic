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
  double? sessionPrice;
  PaymentInfo? paymentInfo;
  Time? time;
  Buttons? buttons;

  Data(
      {this.reservationId,
      this.reservationDate,
      this.status,
      this.serviceName,
      this.classificationName,
      this.sessionId,
      this.sessionName,
      this.sessionPrice,
      this.paymentInfo,
      this.time,
      this.buttons});

  Data.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservation_id'];
    reservationDate = json['reservation_date'];
    status = json['status'];
    serviceName = json['service_name'];
    classificationName = json['classification_name'];
    sessionId = json['session_id'];
    sessionName = json['session_name'];
    sessionPrice = _parseDouble(json['session_price']);
    paymentInfo = json['payment_info'] != null ? new PaymentInfo.fromJson(json['payment_info']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    buttons =
        json['buttons'] != null ? new Buttons.fromJson(json['buttons']) : null;
  }

  // Helper method to safely parse double values from string or numeric
  double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
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
    if (this.paymentInfo != null) {
      data['payment_info'] = this.paymentInfo!.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.buttons != null) {
      data['buttons'] = this.buttons!.toJson();
    }
    return data;
  }
}

class Time {
  String? startTime;
  String? endTime;
  String? date;

  Time({this.startTime, this.endTime, this.date});

  Time.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['date'] = this.date;
    return data;
  }
}

class Buttons {
  bool? confirmEnabled;
  bool? cancelEnabled;

  Buttons({this.confirmEnabled, this.cancelEnabled});

  Buttons.fromJson(Map<String, dynamic> json) {
    confirmEnabled = json['confirm_enabled'];
    cancelEnabled = json['cancel_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirm_enabled'] = this.confirmEnabled;
    data['cancel_enabled'] = this.cancelEnabled;
    return data;
  }
}

class PaymentInfo {
  double? requiredAmount;
  double? userBalance;
  bool? canAfford;
  double? shortfall;

  PaymentInfo({this.requiredAmount, this.userBalance, this.canAfford, this.shortfall});

  PaymentInfo.fromJson(Map<String, dynamic> json) {
    requiredAmount = _parseDouble(json['required_amount']);
    userBalance = _parseDouble(json['user_balance']);
    canAfford = json['can_afford'];
    shortfall = _parseDouble(json['shortfall']);
  }

  // Helper method to safely parse double values
  double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['required_amount'] = this.requiredAmount;
    data['user_balance'] = this.userBalance;
    data['can_afford'] = this.canAfford;
    data['shortfall'] = this.shortfall;
    return data;
  }
}