class UsdtViewBankModel {
  int? status;
  Data? data;

  UsdtViewBankModel({this.status, this.data});

  UsdtViewBankModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userid;
  String? name;
  String? usdtAddress;
  String? createAt;
  String? updateAt;

  Data(
      {this.id,
        this.userid,
        this.name,
        this.usdtAddress,
        this.createAt,
        this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    name = json['name'];
    usdtAddress = json['usdt_address'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['usdt_address'] = this.usdtAddress;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
