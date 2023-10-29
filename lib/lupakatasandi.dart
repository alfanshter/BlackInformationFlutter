import 'package:flutter/material.dart';
import 'package:plnfix/admin/loginadmin.dart';
import 'package:plnfix/user/loginuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() {
  runApp(LupaKataSandi());
}

class LupaKataSandi extends StatelessWidget {
  static const nameRoute = '/lupakatasandi';
  final edtemail = TextEditingController();
// Saat tombol "Lupa Password" ditekan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lupa Password"),
          centerTitle: true,
          backgroundColor: Color(0xFF2A4F63),
        ),
        body: Container(
          color: Color(0xFF5AADA2),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 27.0),
              Image.asset(
                "images/bglampu.png", // Ubah nama gambar sesuai dengan asset Anda
              ),
              Text(
                'Lupa kata sandi',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'poppinsbold',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0), // Set the left margin here
                child: Text(
                  'Silahkan masukkan email anda di bawah ini !',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0), // Set the left margin here
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
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: 123,
                height: 48,
                child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF43AA6C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      String email = edtemail.text;
                      if (edtemail.text.isEmpty) {
                        Get.snackbar('Auth', 'Email gk boleh kosong');
                      } else {
                        try {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email);
                          Get.snackbar(
                              'Auth', 'Silahkan cek email untuk konfirmasi ');
                        } catch (e) {
                          Get.snackbar('Auth', 'Email tidak terdaftar');
                        }
                      }
                    },
                    child: Text(
                      "Kirim",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "poppins-regular",
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ));
  }
}
