import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/pilihuser.dart';

void main() {
  runApp(ProfilUser());
}

class ProfilUser extends StatefulWidget {
  @override
  State<ProfilUser> createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  final authC = Get.find<AuthController>();
  final databaseRef = FirebaseDatabase.instance;
  var ref = FirebaseDatabase.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future role() async {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    final DatabaseReference ref = FirebaseDatabase.instance.ref("/");
    User? user = FirebaseAuth.instance.currentUser;

    if (user?.uid != null) {
      var uid = user?.uid;
      final getprofil = await ref.child("users/$uid").get();
      var role = getprofil.child('role').value;
      if (role == 0) {
        //admin
        return 0;
      } else if (role == 1) {
        //user
        return 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var uid = auth.currentUser?.uid;
    DatabaseReference _dbref =
        FirebaseDatabase.instance.reference().child("users/$uid");

    Get.find<AuthController>().profil().then((value) {});
    // final getprofil = await ref.child("users/$uid").get();
    // nama = getprofil.child('nama').value.toString();
    // var email = getprofil.child('email').value;
    // var password = getprofil.child('password').value;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2A4F63),
          title: Text("Profil"),
        ),
        body: StreamBuilder(
          stream: _dbref.onValue,
          builder: (context, snapshot) {
            var nama = snapshot.data?.snapshot.child('nama').value;
            var password = snapshot.data?.snapshot.child('password').value;
            var email = snapshot.data?.snapshot.child('email').value;

            return Container(
              alignment: Alignment.center,
              color: Color(0xFF5EABA7),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/profil_rounded.png"),
                        ],
                      )),
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      'Nama',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'poppins-regular'),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: 327,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Center(
                            child: Text(
                              maxLines: 3,
                              nama.toString(),
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'poppins-regular'),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Center(
                                child: Text(
                                  maxLines: 3,
                                  email.toString(),
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 85,
                    height: 66,
                    child: IconButton(
                        onPressed: () {
                          authC.logout().then((value) {
                            print(value);
                            if (value == 1) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  PilihUser.nameRoute, (route) => false);
                            } else {
                              Get.snackbar('Auth', 'Silahkan coba lagi');
                            }
                          });
                        },
                        icon: Image.asset("images/btnkeluar.png")),
                  ),
                  Text(
                    "KELUAR ",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'poppinsbold',
                        color: Colors.white),
                  )
                ],
              ),
            );
          },
        ));
  }

  _getdata() async {
    Object data;
    Get.find<AuthController>().profil().then((value) {
      data = value;
    });
  }
}
