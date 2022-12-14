class UserRegisterMap{
  String? id;
  String pickup;
  String delivery;
  String category;
  String data;
  double price;
  String status;


  UserRegisterMap({
    this.id,
    required this.pickup,
    required this.delivery,
    required this.category,
    required this.data,
    required this.price,
    required this.status

});

  factory UserRegisterMap.fromJson(Map<String, dynamic> json)=> UserRegisterMap(
    id:json["id"] ?? "",
    pickup: json["pickup"],
    delivery: json["delivery"],
    category: json["category"],
    data: json["data"],
    price: json["price"].toDouble(),
    status: json["status"],);

  Map<String, dynamic> toJson()=>{
    "pickup": pickup,
    "delivery": delivery,
    "category": category,
    "data":data,
    "price":price,
    "status":status,
  };
}

