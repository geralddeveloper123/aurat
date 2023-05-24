import 'package:aurat/app/modules/home/views/home_view.dart';
import 'package:aurat/app/widgets/reservasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/DbHelper.dart';
import '../model/Pesanan.dart';


class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  dynamic argumentsData = Get.arguments;
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  Pesan() async {
    String ruang = argumentsData[1]['ruang'].toString();
    String nama_pemesan = "Alex";
    String pemesan = argumentsData[3]['pemesan'].toString();
    String jumlah = "1";
    String kapasitas = argumentsData[2]['kapasitas'].toString();
    String status = "Telah Dipesan";
    Pesanan pModel = Pesanan(ruang, nama_pemesan,pemesan,jumlah,kapasitas,status);
      await dbHelper.saveDataPesan(pModel).then((pesanData) {
        Fluttertoast.showToast(
          msg: "Pesanan berhasil",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );

        Get.off(HomeView());
      }).catchError((error) {
        print(error);
        Fluttertoast.showToast(
          msg: "Pesanan Gagal",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFFCB5041),
          fontSize: 16.0
      );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 218, 100),
        leading: BackButton(
          onPressed: (){
            Get.off(Reservasi(),arguments: [
                    {"tanggal": argumentsData[0]['tanggal'].toString().split(" ")[0]},
                    {"ruang": argumentsData[2]['kapasitas'].toString()},
                    {"kapasitas": argumentsData[2]['kapasitas'].toString()},
                    {"pemesan": argumentsData[3]['pemesan'].toString()},
                    {"sesi": argumentsData[4]['sesi'].toString()}
                  ]);
          },
          color: Colors.black,
        ),
        title: Text("${argumentsData[0]['tanggal'].toString()} , ${argumentsData[4]['sesi'].toString()}" , style: TextStyle(color: Colors.black),),
        actions: [
          Image.asset("assets/image/logo-user.png",width: 50,height: 50,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Text("Ruang Rapat",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
          ),
          SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tipe Ruangan",style: TextStyle(color: Colors.black),),
                Text(argumentsData[1]['ruang'].toString(),style: TextStyle(color: Colors.black),),
              ],
            ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nama Pemesan",style: TextStyle(color: Colors.black),),
                Text("Alex",style: TextStyle(color: Colors.black),),
              ],
            ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pemesan",style: TextStyle(color: Colors.black),),
                Text(argumentsData[3]['pemesan'].toString(),style: TextStyle(color: Colors.black),),
              ],
            ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Jumlah",style: TextStyle(color: Colors.black),),
                Text("1",style: TextStyle(color: Colors.black),),
              ],
            ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kapasitas",style: TextStyle(color: Colors.black),),
                Text(argumentsData[2]['kapasitas'].toString(),style: TextStyle(color: Colors.black),),
              ],
            ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status",style: TextStyle(color: Colors.black),),
                Text("Belum Dipesan",style: TextStyle(color: Colors.black),),
              ],
            ),
          SizedBox(height: 50,),
          ElevatedButton(
                onPressed: (){
                  Pesan();
                },
                child: Text("Pesan", style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFB0E19F),fixedSize: Size.fromHeight(50))
            ),
          SizedBox(height: 10,),
          ElevatedButton(
                onPressed: (){},
                child: Text("Tambah Ruangan", style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFBBC05),fixedSize: Size.fromHeight(50))
            ),
          SizedBox(height: 10,),
          ElevatedButton(
                onPressed: (){
                  Get.off(Reservasi(),arguments: [
                    {"tanggal": argumentsData[0]['tanggal'].toString().split(" ")[0]},
                    {"ruang": argumentsData[2]['kapasitas'].toString()},
                    {"kapasitas": argumentsData[2]['kapasitas'].toString()},
                    {"pemesan": argumentsData[3]['pemesan'].toString()},
                    {"sesi": argumentsData[4]['sesi'].toString()}
                  ]);
                },
                child: Text("Batalkan", style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE19F9F),fixedSize: Size.fromHeight(50))
            ),
        ],
       ),
      )
    );
  }

}