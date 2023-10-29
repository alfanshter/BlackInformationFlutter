import 'package:flutter/material.dart';
import 'package:plnfix/admin/loginadmin.dart';
import 'package:plnfix/user/loginuser.dart';

void main() {
  runApp(PilihUser());
}

class PilihUser extends StatelessWidget {
  static const nameRoute = '/pilihuser';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Halaman Pengguna"),
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
                "images/gambarlistrik.png", // Ubah nama gambar sesuai dengan asset Anda
              ),
              SizedBox(
                height: 98.0,
              ),
              Text(
                'Pilih Pengguna',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'poppinsbold',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginUser.nameRoute);
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            Colors.transparent, // Latar belakang transparan
                        elevation: 0, // Tidak ada efek bayangan
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Bentuk rounded
                          side: BorderSide(
                              color: Colors.white), // Garis berwarna putih
                        ),
                        minimumSize: Size(
                            double.infinity, 48), // Ubah tinggi tombol di sini
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'MASYARAKAT',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 49,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginAdmin.nameRoute);
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            Colors.transparent, // Latar belakang transparan
                        elevation: 0, // Tidak ada efek bayangan
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Bentuk rounded
                          side: BorderSide(
                              color: Colors.white), // Garis berwarna putih
                        ),
                        minimumSize: Size(
                            double.infinity, 48), // Ubah tinggi tombol di sini
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'ADMIN',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
