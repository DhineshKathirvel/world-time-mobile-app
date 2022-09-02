import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(location: 'India', flag: 'India.png', path: 'Asia/Kolkata'),
    WorldTime(location: 'Singapore', flag: 'Singapore.png', path: 'Asia/Singapore'),
    WorldTime(location: 'London', flag: 'London.png', path: 'Europe/London'),
    WorldTime(location: 'New York', flag: 'USA.png', path: 'America/New_York')
  ];

  void updateTime(worldTimeInstance) async {
      String time = await worldTimeInstance.getTime();
      Navigator.pop(context, {
        'location': worldTimeInstance.location,
        'flag': worldTimeInstance.flag,
        'time': time,
        'isDayTime': worldTimeInstance.isDayTime
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
                child: Card(
                  child: ListTile(
                    onTap: (){
                        updateTime(locations[index]);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                    ),
                  ),
                ),
            );
          }
      ),
    );
  }
}
