import 'package:aurat/app/widgets/reservasi.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PesananCard extends StatelessWidget {
  final String title;
  final List<String> image;
  final String thumbnailUrl;
  final String tanggal = Get.arguments;
  PesananCard({
    required this.title,
    required this.image,
    required this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: [image[0],image[1],image[2],image[3]].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(i,fit: BoxFit.fill, height: 100,);
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ruang $title"),
            ElevatedButton(
              onPressed: (){
                Get.to(Reservasi(),arguments: [
                    {"tanggal": tanggal},
                    {"ruang": title}
                ]);
              },
              child: Text("Pilih Ruangan", style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFCB5041),fixedSize: Size.fromHeight(50))
            ),
          ],
        ),
        
      ],
    );
  }
}