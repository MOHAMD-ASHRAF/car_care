
class WorkerLoginModel{
  late String status;
  String? token;
  WorkerData? worker;
  String? message;
  WorkerLoginModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    token = json['token'];
    message =json['message'];
    worker = worker == null ? null : WorkerData.fromJson(json['Worker']);
  }
}
class WorkerData{
  String? id;
  String? name;
  String? email;

  WorkerData.fromJson(Map<String,dynamic> json){
    id = json['_id'];
    name = json['name'];
    email = json['email'];
  }
}
