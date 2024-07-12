import 'package:flutter/material.dart';
import 'package:world_clock/constants.dart';
import 'package:world_clock/locations.dart';
import 'package:world_clock/world_time.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<container> times = [
   
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Container(
          height: 80,
            color: Colors.blue,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(10),
            child: InkWell(
                onTap: () async{
                  var happen = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LocationScreen();
                  }));
                  if(happen == null){
                    return;
                  }
                  container widget =  container( //here the program is
                    timeZoneName: happen["timeZoneName"],
                    country:happen["name"],
                   
                  );

                  for(container i in times){
                    if(i.timeZoneName == widget.timeZoneName){
                      return;
                    }
                  }
                  
                  
                  setState(() {
                    times.add(widget);
                  });
                },
                child: Center(
                    child: Text('+ Add Place',
                        style: kstyle2.copyWith(fontSize:20))))),
        body: ListView(
          //changed column to listview
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Image.asset('images/world map.png'),
            SizedBox(height: 50,),
           
            ...times,
          ],
        ));
  }
}
