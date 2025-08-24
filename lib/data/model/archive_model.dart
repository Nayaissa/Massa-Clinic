class ArchiveModdel {
  List<Data>? data;

  ArchiveModdel({this.data});

  ArchiveModdel.fromJson(Map<String, dynamic> json) {
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
  int? serviceId;
  String? serviceName;
  String? serviceImage;
  String? image;
  String? servicePrice;
  int? totalSessions;
  int? completedSessionsCount;
  int? remainingPrice;
  List? lastConfirmedSession;

  Data({
    this.serviceId,
    this.serviceName,
    this.serviceImage,
    this.image,
    this.servicePrice,
    this.totalSessions,
    this.completedSessionsCount,
    this.remainingPrice,
    this.lastConfirmedSession,
  });

  Data.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceImage = json['service_image'];
    image = serviceImage!.replaceAll('127.0.0.1', '10.0.2.2');
    servicePrice = json['service_price'];
    totalSessions = json['total_sessions'];
    completedSessionsCount = json['completed_sessions_count'];
    remainingPrice = json['remaining_price'];
    lastConfirmedSession = json['last_confirmed_session'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['service_image'] = this.serviceImage;
    data['service_price'] = this.servicePrice;
    data['total_sessions'] = this.totalSessions;
    data['completed_sessions_count'] = this.completedSessionsCount;
    data['remaining_price'] = this.remainingPrice;
    data['last_confirmed_session'] = this.lastConfirmedSession;
    return data;
  }
}
