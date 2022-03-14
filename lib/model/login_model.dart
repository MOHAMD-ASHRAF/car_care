class LoginModel{
  late String status;
  String? token;
  UserData? user;
  String? message;
  LoginModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    token = json['token'];
    message =json['message'];
    user = user == null ? null : UserData.fromJson(json['user']);
  }
}
class UserData{
   String? id;
   String? name;
   String? email;

  UserData.fromJson(Map<String,dynamic> json){
    id = json['_id'];
    name = json['name'];
    email = json['email'];
  }
}
