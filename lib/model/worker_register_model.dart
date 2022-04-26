class WorkerRegisterModel {
  String? status;
  String? message;
  String? token;
  Worker? worker;

  WorkerRegisterModel({this.status, this.message, this.token, this.worker});

  WorkerRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    worker =
    json['Worker'] != null ? new Worker.fromJson(json['Worker']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.worker != null) {
      data['Worker'] = this.worker!.toJson();
    }
    return data;
  }
}

class Worker {
  String? sId;
  String? name;
  String? email;

  Worker({this.sId, this.name, this.email});

  Worker.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}