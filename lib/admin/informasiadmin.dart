import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/app/controllers/pelaporan_controller.dart';
import 'package:plnfix/user/notify_sukses.dart';

void main() {
  runApp(InformasiAdmin());
}

class InformasiAdmin extends StatelessWidget {
  final edtpenyebab = TextEditingController();
  final edtalamat = TextEditingController();
  final edtjangkawaktu = TextEditingController();
  static const nameRoute = '/informasiadmin';
  final pelaporanC = Get.put(PelaporanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tampilan Informasi'),
        backgroundColor: Color(0xFF2A4F63),
      ),
      body: Container(
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
                          child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            controller: edtpenyebab,
                            maxLines: 3,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'ALAMAT PEMADAMAN ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'poppins-regular'),
                  ),
                ),
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
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        controller: edtalamat,
                        maxLines: 3,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        controller: edtjangkawaktu,
                        maxLines: 3,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
                  width: 123,
                  height: 48,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff0099F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        if (edtalamat.text.isNotEmpty &&
                            edtpenyebab.text.isNotEmpty &&
                            edtjangkawaktu.text.isNotEmpty) {
                          pelaporanC
                              .send_informasi(
                                  penyebab: edtpenyebab.text,
                                  alamat: edtalamat.text,
                                  jangkawaktu: edtjangkawaktu.text)
                              .then((value) {
                            if (value == 1) {
                              Navigator.of(context)
                                  .pushNamed(NotifySukses.nameRoute);
                            } else {
                              Get.snackbar('Lapor', 'Silahkan coba lagi');
                            }
                          });
                        } else {
                          Get.snackbar('Lapor', 'Jangan kosongi kolom',
                              colorText: Colors.white);
                        }
                      },
                      child: Text(
                        "Selesai",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "poppins-regular",
                            color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
