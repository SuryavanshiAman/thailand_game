class AllGameListModel {
  int? status;
  String? message;
  List<Data>? data;
  List<Fish>? fish;
  List<Slot>? slot;
  List<Tableandcard>? tableandcard;
  List<Crash>? crash;

  AllGameListModel(
      {this.status,
        this.message,
        this.data,
        this.fish,
        this.slot,
        this.tableandcard,
        this.crash});

  AllGameListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['fish'] != null) {
      fish = <Fish>[];
      json['fish'].forEach((v) {
        fish!.add(Fish.fromJson(v));
      });
    }
    if (json['slot'] != null) {
      slot = <Slot>[];
      json['slot'].forEach((v) {
        slot!.add(Slot.fromJson(v));
      });
    }
    if (json['tableandcard'] != null) {
      tableandcard = <Tableandcard>[];
      json['tableandcard'].forEach((v) {
        tableandcard!.add(Tableandcard.fromJson(v));
      });
    }
    if (json['crash'] != null) {
      crash = <Crash>[];
      json['crash'].forEach((v) {
        crash!.add(Crash.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (fish != null) {
      data['fish'] = fish!.map((v) => v.toJson()).toList();
    }
    if (slot != null) {
      data['slot'] = slot!.map((v) => v.toJson()).toList();
    }
    if (tableandcard != null) {
      data['tableandcard'] = tableandcard!.map((v) => v.toJson()).toList();
    }
    if (crash != null) {
      data['crash'] = crash!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? img;
  String? name;
  int? id;

  Data({this.img, this.name, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['img'] = img;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
class Fish {
  String? img;
  String? name;
  int? id;

  Fish({this.img, this.name, this.id});

  Fish.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['img'] = img;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
class Slot {
  String? img;
  String? name;
  int? id;

  Slot({this.img, this.name, this.id});

  Slot.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['img'] = img;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
class Tableandcard {
  String? img;
  String? name;
  int? id;

  Tableandcard({this.img, this.name, this.id});

  Tableandcard.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['img'] = img;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
class Crash {
  String? img;
  String? name;
  int? id;

  Crash({this.img, this.name, this.id});

  Crash.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['img'] = img;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}