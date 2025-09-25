class PaymentModel {
  int? id;
  double? amount;
  String? status;
  String? screenshotUrl;
  String? adminNote;
  int? userId;
  int? paymentMethodId;
  String? paymentMethodName;
  String? createdAt;
  String? updatedAt;

  PaymentModel({
    this.id,
    this.amount,
    this.status,
    this.screenshotUrl,
    this.adminNote,
    this.userId,
    this.paymentMethodId,
    this.paymentMethodName,
    this.createdAt,
    this.updatedAt,
  });

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // Handle amount as either string or number
    if (json['amount'] is String) {
      amount = double.tryParse(json['amount']) ?? 0.0;
    } else {
      amount = json['amount']?.toDouble() ?? 0.0;
    }
    status = json['status'];
    screenshotUrl = json['screenshot_url'];
    adminNote = json['admin_note'];
    userId = json['user_id'];
    paymentMethodId = json['payment_method_id'];
    
    // Handle nested payment_method object
    if (json['payment_method'] != null) {
      paymentMethodName = json['payment_method']['name_ar'] ?? json['payment_method']['name'];
    } else {
      paymentMethodName = json['payment_method_name'];
    }
    
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['status'] = status;
    data['screenshot_url'] = screenshotUrl;
    data['admin_note'] = adminNote;
    data['user_id'] = userId;
    data['payment_method_id'] = paymentMethodId;
    data['payment_method_name'] = paymentMethodName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  String get statusText {
    switch (status) {
      case 'APPROVED':
        return 'مقبول';
      case 'REJECTED':
        return 'مرفوض';
      case 'PENDING':
        return 'قيد المراجعة';
      default:
        return 'غير معروف';
    }
  }

  String get statusColor {
    switch (status) {
      case 'APPROVED':
        return '0xFF4CAF50'; // Green
      case 'REJECTED':
        return '0xFFF44336'; // Red
      case 'PENDING':
        return '0xFFFF9800'; // Orange
      default:
        return '0xFF9E9E9E'; // Grey
    }
  }
}
