import 'package:flutter/material.dart';
import 'pages/night_mode_page.dart'; // Import Night Mode Page
import 'pages/scan_devices_page.dart'; // Import Scan Devices Page

void main() {
  runApp(PowerFlickApp());
}

class PowerFlickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'PowerFlick',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PowerFlickHomePage(),
    );
  }
}

class PowerFlickHomePage extends StatefulWidget {
  @override
  _PowerFlickHomePageState createState() => _PowerFlickHomePageState();
}

class _PowerFlickHomePageState extends State<PowerFlickHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PowerFlick'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to PowerFlick!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Manage your energy consumption efficiently.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(8),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _createButton('Dashboard', 'View your energy stats'),
                _createButton('Notifications', 'Stay updated'),
                _createButton('History', 'Review your usage'),
                _createButton('Settings', 'Customize the app'),
                _createButton('Night Mode', 'Switch themes', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NightModePage()),
                  );
                }),
                _createButton('Virtual Assistant', 'Set up your assistant'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanDevicesPage()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          Text(
            'Add a new device',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createButton(String title, String subtitle, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
