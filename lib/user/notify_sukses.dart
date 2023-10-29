import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plnfix/user/menuuser.dart';

void main() {
  runApp(NotifySukses());
}

class NotifySukses extends StatelessWidget {
  static const nameRoute = '/notify_sukses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Halaman Pengguna"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Color(0xFF5EABA7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 343,
                height: 500,
                child: IconButton(
                  icon: Image.asset('images/bglampu.png'),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      SystemNavigator.pop();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
