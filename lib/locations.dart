import 'package:flutter/material.dart';
import 'package:world_clock/data.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  List<Widget> buildTile(){//data typewidget
    List<Widget> widgets = [];
    for(Map timeZone in timeZones){//list of data are return in map
      
      Widget tile = ListTile(
        title: Text(timeZone['name']),  ///to show datat in list
        subtitle: Text(timeZone['timeZoneName']),
        onTap: (){
          Navigator.pop(context, timeZone);
        },
      );

      widgets.add(tile);
    }
    return widgets;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const  Text("Select Location"),),
      body: ListView(
        children:  buildTile(

        ),
      ),
    );
  }
}