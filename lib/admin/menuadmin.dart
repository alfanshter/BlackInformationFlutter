import 'package:flutter/material.dart';
import 'package:plnfix/admin/informasiadmin.dart';
import 'package:plnfix/admin/pelaporanadmin.dart';

void main() {
  runApp(MenuAdmin());
}

class MenuAdmin extends StatelessWidget {
  static const nameRoute = '/menuadmin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF2A4F63),
        title: Text('Menu Admin'),
      ),
      body: Container(
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
                    Navigator.of(context).pushNamed(InformasiAdmin.nameRoute);
                  },
                  icon: Image.asset("images/imglistrik.png")),
            ),
            Text(
              'PENGINFORMASIAN PEMADAMAN',
              style: TextStyle(
                  fontFamily: "poppinsbold", fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              width: 125,
              height: 100,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PelaporanAdmin.nameRoute);
                  },
                  icon: Image.asset("images/imglistrik.png")),
            ),
            Text(
              'PELAPORAN AMPEREMETER ',
              style: TextStyle(
                  fontFamily: "poppinsbold", fontSize: 20, color: Colors.white),
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
                  fontFamily: "poppinsbold", fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
