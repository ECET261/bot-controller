import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text('About'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 8.0,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UDP Packet:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                    "{LDir: F, LAng: 0, LLen: 0, RDir: F, RAng: 0, RLen: 0, But: -}"),
                SizedBox(
                  height: 8.0,
                ),
                Text('LDir: F - Forward, B - Backward'),
                Text('LAng: 0 - 359'),
                Text('LLen: -100 - 100'),
                SizedBox(
                  height: 8.0,
                ),
                Text('RDir: F - Forward, B - Backward'),
                Text('RAng: 0 - 359'),
                Text('RLen: -100 - 100'),
                SizedBox(
                  height: 8.0,
                ),
                Text('But: X or Y')
              ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/bot.jpg'),
                  radius: 60.0,
                ),
                Text(
                  'piBot',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text('Mel Dundas'),
                Text('Feb 10, 2021'),
              ]),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
