
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_final/model/user_model.dart';
import 'package:proyecto_final/model/user_ordenmodel.dart';
import 'package:proyecto_final/model/user_register_map.dart';

class MyServiceFirestore{
  String collection;
  MyServiceFirestore({
    required this.collection
});
 late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);


 addOrdens(UserRegisterMap model) async{
   DocumentReference doc = await _collectionReference.add(model.toJson());
 }

  Future<List<UserOrdenModel>> getOrders() async{
    QuerySnapshot collection = await _collectionReference.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<UserOrdenModel> orders = [];
    for(var item in docs){
      UserOrdenModel orderMoldel = UserOrdenModel.fromJson(item.data() as Map<String, dynamic>);
      orders.add(orderMoldel);
      print(orderMoldel.toJson());
    }
    return orders;
  }

 Future<String> addUser(UserModel userModel)async{
   DocumentReference documentoReference = await _collectionReference.add(userModel.toJson());
   return documentoReference.id;
 }

 Future<bool> exitUser(String email)async{
   QuerySnapshot collection = await _collectionReference.where("email",isEqualTo: email).get();
   if(collection.docs.isNotEmpty){
     return true;
   }
   return false;
 }

}