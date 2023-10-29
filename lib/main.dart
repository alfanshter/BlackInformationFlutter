import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plnfix/admin/daftaradmin.dart';
import 'package:plnfix/admin/informasiadmin.dart';
import 'package:plnfix/admin/loginadmin.dart';
import 'package:plnfix/admin/menuadmin.dart';
import 'package:plnfix/admin/pelaporanadmin.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/lupakatasandi.dart';
import 'package:plnfix/splashscreen.dart';
import 'package:plnfix/user/daftaruser.dart';
import 'package:plnfix/user/datakosong.dart';
import 'package:plnfix/user/loginuser.dart';
import 'package:plnfix/user/menuuser.dart';
import 'package:plnfix/user/notify_sukses.dart';
import 'package:plnfix/user/pelaporan.dart';
import 'package:plnfix/user/profiluser.dart';
import 'package:plnfix/user/tampilaninformasi.dart';

import 'pilihuser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.nameRoute,
          routes: {
            SplashScreen.nameRoute: (context) => SplashScreen(),
            PilihUser.nameRoute: (context) => PilihUser(),
            LoginUser.nameRoute: (context) => LoginUser(),
            LoginAdmin.nameRoute: (context) => LoginAdmin(),
            NotifySukses.nameRoute: (context) => NotifySukses(),
            MenuUser.nameRoute: (context) => MenuUser(),
            MenuAdmin.nameRoute: (context) => MenuAdmin(),
            DaftarUser.nameRoute: (context) => DaftarUser(),
            DaftarAdmin.nameRoute: (context) => DaftarAdmin(),
            PelaporanAdmin.nameRoute: (context) => PelaporanAdmin(),
            InformasiAdmin.nameRoute: (context) => InformasiAdmin(),
            '/pelaporan': (context) => Pelaporan(),
            '/profiluser': (context) => ProfilUser(),
            '/tampilaninformasi': (context) => TampilanInformasi(),
            LupaKataSandi.nameRoute: (context) => LupaKataSandi(),
            DataKosong.nameRoute: (context) => DataKosong(),
          },
        );
      },
    );
  }
}
