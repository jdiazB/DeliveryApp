import 'package:proyecto_final/model/user_register_map.dart';

class UserOrdenModel {
  String? id;
  String phone;
  String fullName;
  String email;
  String direction;
  String image;
  List<UserRegisterMap> user;

  UserOrdenModel(
      {  this.id,
        required this.fullName,
        required this.email,
        required this.phone,
        required this.direction,
        required this.user,
        required this.image});

  factory UserOrdenModel.fromJson(Map<String, dynamic> json) => UserOrdenModel(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    image: json["image"],
    phone: json["phone"],
    direction: json["direction"],
    user: List<UserRegisterMap>.from(json["user"].map((e)=> UserRegisterMap.fromJson(e))) ,
  );

  Map<String, dynamic> toJson() => {
    "id": id ,
    "image": image ,
    "fullName": fullName,
    "email": email,
    "phone": phone,
    "direction": direction,
    "user":List<dynamic>.from(user.map((e) => e.toJson())),
  };
}
