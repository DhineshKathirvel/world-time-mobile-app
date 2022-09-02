import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setTime() async {
    WorldTime worldTimeInstance = WorldTime(location: 'Singapore', flag: 'Singapore.png', path: 'Asia/Singapore');
    String time = await worldTimeInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTimeInstance.location,
      'flag': worldTimeInstance.flag,
      'time': time,
      'isDayTime': worldTimeInstance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
