import 'package:aurat/app/widgets/calender.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7EEEB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/image/logo-home.png",width: 30,height: 30,),
        title: const Text('AURAT' , style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Image.asset("assets/image/logo-user.png",width: 30,height: 30,)
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 50,
            alignment: Alignment.center,
            child: Text("Reservasi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(Calendar());
        },
        backgroundColor: Color(0xFFCB5041),
        child: Icon(Icons.add),

      ),
    );
  }
}
