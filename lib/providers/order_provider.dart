import 'package:flutter/cupertino.dart';
import 'package:proyecto_final/model/user_ordenmodel.dart';
import 'package:proyecto_final/service/my_service_firestore.dart';

class OrderProvider extends ChangeNotifier{


  List<UserOrdenModel> orders = [];
  bool isLoading = true;
  final MyServiceFirestore _orderService = MyServiceFirestore(collection: "orders");

  Future<void> getOrderData() async{
    isLoading = true;
    notifyListeners();
    orders = await _orderService.getOrders();

    isLoading = false;
    notifyListeners();
  }

}