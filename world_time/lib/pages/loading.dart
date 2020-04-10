import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/pages/world_time.dart';
class Loadingscreen extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loadingscreen> {
 void settime() async{
   Worldtime x=Worldtime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');
  await x.data();
   Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':x.location,
     'flag':x.flag,
     'time':x.time,
     'isDatetime':x.isDatetime,
    });
   
 }
  @override
  void initState() {
    super.initState();
    settime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Center(
        child: SpinKitWave(
  color: Colors.white,
  size: 30.0,
)
      ),
    );
  }
}