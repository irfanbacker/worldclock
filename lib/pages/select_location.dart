import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {

  List<WorldTime> wtimes = [
    WorldTime('Asia/Kolkata', 'Kolkata','IN'),
    WorldTime('Europe/London', 'London', 'GB'),
    WorldTime('Europe/Berlin', 'Athens', 'GR'),
    WorldTime('Africa/Cairo', 'Cairo', 'EG'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'KE'),
    WorldTime('America/Chicago', 'Chicago', 'US'),
    WorldTime('America/New_York', 'New York', 'US'),
    WorldTime('Asia/Seoul', 'Seoul', 'KR'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'ID'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text('Select Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: wtimes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network('https://www.countryflags.io/${wtimes[index].flag}/flat/64.png'),
              title: Text(wtimes[index].location),
              onTap: () async {
                await wtimes[index].getTime();
                Navigator.pop(context, {'location': wtimes[index].location, 'flag': wtimes[index].flag, 'time': wtimes[index].time, 'isDay': wtimes[index].isDay,});
              },
            ),
          );
        }
      ),
    );
  }
}