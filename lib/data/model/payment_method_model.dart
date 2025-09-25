class PaymentMethodModel {
  int? id;
  String? name;
  String? nameAr;
  String? type;
  String? address;
  String? bankName;
  String? accountName;
  String? accountNumber;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  PaymentMethodModel({
    this.id,
    this.name,
    this.nameAr,
    this.type,
    this.address,
    this.bankName,
    this.accountName,
    this.accountNumber,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    type = json['type'];
    address = json['address'];
    bankName = json['bank_name'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['type'] = type;
    data['address'] = address;
    data['bank_name'] = bankName;
    data['account_name'] = accountName;
    data['account_number'] = accountNumber;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
