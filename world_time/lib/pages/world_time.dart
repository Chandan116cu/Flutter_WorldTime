import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime{
  String location,time,flag,url;
  bool isDatetime;
  Worldtime({this.location,this.flag,this.url});
   Future<void> data()
 async {
   try
   {
     Response response=await get('http://worldtimeapi.org/api/timezone/$url');
     Map data=jsonDecode(response.body);
     String datetime=data['datetime'];
     String addhours=data['utc_offset'].substring(1,3);
      String addminutes=data['utc_offset'].substring(4,6);
     DateTime date=DateTime.parse(datetime);
    DateTime currenttime= date.add(Duration(hours:int.parse(addhours),minutes:int.parse(addminutes)));
    isDatetime=currenttime.hour>6 && currenttime.hour<18?true:false;
    time=DateFormat.jm().format(currenttime);
   }
   catch(e)
   {
      time="Please enter valid location";
   }
  }

}