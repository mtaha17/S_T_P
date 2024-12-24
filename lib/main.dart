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
        title: Row(
          children: [
            Icon(Icons.flash_on),
            SizedBox(width: 8),
            Text('PowerFlick'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to PowerFlick!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Manage your energy consumption efficiently.',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),

            // Feature Grid
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Features',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _createFeatureCard(
                  title: 'Dashboard',
                  subtitle: 'View your energy stats',
                  icon: Icons.bar_chart,
                ),
                _createFeatureCard(
                  title: 'Notifications',
                  subtitle: 'Stay updated',
                  icon: Icons.notifications,
                ),
                _createFeatureCard(
                  title: 'History',
                  subtitle: 'Review your usage',
                  icon: Icons.history,
                ),
                _createFeatureCard(
                  title: 'Settings',
                  subtitle: 'Customize the app',
                  icon: Icons.settings,
                ),
                _createFeatureCard(
                  title: 'Night Mode',
                  subtitle: 'Switch themes',
                  icon: Icons.nights_stay,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NightModePage()),
                    );
                  },
                ),
                _createFeatureCard(
                  title: 'Virtual Assistant',
                  subtitle: 'Set up your assistant',
                  icon: Icons.assistant,
                ),
              ],
            ),
          ],
        ),
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

  Widget _createFeatureCard({
    required String title,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
