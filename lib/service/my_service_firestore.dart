
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_final/model/user_model.dart';
import 'package:proyecto_final/model/user_register_map.dart';

class MyServiceFirestore{
  String collection;
  MyServiceFirestore({
    required this.collection
});
 late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);


 Future<String> addOrdens(UserRegisterMap model) async{
   DocumentReference documentReference = await _collectionReference.add(model.toJson());
   String id = documentReference.id;
   return id;
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