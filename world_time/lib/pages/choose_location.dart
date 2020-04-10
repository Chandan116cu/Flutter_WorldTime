import 'package:flutter/material.dart';
import 'package:world_time/pages/world_time.dart';
class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<Worldtime>locations=[
    Worldtime(url:'Africa/Ceuta',location:'Ceuta',flag:'Ceuta.jpg'),
     Worldtime(url:'Africa/Juba',location:'Juba',flag:'Juba.png'),
      Worldtime(url:'America/Araguaina',location:'Araguaina',flag:'Araguaina.jpg'),
       Worldtime(url:'America/Chicago',location:'Chicago',flag:'Chicago.png'),
        Worldtime(url:'Asia/Kolkata',location:'Kolkata',flag:'Kolkata.jpg'),
         Worldtime(url:'Asia/Singapore',location:'Singapore',flag:'Singapore.jpg'),
          Worldtime(url:'Asia/Tokyo',location:'Tokyo',flag:'Tokyo.png'),
           Worldtime(url:'Europe/Moscow',location:'Moscow',flag:'Moscow.png'),
            Worldtime(url:'Europe/Rome',location:'Rome',flag:'Rome.jpg'),
             Worldtime(url:'Europe/London',location:'London',flag:'London.png'),
              Worldtime(url:'Europe/Madrid',location:'Madrid',flag:'Madrid.png'),
               Worldtime(url:'Europe/Berlin',location:'Berlin',flag:'Berlin.png'),
               Worldtime(url:'Australia/Sydney',location:'Sydney',flag:'Sydney.jpg'),
                Worldtime(url:'Asia/Thimphu',location:'Thimphu',flag:'Thimphu.jpg'),
                 Worldtime(url:'Asia/Karachi',location:'Karachi',flag:'Karachi.png'),
                  Worldtime(url:'Asia/Dubai',location:'Dubai',flag:'Dubai.jpg'),
  ];
  void updatetime(index) async{
    Worldtime x=locations[index];
    await x.data();
    Navigator.pop(context,{
      'location':x.location,
     'flag':x.flag,
     'time':x.time,
     'isDatetime':x.isDatetime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:Text("Choose a Location"),
        backgroundColor:Colors.blue[900],
        centerTitle:true,
        elevation:0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context,index){
          return Card(
            child:ListTile(
              onTap: (){
                updatetime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage:AssetImage('assets/${locations[index].flag}'),
              ),
            )
          );
        },
      ),
    );
  }
}