class DepositModel {
  int? status;
  List<Data>? data;

  DepositModel({this.status, this.data});

  DepositModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic amount;
  dynamic status;
  dynamic type;
  dynamic reason;
  dynamic usdtAmount;
  dynamic orderNumer;
  dynamic createdAt;

  Data(
      {this.amount,
        this.status,
        this.type,
        this.reason,
        this.usdtAmount,
        this.orderNumer,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    status = json['status'];
    type = json['type'];
    reason = json['reason'];
    usdtAmount = json['usdt_amount'];
    orderNumer = json['order_number'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['type'] = this.type;
    data['reason'] = this.reason;
    data['usdt_amount'] = this.usdtAmount;
    data['order_number'] = this.orderNumer;
    data['created_at'] = this.createdAt;
    return data;
  }
}
