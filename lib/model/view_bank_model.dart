class ViewBankModel {
  int? status;
  Data? data;

  ViewBankModel({this.status, this.data});

  ViewBankModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
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
  String? email;
  int? phoneNo;
  String? bankName;
  String? ifscCode;
  String? accountNum;
  String? status;
  String? createdAt;
  Null? updatedAt;

  Data(
      {this.id,
        this.userid,
        this.name,
        this.email,
        this.phoneNo,
        this.bankName,
        this.ifscCode,
        this.accountNum,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    bankName = json['bank_name'];
    ifscCode = json['ifsc_code'];
    accountNum = json['account_num'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['name'] = name;
    data['email'] = email;
    data['phone_no'] = phoneNo;
    data['bank_name'] = bankName;
    data['ifsc_code'] = ifscCode;
    data['account_num'] = accountNum;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
