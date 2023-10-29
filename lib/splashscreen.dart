import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/menuadmin.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/pilihuser.dart';
import 'package:plnfix/user/menuuser.dart';

class SplashScreen extends StatefulWidget {
  final authC = Get.put(AuthController(), permanent: true);
  static const nameRoute = '/splashscreen';
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenstart();
  }

  splashscreenstart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      role();
    });
  }

  void role() async {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    final DatabaseReference ref = FirebaseDatabase.instance.ref("/");
    User? user = FirebaseAuth.instance.currentUser;
    print('syifa $user');
    if (user?.uid != null) {
      var uid = user?.uid;
      final getprofil = await ref.child("users/$uid").get();
      var role = getprofil.child('role').value;
      if (role == 0) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(MenuAdmin.nameRoute, (route) => false);
      } else if (role == 1) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(MenuUser.nameRoute, (route) => false);
      }
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(PilihUser.nameRoute, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bgsplash.png"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/logopln.png"),
          SizedBox(
            height: 16,
          ),
          Text(
            "Blackout Infromation",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'poppinsbold'),
          )
        ],
      ),
    ));
  }
}
