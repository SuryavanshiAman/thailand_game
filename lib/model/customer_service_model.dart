class CustomerServiceModel {
  String? message;
  int? status;
  List<Data>? data;

  CustomerServiceModel({this.message, this.status, this.data});

  CustomerServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? image;
  String? link;

  Data({this.name, this.image, this.link});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['Image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['Image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}
