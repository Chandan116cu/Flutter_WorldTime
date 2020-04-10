import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage=data['isDatetime']?'day.jpg':'night.jpg';
    Color bgcolor=data['isDatetime']?Colors.lightBlue:Colors.black12;
    return Scaffold(
      backgroundColor:bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage('assets/$bgImage'),
             fit: BoxFit.cover,
            )
          ),
                  child: Padding(
            padding: const EdgeInsets.fromLTRB(0,150,0,0),
            child: Column(
              children:<Widget>[
                FlatButton.icon(onPressed:() async {
                 dynamic result=await Navigator.pushNamed(context,'/location');
                 setState(() {
                   data={
                     'time':result['time'],
                     'location':result['location'],
                     'isDatetime':result['isDatetime'],
                     'flag':result['flag']
                   };
                 });
                },
                 icon:Icon(Icons.edit_location,
                   color: Colors.white,
                 ), 
                 label: Text("Edit Location",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 ),
                 )),
                 SizedBox(height: 40),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                   Text(
                     data['location'],
                     style: TextStyle(
                       fontSize:40,
                        color: Colors.white,
                       letterSpacing:2
                     ),
                   ), 
                 ],
                 ),
                 SizedBox(height:40),
                 Text(
                     data['time'],
                     style: TextStyle(
                       fontSize:69,
                        color: Colors.white,
                     ),
                   ), 
              ]
            ),
          ),
        ),
      )
    );
      
   
  }
}