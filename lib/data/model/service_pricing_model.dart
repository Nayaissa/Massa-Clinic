class ServicePricingModel {
  int? serviceId;
  String? serviceName;
  double? totalPrice;
  int? totalSessions;
  double? pricePerSession;
  double? userBalance;
  bool? canAfford;

  ServicePricingModel({
    this.serviceId,
    this.serviceName,
    this.totalPrice,
    this.totalSessions,
    this.pricePerSession,
    this.userBalance,
    this.canAfford,
  });

  ServicePricingModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    totalPrice = _parseDouble(json['total_price']);
    totalSessions = json['total_sessions'];
    pricePerSession = _parseDouble(json['price_per_session']);
    userBalance = _parseDouble(json['user_balance']);
    canAfford = json['can_afford'];
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
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['total_price'] = this.totalPrice;
    data['total_sessions'] = this.totalSessions;
    data['price_per_session'] = this.pricePerSession;
    data['user_balance'] = this.userBalance;
    data['can_afford'] = this.canAfford;
    return data;
  }
}
