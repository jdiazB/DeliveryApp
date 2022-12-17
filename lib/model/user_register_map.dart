


import 'package:proyecto_final/model/user_model.dart';

class UserRegisterMap{
  String? id;
  String pickup;
  String delivery;
  String typecategory;
  String quantity;
  String category;
  String data;
  double price;
  String status;
  String phone;
  String fullName;
  String email;


  UserRegisterMap({
    this.id,
    required this.pickup,
    required this.delivery,
    required this.category,
    required this.data,
    required this.price,
    required this.status,
    required this.typecategory,
    required this.quantity,
    required this.fullName,
    required this.email,
    required this.phone,


});

  factory UserRegisterMap.fromJson(Map<String, dynamic> json)=> UserRegisterMap(
    id:json["id"] ?? "",
    pickup: json["pickup"],
    delivery: json["delivery"],
    category: json["category"],
    data: json["data"],
    price: json["price"].toDouble(),
    status: json["status"],
    typecategory: json["typecategory"],
    quantity: json["quantity"],
    fullName: json["fullName"],
    email: json["email"],
    phone: json["phone"],

  );

  Map<String, dynamic> toJson()=>{
    "id":id ,
    "fullName": fullName,
    "email": email,
    "phone": phone,
    "pickup": pickup,
    "delivery": delivery,
    "category": category,
    "data":data,
    "price":price,
    "status":status,
    "typecategory":typecategory,
    "quantity":quantity
  };
}

