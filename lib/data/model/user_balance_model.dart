class UserBalanceModel {
  double? balance;

  UserBalanceModel({
    this.balance,
  });

  UserBalanceModel.fromJson(Map<String, dynamic> json) {
    // Handle balance as either string or number
    if (json['balance'] is String) {
      balance = double.tryParse(json['balance']) ?? 0.0;
    } else {
      balance = json['balance']?.toDouble() ?? 0.0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    return data;
  }
}
