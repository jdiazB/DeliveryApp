class UserModel {
  String? id;
  int phone;
  String fullName;
  String email;
  String direction;
  String? image;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.direction,
    this.image

  });

  Map<String, dynamic> toJson()=>{
    "id": id ?? "",
    "image":image,
    "fullName": fullName,
    "email": email,
    "phone":phone.toInt(),
    "direction":direction
  };

}