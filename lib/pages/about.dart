import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text('About'),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.symmetric(),
          icon: Icon(
            Icons.arrow_back,
            size: 48.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                  "{LDir: F, LAng: 0, LLen: 0, RDir: F, RAng: 0, RLen: 0, But: -}",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'LDir: F - Forward, B - Backward',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  'LAng: 0 - 359',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  'LLen: -100 - 100',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'RDir: F - Forward, B - Backward',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  'RAng: 0 - 359',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  'RLen: -100 - 100',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'But: X or Y',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                )
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
                Text(
                  'Mel Dundas',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  'Feb 10, 2021',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ]),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
