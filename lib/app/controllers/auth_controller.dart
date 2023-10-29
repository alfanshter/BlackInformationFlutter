import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref("/");

  Future signup(
      {required String email,
      required String password,
      required String nama}) async {
    try {
      final createuser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var uid = createuser.user?.uid;
      var senddata = {
        "nama": nama,
        "uid": uid,
        "email": email,
        "password": password,
        "role": 1
      };
      await ref.child('users/$uid').set(senddata);

      return 1;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      }
    }
  }

  Future signup_admin(
      {required String email,
      required String password,
      required String nama}) async {
    try {
      final createuser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var uid = createuser.user?.uid;
      var senddata = {
        "nama": nama,
        "uid": uid,
        "email": email,
        "password": password,
        "role": 0
      };
      await ref.child('users/$uid').set(senddata);
      return 1;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      }
    }
  }

  Future login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var uid = userCredential.user?.uid;

      return 1;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        return 'wrong-password';
      } else if (e.code == 'invalid-email') {
        return 'invalid-email';
      } else if (e.code == 'unknown') {
        return 'Jangan kosongi email dan password';
      }
    }
  }

  Future logout() async {
    try {
      await auth.signOut();
      print('logout berhasil');
      return 1;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return 0;
    }
  }

  Future profil() async {
    //cek role
    var uid = auth.currentUser?.uid;
    final getprofil = await ref.child("users/$uid").get();
    var role = getprofil.child('role').value;
    if (getprofil.exists) {
      return getprofil.value;
    } else {
      print('tidak ada data');
    }
  }
}
