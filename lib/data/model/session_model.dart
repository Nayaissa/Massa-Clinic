class SessionModel {
  String? serviceName;
  int? totalSessions;
  int? pricePerSession;
  List<Sessions>? sessions;

  SessionModel(
      {this.serviceName,
      this.totalSessions,
      this.pricePerSession,
      this.sessions});

  SessionModel.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
    totalSessions = json['total_sessions'];
    pricePerSession = json['price_per_session'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_name'] = this.serviceName;
    data['total_sessions'] = this.totalSessions;
    data['price_per_session'] = this.pricePerSession;
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  int? id;
  String? sessionName;
  String? description;
  String? status;
  String? sessionDate;
  int? price;

  Sessions(
      {this.id,
      this.sessionName,
      this.description,
      this.status,
      this.sessionDate,
      this.price});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionName = json['session_name'];
    description = json['description'];
    status = json['status'];
    sessionDate = json['session_date'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['session_name'] = this.sessionName;
    data['description'] = this.description;
    data['status'] = this.status;
    data['session_date'] = this.sessionDate;
    data['price'] = this.price;
    return data;
  }
}