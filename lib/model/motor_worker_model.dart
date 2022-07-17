class MotorWorkerModel {
  String? status;
  int? length;
  List<Worker>? worker;
  MotorWorkerModel({this.status, this.length, this.worker});
  MotorWorkerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    length = json['length'];
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
    data['length'] = this.length;
    if (this.worker != null) {
      data['worker'] = this.worker!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Worker {
  String? url;
  String? name;
  int? phone;

  Worker({this.url, this.name, this.phone});

  Worker.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}