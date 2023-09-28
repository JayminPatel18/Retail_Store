import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:retail_store/model/user_model.dart';

// for store users in "Users" collection 
class FirestoreUser{
  final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel userModel) async{
    return await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }

}