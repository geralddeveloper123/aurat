import 'package:aurat/app/widgets/calender.dart';
import 'package:aurat/app/widgets/ruangan_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ruangan_controller.dart';

List<List<String>> image = [
  ["assets/image/vicon-1.jpeg","assets/image/vicon-2.jpeg","assets/image/vicon-3.jpeg","assets/image/vicon-4.jpeg"],
  ["assets/image/pantry-1.jpeg","assets/image/pantry-2.jpeg","assets/image/pantry-3.jpeg","assets/image/pantry-4.jpeg"],
  ["assets/image/rk1-1.jpeg","assets/image/rk1-2.jpeg","assets/image/rk1-3.jpeg","assets/image/rk1-4.jpeg"],
  ["assets/image/rk2-1.jpeg","assets/image/rk2-2.jpeg","assets/image/rk2-3.jpeg","assets/image/rk2-4.jpeg"],
  ["assets/image/rk3-1.jpeg","assets/image/rk3-2.jpeg","assets/image/rk3-3.jpeg","assets/image/rk3-4.jpeg"] ];
List<String> nama = ["VICON","Pantry","Ruang Kaca 1","Ruang Kaca 2","Ruang Kaca 3"];
List<String> kapasitas = ["27","20","11","9","10"];
class RuanganView extends GetView<RuanganController> {
  const RuanganView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: (){
            Get.off(Calendar());
          },
          color: Colors.black,
        ),
        title: const Text('Reservasi' , style: TextStyle(color: Colors.black),),
        actions: [
          Image.asset("assets/image/logo-user.png",width: 30,height: 30,)
        ],
      ),
      body:    
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: image.length,
          itemBuilder: (context, index) => RuanganCard(title: nama[index], image: image[index], kapasitas: kapasitas[index])
        ),
        )
    );
  }
}
