class TransactionHistoryModel {
  int? status;
  List<Transaction>? data;

  TransactionHistoryModel({this.status, this.data});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Transaction>[];
      json['data'].forEach((v) {
        data!.add(Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transaction {
  dynamic amount;
  dynamic description;
  dynamic createdAt;

  Transaction({this.amount, this.description, this.createdAt});

  Transaction.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['description'] = description;
    data['created_at'] = createdAt;
    return data;
  }
}
