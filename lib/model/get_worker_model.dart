class GetWorkerModel {
  String? status;
  String? message;
  List<Worker>? worker;

  GetWorkerModel({this.status, this.message, this.worker});

  GetWorkerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['worker'] != null) {
      worker = <Worker>[];
      json['worker'].forEach((v) {
        worker!.add(new Worker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.worker != null) {
      data['worker'] = this.worker!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Worker {
  Location? location;
  String? specialized;
  String? sId;
  String? name;
  int? phone;
  String? email;
  String? password;
  int? iDNumber;
  int? iV;
  String? passwordRestExpires;
  String? passwordRestToken;
  double? ratingAverage;
  int? ratingQuantity;

  Worker(
      {this.location,
        this.specialized,
        this.sId,
        this.name,
        this.phone,
        this.email,
        this.password,
        this.iDNumber,
        this.iV,
        this.passwordRestExpires,
        this.passwordRestToken,
        this.ratingAverage,
        this.ratingQuantity});

  Worker.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    specialized = json['specialized'];
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    iDNumber = json['IDNumber'];
    iV = json['__v'];
    passwordRestExpires = json['passwordRestExpires'];
    passwordRestToken = json['passwordRestToken'];
    ratingAverage = json['ratingAverage'];
    ratingQuantity = json['ratingQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['specialized'] = this.specialized;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['IDNumber'] = this.iDNumber;
    data['__v'] = this.iV;
    data['passwordRestExpires'] = this.passwordRestExpires;
    data['passwordRestToken'] = this.passwordRestToken;
    data['ratingAverage'] = this.ratingAverage;
    data['ratingQuantity'] = this.ratingQuantity;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}