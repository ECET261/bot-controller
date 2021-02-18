import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static String ipaddress;

  void newAddress(String ndata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip', ndata);

    setState(() {
      ipaddress = (prefs.getString('ip'));
    });
  }

  _getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ipaddress = (prefs.getString('ip'));
    });
  }

  @override
  Widget build(BuildContext context) {
    _getAddress();
    return Scaffold(
      backgroundColor: Colors.red[800],
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text('Settings'),
        centerTitle: true,
        //overide default back arrow to return data
        leading: IconButton(
          padding: EdgeInsets.symmetric(),
          icon: Icon(
            Icons.arrow_back,
            size: 48.0,
          ),
          onPressed: () => Navigator.pop(context, ipaddress),
        ),
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.send),
            border: const OutlineInputBorder(),
            hintText: 'Enter new Bot IP',
          ),
          textAlign: TextAlign.center,
          onChanged: (String data) {
            newAddress(data);
          },
        ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          'Current Bot IP: $ipaddress',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        Text(
          'PORT: 5005',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
