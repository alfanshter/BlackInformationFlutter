import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TampilanInformasi());
}

class TampilanInformasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseReference _dbref =
        FirebaseDatabase.instance.reference().child("informasi");

    return Scaffold(
        appBar: AppBar(
          title: Text('Tampilan Informasi'),
          backgroundColor: Color(0xFF2A4F63),
        ),
        body: StreamBuilder(
          stream: _dbref.onValue,
          builder: (context, snapshot) {
            var alamat =
                snapshot.data?.snapshot.child('alamat').value.toString();
            var jangkawaktu =
                snapshot.data?.snapshot.child('jangkawaktu').value.toString();
            var penyebab =
                snapshot.data?.snapshot.child('penyebab').value.toString();
            return Container(
              width: double.infinity,
              color: Color(0xFF5EABA7),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset("images/gambarlistrik.png"),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'PENYEBAB PEMADAMAN ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'poppins-regular'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 91,
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
                                penyebab.toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'LOKASI PEMADAMAN ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'poppins-regular'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 91,
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
                                alamat.toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'JANGKA WAKTU PEMADAMAN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'poppins-regular'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 91,
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
                                jangkawaktu.toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
