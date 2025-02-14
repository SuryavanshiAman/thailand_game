class WithdrawHistoryModel {
  int? status;
  List<Data>? data;

  WithdrawHistoryModel({this.status, this.data});

  WithdrawHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  dynamic amount;
  dynamic type;
  dynamic status;
  dynamic usdtAmount;
  dynamic createdAt;
  dynamic reason;
  dynamic orderId;

  Data(
      {
        this.amount,
        this.type,
        this.status,
        this.usdtAmount,
        this.createdAt,
        this.reason,
        this.orderId});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    type = json['type'];
    status = json['status'];
    usdtAmount = json['usdt_amount'];
    createdAt = json['created_at'];
    reason = json['reason'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['type'] = type;
    data['status'] = status;
    data['usdt_amount'] = usdtAmount;
    data['created_at'] = createdAt;
    data['reason'] = reason;
    data['order_id'] = orderId;
    return data;
  }
}
