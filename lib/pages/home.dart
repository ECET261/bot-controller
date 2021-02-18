import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:convert';

import 'settings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InternetAddress address = InternetAddress('10.0.0.133');

  final int port = 5005;

  var jsonPacket = {
    'LDir': 'F',
    'LAng': 0,
    'LLen': 0,
    'RDir': 'F',
    'RAng': 0,
    'RLen': 0,
    'But': '-',
  };

  void goToSettings() async {
    var result = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => Settings(),
          fullscreenDialog: true,
        ));

    address = InternetAddress(result);
  }

  void sendPacket() {
    print(jsonPacket);
    connect(address, port, json.encode(jsonPacket));
  }

  void joystickl(double degrees, double distance) {
    String degS;
    String disS;

    //convert to tank drive
    if (degrees <= 90 || degrees >= 270) {
      //forward
      jsonPacket['LDir'] = 'F';
    } else {
      //backward
      jsonPacket['LDir'] = 'B';
    }

    degS = degrees.toStringAsFixed(0);
    disS = (distance * 100).toStringAsFixed(0);

    jsonPacket['LAng'] = '$degS';
    jsonPacket['LLen'] = '$disS';

    sendPacket();
  }

  void joystickr(double degrees, double distance) {
    String degS;
    String disS;

    //convert to tank drive
    if (degrees <= 90 || degrees >= 270) {
      //forward
      jsonPacket['RDir'] = 'F';
    } else {
      //backward
      jsonPacket['RDir'] = 'B';
    }

    degS = degrees.toStringAsFixed(0);
    disS = (distance * 100).toStringAsFixed(0);

    jsonPacket['RAng'] = '$degS';
    jsonPacket['RLen'] = '$disS';

    sendPacket();
  }

  void connect(InternetAddress clientAddress, int port, String pack) {
    RawDatagramSocket.bind(InternetAddress.anyIPv4, 0)
        .then((RawDatagramSocket socket) {
      //    print('Sending from ${socket.address.address}:${socket.port}');

      socket.send(pack.codeUnits, clientAddress, port);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      appBar: AppBar(
        //leading: Container(), //removes back button
        //overide default back arrow to exit program
        backgroundColor: Colors.red[600],
        leading: BackButton(
          onPressed: () => SystemNavigator.pop(),
        ),

        title: Text('piBot'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (content) => [
              PopupMenuItem(
                value: 1,
                child: Text("Settings"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("About"),
              ),
            ],
            onSelected: (int menu) {
              if (menu == 1) {
                goToSettings();
              } else if (menu == 2) {
                Navigator.pushNamed(context, '/about');
              }
            },
          ),
        ],
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          width: 8.0,
        ),
        JoystickView(
          onDirectionChanged: joystickl,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              elevation: 20.0,
              heroTag: 'X',
              child: Text(
                'X',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                ),
              ),
              onPressed: () {
                jsonPacket['But'] = 'X';
                sendPacket();
                jsonPacket['But'] = '-';
                sendPacket();
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              elevation: 20.0,
              heroTag: 'Y',
              child: Text(
                'Y',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                ),
              ),
              onPressed: () {
                jsonPacket['But'] = 'Y';
                sendPacket();
                jsonPacket['But'] = '-';
                sendPacket();
              },
            ),
          ],
        ),
        JoystickView(
          onDirectionChanged: joystickr,
        ),
        SizedBox(
          width: 8.0,
        ),
      ]),
    );
  }
}
