

import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;
  Future<void> saveUser(Map<String,dynamic>userData) async{
    try {
      await _fire.collection("users").doc(userData["uid"]).set(userData);

      log("User saved successfuly");
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String,dynamic>?> loadUser(String uid) async {
    try {
      final response = await _fire.collection("users").doc(uid).get();
      if (response.data()!=null){
        log("User fetched successfuly");
        return response.data();
      }

      
    } catch (e) {
      rethrow;
    }
    return null;
  }
}