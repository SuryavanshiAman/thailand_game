class PayUsdtModel {
  int? status;
  List<Data>? data;

  PayUsdtModel({this.status, this.data});

  PayUsdtModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? qrImage;
  String? usdtWalletAddress;
  int? status;
  String? createAt;
  String? updateAt;

  Data(
      {this.id,
        this.qrImage,
        this.usdtWalletAddress,
        this.status,
        this.createAt,
        this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrImage = json['qr_image'];
    usdtWalletAddress = json['usdt_wallet_address'];
    status = json['status'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qr_image'] = this.qrImage;
    data['usdt_wallet_address'] = this.usdtWalletAddress;
    data['status'] = this.status;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
