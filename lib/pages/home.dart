import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => _continuosTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: data['isDay'] ? Colors.blue[200] : Colors.indigo[800],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,50.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 142.0,
                      child: FlatButton.icon(
                        icon: Icon(Icons.edit_location, color: data['isDay'] ? Colors.black : Colors.white,),
                        onPressed: () async{
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          if(result!=null) {
                            setState(() {
                              data = {
                                'location': result['location'],
                                'flag': result['flag'],
                                'time': result['time'],
                                'isDay': result['isDay']
                              };
                            });
                          }
                        },
                        label: Text('Edit Location', style: TextStyle(color: data['isDay'] ? Colors.black : Colors.white),),
                      ),
                    ),
                    SizedBox(height: 150.0,),
                    Text(data['location'], style: TextStyle(fontSize: 30.0, letterSpacing: 1.0, color: data['isDay'] ? Colors.black : Colors.white),),
                    SizedBox(height: 70.0,),
                    Text(DateFormat.jm().format(data['time']), style: TextStyle(fontSize: 50.0, color: data['isDay'] ? Colors.black : Colors.white),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _continuosTime(){
    DateTime ctime = data['time'];
    setState(() {
      data['time'] = data['time'].add(Duration(seconds: 1));
    });
  }
}
