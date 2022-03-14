class SingedUpModel{
  late String status;
    String? name;
   String? email;
   String? password;
    String? confirmPassword;
  String? phone;
  late String message;
 SingedUpModel.fromJson(Map<String,dynamic> json){
   name = json['name'];
   email = json['email'];
   password = json['password'];
   confirmPassword = json['confirmPassword'];
   phone = json['phone'];
   message =json['message'];
   status = json['status'];
 }
}