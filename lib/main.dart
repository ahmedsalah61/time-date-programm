import 'dart:async';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dateapp(),
    );
  }
}
class Dateapp extends StatefulWidget {
  const Dateapp({super.key});

  @override
  State<Dateapp> createState() => _date_timeState();
}

class _date_timeState extends State<Dateapp> {
    int hour = 0;
    String year = "";
    String day ="";
    String month ="";
    String weekday = "";
    String minute = "";
    String sec = "";
    String state = "am";

  void changeYear(){
    Timer.periodic( const Duration(seconds: 1), (timer) {
      setState(() {
        year = DateTime.now().year.toString();
        day = DateTime.now().day.toString();
        month = DateTime.now().month.toString();
        switch(month){
          case "1" :month = 'January';
          break;
          case "2" :month = 'Feb';
          break;
          case "3" :month = 'March';
          break;
          case "4" :month = 'Abril';
          break;
          case "5" :month = 'may';
          break;
          case "6" :month = ' June';
          break;
          case "7" :month = 'Jul';
          break;
          case "8" :month = 'Aug';
          break;
          case "9" :month = 'Sep';
          break;
          case "10" :month = 'oct';
          break;
          case "11" :month = 'Nov';
          break;
          case "12" :month = 'Dec';
          break;
        }
        weekday = DateTime.now().weekday.toString();
        switch(weekday){
          case "1" :
            weekday = "Monday";
            break;
          case "2" :
            weekday = " Tuesday";
            break;
          case "3" :
            weekday = "Wednesday";
            break;
          case "4" :
            weekday = "Thursday";
            break;
          case "5" :
            weekday = "Friday";
            break;
          case "6" :
            weekday = "Saturday";
            break;
          case "7" :
            weekday = "Sunday";
            break;
        }
        hour = DateTime.now().hour;
        if (hour > 12){
          hour = hour - 12;
          state = "pm";
        }
        minute = DateTime.now().minute.toString();
        sec = DateTime.now().second.toString();

      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeYear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("date & time today"),
        backgroundColor: Colors.blue[900]
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
           Text("date today is $weekday :",style:const TextStyle(fontSize: 27,
               color: Colors.white),),
           const SizedBox(height: 10,),
            Text("$month $day, $year",style: const TextStyle(fontSize: 27,
                color: Colors.white),),
            const SizedBox(height: 10,),
             Text("${hour.toString().padLeft(2 , "0")}"
                 " :${minute.padLeft(2 , "0")}"
                 " :${sec.padLeft(2 , "0")} $state",
                 style: const TextStyle(fontSize: 27,
                 color: Colors.white),),
        ],),
      ),
    );
  }
}