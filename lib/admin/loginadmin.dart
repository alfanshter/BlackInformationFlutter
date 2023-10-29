import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/daftaradmin.dart';
import 'package:plnfix/admin/menuadmin.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/lupakatasandi.dart';
import 'package:plnfix/user/daftaruser.dart';
import 'package:plnfix/user/menuuser.dart';

void main() {
  runApp(LoginAdmin());
}

class LoginAdmin extends StatelessWidget {
  final edtemail = TextEditingController();
  final edtpassword = TextEditingController();
  final authC = Get.find<AuthController>();
  static const nameRoute = '/loginadmin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A4F63),
        title: Text("Halaman Masuk Admin"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF5AADA2),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset("images/gambarlistrik.png"),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 27,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: edtemail,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Email....',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 21,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: edtpassword,
                    decoration: InputDecoration(
                      hintText: 'Masukkan password...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 21,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LupaKataSandi.nameRoute);
                    },
                    child: Text(
                      "lupa kata sandi?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "poppins-regular",
                          color: Colors.white),
                    ))),
            Container(
              width: 123,
              height: 48,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF43AA6C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    authC.login(edtemail.text, edtpassword.text).then((value) {
                      if (value == 'user-not-found') {
                        Get.snackbar('Auth', 'Akun belum ada');
                      } else if (value == 'wrong-password') {
                        Get.snackbar('Auth', 'password salah');
                      } else if (value == 'Jangan kosongi email dan password') {
                        Get.snackbar(
                            'Auth', 'Jangan kosongi email dan password');
                      } else if (value == 'invalid-email') {
                        Get.snackbar('Auth', 'email salah');
                      } else if (value == 1) {
                        print('mantab');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            MenuAdmin.nameRoute, (route) => false);
                      }
                    });
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "poppins-regular",
                        color: Colors.white),
                  )),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DaftarAdmin.nameRoute);
                    },
                    child: RichText(
                        text: TextSpan(
                            text: 'Belum punya akun ? ',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "poppins-regular",
                                color: Colors.white),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'Daftar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ])))),
          ],
        ),
      ),
    );
  }
}
