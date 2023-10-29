import 'package:flutter/material.dart';

void main() {
  runApp(DataKosong());
}

class DataKosong extends StatelessWidget {
  static const nameRoute = '/datakosong';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF2A4F63),
        title: Text('Penginformasian Pemadam'),
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/bgkosong.png'), // Ganti dengan path gambar Anda
                fit:
                    BoxFit.cover, // Sesuaikan dengan preferensi tampilan gambar
              ),
            ),
          ),
          // Teks data kosong dengan background biru dan radius
          Center(
            child: Container(
              width: 176, // Lebar container
              height: 71, // Tinggi container
              decoration: BoxDecoration(
                color: Color(0xFF2A4F63), // Warna latar belakang biru
                borderRadius: BorderRadius.circular(16.0), // Radius sudut
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                'Data Kosong', // Isi teks sesuai kebutuhan Anda
                style: TextStyle(
                  color: Colors.white, // Warna teks
                  fontSize: 20.0, // Ukuran teks
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(
            bottom: 16.0), // Atur margin bawah sesuai kebutuhan Anda
        child: GestureDetector(
          onTap: () {
            // Aksi yang akan diambil saat gambar ditekan
            Navigator.of(context).pushNamed('/pelaporan');
          },
          child: Image.asset(
            'images/btnadd.png', // Ganti dengan path gambar yang ingin Anda gunakan
            width: 60.0, // Lebar gambar
            height: 60.0, // Tinggi gambar
            fit: BoxFit.contain, // Sesuaikan sesuai kebutuhan Anda
          ),
        ),
      ),
    );
  }
}
