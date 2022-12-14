class UserModel {
  String? id;
  String phone;
  String fullName;
  String email;
  String direction;
  String? image;

  UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.direction,
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "image": image,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "direction": direction
      };
}
