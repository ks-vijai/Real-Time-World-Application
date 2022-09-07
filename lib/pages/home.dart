import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
  data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
  String bgImg = data['isDay'] ? 'day.jpg' : 'night.jpg';
  Color bgClr = data['isDay'] ? Colors.blueAccent : Colors.blue[900];
    return Scaffold(
      backgroundColor: bgClr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,160.0,0.0,0.0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context,'/location');
                      setState(() {
                        data = {
                          'flag': result['flag'],
                          'time': result['time'],
                          'isDay': result['isDay'],
                          'location': result['location'],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[200],
                    ),
                    label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                    ),
                ),
                SizedBox(height:10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
