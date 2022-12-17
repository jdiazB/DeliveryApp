import 'package:flutter/cupertino.dart';
import 'package:proyecto_final/model/user_register_map.dart';
import 'package:proyecto_final/service/my_service_firestore.dart';

class OrderProvider extends ChangeNotifier{


  // List list =[];
  bool isLoading = true;
  List<UserRegisterMap> orders=[];
  final MyServiceFirestore _orderService = MyServiceFirestore(collection: "orders");

  Future<void> getOrderData() async{
    isLoading = true;
    notifyListeners();
    orders = await _orderService.getOrders();
    orders = orders.map((e) => UserRegisterMap.fromJson(e.toJson())).toList();
    isLoading = false;
    notifyListeners();
  }

}