import 'package:chatboot/Core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final DatabaseService _db;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // SignupViewModel(this._db);

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<String?> signUp(String email, String password) async {
    setLoading(true);
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null; // null means no error
    } on FirebaseAuthException catch (e) {
      return e.code; // Pass error code to the view
    } catch (e) {
      return "unexpected-error";
    } finally {
      setLoading(false);
    }
  }
}
