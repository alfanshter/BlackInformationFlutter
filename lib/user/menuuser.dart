import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

void main() {
  runApp(MenuUser());
}

class MenuUser extends StatelessWidget {
  static const nameRoute = '/menuuser';
  @override
  Widget build(BuildContext context) {
    DatabaseReference _dbref =
        FirebaseDatabase.instance.reference().child("informasi");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF2A4F63),
          title: Text('Menu'),
        ),
        body: StreamBuilder(
            stream: _dbref.onValue,
            builder: (context, snapshot) {
              var informasi = snapshot.data?.snapshot.child('alamat').value;
              return Container(
                alignment: Alignment.center,
                color: Color(0xFF5EABA7),
                child: Column(
                  children: [
                    SizedBox(
                      height: 39,
                    ),
                    Image.asset("images/gambarlistrik.png"),
                    Text(
                      'Blackout Information',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "poppins-regular",
                          color: Color(0xFF707070)),
                    ),
                    SizedBox(
                      width: 125,
                      height: 100,
                      child: IconButton(
                          onPressed: () {
                            if (informasi == null) {
                              Navigator.of(context).pushNamed('/datakosong');
                              print('tidak ada');
                            } else {
                              Navigator.of(context)
                                  .pushNamed('/tampilaninformasi');
                              print('ada');
                            }
                          },
                          icon: Image.asset("images/imglistrik.png")),
                    ),
                    Text(
                      'PENGINFORMASIAN PEMADAMAN',
                      style: TextStyle(
                          fontFamily: "poppinsbold",
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 125,
                      height: 100,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/pelaporan');
                          },
                          icon: Image.asset("images/imglistrik.png")),
                    ),
                    Text(
                      'PELAPORAN AMPEREMETER ',
                      style: TextStyle(
                          fontFamily: "poppinsbold",
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 125,
                      height: 100,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/profiluser');
                          },
                          icon: Image.asset("images/imgprofil.png")),
                    ),
                    Text(
                      'AKUN ',
                      style: TextStyle(
                          fontFamily: "poppinsbold",
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              );
            }));
  }
}
