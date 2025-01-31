
class GiftHistoryModel {
  int? status;
  List<Data>? data;

  GiftHistoryModel({this.status, this.data});

  GiftHistoryModel.fromJson(Map<String, dynamic> json) {
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
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? amount;
  String? giftCode;
  String? createdAt;

  Data({this.amount, this.giftCode, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    giftCode = json['gift_code'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['gift_code'] = giftCode;
    data['created_at'] = createdAt;
    return data;
  }
}
