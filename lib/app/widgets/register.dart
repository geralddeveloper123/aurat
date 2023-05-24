import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../data/DbHelper.dart';
import '../model/UserModel.dart';
import '../routes/app_pages.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nama = TextEditingController();
  final _katasandi = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  Daftar() async {
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
    }
    else if (_katasandi.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Masukkan kata sandi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );
    }else{
      UserModel uModel = UserModel(nama, katasandi);
      await dbHelper.saveData(uModel).then((userData) {
        Fluttertoast.showToast(
          msg: "Daftar akun berhasil",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );

        Get.off(Login());
      }).catchError((error) {
        print(error);
        Fluttertoast.showToast(
          msg: "Daftar akun Gagal",
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
                child: Text("Daftar",style: TextStyle(color: Colors.white,fontSize: 20,),),
              ),
              SizedBox(height: 50,),
              Text("Nama",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(height: 10,),
              TextField(
                controller:  _nama,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.white)),
                  hintText: "Masukkan nama",
                  prefixIcon: Icon(Icons.person,color: Colors.white,),
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
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.white)),
                  hintText: "Masukkan kata sandi",
                  prefixIcon: Icon(Icons.lock,color: Colors.white,),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: (){
                    Daftar();
                  } ,
                  child: Text("Daftar", style: TextStyle(color: Color(0xFFCB5041)),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white,fixedSize: Size.fromHeight(50))
              ),
              SizedBox(height: 30,),
              Center(
                  child: RichText(
                    text: TextSpan(
                        text: "Sudah punya akun? ",
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            text: "login",
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