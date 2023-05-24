import 'package:aurat/app/widgets/calender.dart';
import 'package:aurat/app/widgets/detail.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../modules/ruangan/views/ruangan_view.dart';

class Reservasi extends StatefulWidget {
  @override
  _ReservasiState createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  Calendar calendar = Calendar();
  dynamic argumentsData = Get.arguments;
  final List<String> sesi = [
    '08.00 - 12.00',
    '12.00 - 18.00',
  ];
  final List<String> pemesan = [
    'STI',
    'DATA',
    'TU',
    'PUSKOM',
  ];
String? selectedValueSesi;
String? selectedValuePemesan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: (){
            Get.off(RuanganView(), arguments: argumentsData[0]['tanggal'].toString().split(" ")[0]);
          },
          color: Colors.black,
        ),
        title: const Text('Reservasi' , style: TextStyle(color: Colors.black),),
        actions: [
          Image.asset("assets/image/logo-user.png",width: 30,height: 30,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 30,), 
            Center(
              child: Text("Atur Pesanan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 30,),
            Text("Tanggal",style: TextStyle(fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),
            TextField(
              autofocus: false,
              readOnly: true,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.black)),
                prefixIcon: Icon(Icons.calendar_month,color: Color(0xFFCB5041),),
                hintStyle: TextStyle(color: Colors.black),
                hintText: argumentsData[0]['tanggal'].toString().split(" ")[0],
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.black)),
              ),
            ),
            SizedBox(height: 30,),
            Text("Ruang",style: TextStyle(fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),
            TextField(
              autofocus: false,
              readOnly: true,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.black)),
                prefixIcon: Icon(Icons.home,color: Color(0xFFCB5041),),
                hintStyle: TextStyle(color: Colors.black),
                hintText: argumentsData[1]['ruang'].toString(),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:0,color: Colors.black)),
              ),
            ),
            SizedBox(height: 15,),
            Text("Sesi",style: TextStyle(fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  'Pilih disini',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: sesi
                        .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                        .toList(),
                value: selectedValueSesi,
                onChanged: (value) {
                  setState(() {
                    selectedValueSesi = value as String;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text("Pemesan",style: TextStyle(fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  'Pilih disini',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: pemesan
                        .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                        .toList(),
                value: selectedValuePemesan,
                onChanged: (value) {
                  setState(() {
                    selectedValuePemesan = value as String;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  Get.to(Detail(), arguments: [
                    {"tanggal": argumentsData[0]['tanggal'].toString().split(" ")[0]},
                    {"ruang": argumentsData[1]['ruang'].toString()},
                    {"kapasitas": argumentsData[2]['kapasitas'].toString()},
                    {"pemesan": selectedValuePemesan},
                    {"sesi": selectedValueSesi},
                  ]);
                },
                child: Text("Detail Pesanan", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFCB5041),fixedSize: Size.fromHeight(50))
            ),
          ],
        ),
      )
    );
  }

}