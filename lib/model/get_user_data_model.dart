class GetUserFromId {
  String? status;
  String? message;
  User? user;

  GetUserFromId({this.status, this.message, this.user});

  GetUserFromId.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class User {
  String? sId;
  String? url;
  String? name;
  int? phone;
  String? email;
  String? password;
  int? iV;

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
  }
}