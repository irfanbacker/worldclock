import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setTime() async{
    WorldTime ctime = WorldTime('Asia/Kolkata', 'Kolkata','india.jpg');
    await ctime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {'location': ctime.location, 'flag': ctime.flag, 'time': ctime.time, 'isDay': ctime.isDay});
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: SpinKitWave(size: 50.0, color: Colors.grey[900],),
      ),
    );
  }
}

