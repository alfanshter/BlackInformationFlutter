import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class PelaporanController extends GetxController {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("/");
  FirebaseAuth auth = FirebaseAuth.instance;
  Future send_laporan(
      {required String alamat,
      required String detail,
      required String lainnya}) async {
    try {
      var uid = auth.currentUser?.uid;
      var send_data = {
        "uid": uid,
        "alamat": alamat,
        "detail": detail,
        "lainnya": lainnya
      };
      await ref.child('laporan/').set(send_data);
      return 1;
    } catch (e) {
      print(e.hashCode);
      return 0;
    }
  }

  Future send_informasi(
      {required String penyebab,
        required String alamat,
        required String jangkawaktu}) async {
    try {
      var uid = auth.currentUser?.uid;
      var send_data = {
        "uid": uid,
        "alamat": alamat,
        "penyebab": penyebab,
        "jangkawaktu": jangkawaktu
      };
      await ref.child('informasi/').set(send_data);
      return 1;
    } catch (e) {
      print(e.hashCode);
      return 0;
    }
  }
}
