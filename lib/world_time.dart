import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_clock/brain.dart';

import 'constants.dart';

class container extends StatefulWidget {
  final String timeZoneName;
  final String country;


  container({  required this.timeZoneName, required this.country
  });

  @override
  State<container> createState() => _containerState();
}

class _containerState extends State<container> {
  Brain brain = Brain();
  String time = "-:- --";




  @override
  void initState() {
    getData();
    super.initState();
  }


  getData()async{
    final response = await brain.getData(widget.timeZoneName);
    //  print(response);
    var localDateTime = response["currentLocalTime"];

    DateTime dataTime = DateTime.parse(localDateTime);
    String formattedDate = DateFormat("hh:mm aa").format(dataTime);
    time = formattedDate;
    setState(() {});
    if(response == null) return;


  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 26, 26, 26),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsetsDirectional.all(10),
        margin: const EdgeInsetsDirectional.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(width: 15),
            Flexible(
              child: Column(
              
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.timeZoneName,
                    style: kstyle1,
                  ),
                  Text(widget.country, style: kstyle2),
                ],
              ),
            ),
            Spacer(),
            Text("$time", style: kstyle1),
            // Text("$period", style: kstyle2),
          ],
        ));
  }
}
