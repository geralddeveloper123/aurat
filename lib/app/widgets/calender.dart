import 'package:aurat/app/widgets/calender.dart';
import 'package:aurat/app/modules/ruangan/views/ruangan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../modules/home/views/home_view.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7EEEB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: (){
            Get.off(HomeView());
          },
          color: Colors.black,
        ),
        title: const Text('Reservasi' , style: TextStyle(color: Colors.black),),
        actions: [
          Image.asset("assets/image/logo-user.png",width: 30,height: 30,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child :
            Text("Pilih Tanggal",style: TextStyle(color: Color(0xFFCB5041),fontWeight: FontWeight.bold,fontSize: 20))
          ),
          TableCalendar(
            focusedDay: selectedDay,
            headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true), 
            firstDay: DateTime.now(),
            lastDay: DateTime(2050),
            calendarFormat: format,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: false,
              selectedDecoration: BoxDecoration(
                color: Color(0xFFCB5041),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
                  onPressed: (){
                    Get.to(RuanganView(),arguments: focusedDay.toString());
                  } ,
                  child: Text("Konfirmasi tanggal", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFCB5041),fixedSize: Size.fromHeight(50))
              ),
        ],
      ),
      )
    );
  }
}