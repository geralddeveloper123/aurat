import 'package:aurat/app/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../data/DbHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/UserModel.dart';
import '../routes/app_pages.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _nama = TextEditingController();
  final _katasandi = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String nama = _nama.text;
    String katasandi = _katasandi.text;

    if (_nama.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Masukkan nama",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );
    } else if (_katasandi.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Masukkan kata sandi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );
    } else {
      await dbHelper.getLoginUser(nama, katasandi).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Get.offAllNamed(Routes.HOME);
          });
        } else {
          Fluttertoast.showToast(
          msg: "Akun tidak ditemukan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );
        }
      }).catchError((error) {
        print(error);
        Fluttertoast.showToast(
          msg: "Login gagal",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("nama", user.nama);
    sp.setString("katasandi", user.katasandi);
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCB5041),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/image/logo-login.png",width: 30,height: 30,),
                Text("AURAT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Divider(height: 30,thickness: 2,color: Colors.white,),
            SizedBox(height: 100,),
            Center(
              child: Text("Masuk",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            SizedBox(height: 50,),
            Text("Nama",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(height: 10,),
            TextField(
              controller: _nama,
              autofocus: false,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.white)),
                prefixIcon: Icon(Icons.person,color: Colors.white,),
                hintText: "Masukkan nama",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 15,),
            Text("Kata Sandi",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(height: 10,),
            TextField(
              controller: _katasandi,
              autofocus: false,
              obscureText: true,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.white)),
                prefixIcon: Icon(Icons.lock,color: Colors.white,),
                hintText: "Masukkan kata sandi",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  login();
                },
                child: Text("Masuk", style: TextStyle(color: Color(0xFFCB5041)),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white,fixedSize: Size.fromHeight(50))
            ),
            SizedBox(height: 30,),
            Center(
                child: RichText(
                  text: TextSpan(
                    text: "Belum punya akun? ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Get.to(Register());
                        },
                        text: "daftar",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      )
                    ]
                  ),
                )),

          ],
        ),
      )
    );
  }
  }