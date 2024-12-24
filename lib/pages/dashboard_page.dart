import 'package:flutter/material.dart';
import 'kitchen_analytics_page.dart'; // Import Kitchen Analytics Page
import 'compare_energy_page.dart'; // Import the Compare Energy Page
import 'living_room_analytics_page.dart'; // Import Living Room Analytics Page
import 'master_room_analytics_page.dart'; // Import Master Room Analytics Page
import 'dart:async'; // For simulating real-time updates

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Timer _timer;
  double _currentEnergyUsage = 978.0; // Initial energy usage in Watts

  @override
  void initState() {
    super.initState();
    // Simulate real-time energy updates
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentEnergyUsage += (5 - (10 * (0.5 - (timer.tick % 2)))); // Simulated updates
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Real-Time Energy Overview Section
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Icon(Icons.flash_on, size: 48, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  '${_currentEnergyUsage.toStringAsFixed(1)} W',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Real-Time Usage',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Monitor your energy usage as it happens.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompareEnergyPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Compare with Similar Homes',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Room Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildRoomCard(
                  context,
                  title: 'Living Room',
                  usage: '293.4 W',
                  percentage: '30%',
                  color: Colors.greenAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LivingRoomAnalyticsPage()),
                    );
                  },
                ),
                _buildRoomCard(
                  context,
                  title: 'Master Room',
                  usage: '293.4 W',
                  percentage: '30%',
                  color: Colors.lightBlue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MasterRoomAnalyticsPage()),
                    );
                  },
                ),
                _buildRoomCard(
                  context,
                  title: 'Kitchen',
                  usage: '391.2 W',
                  percentage: '40%',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KitchenAnalyticsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomCard(BuildContext context,
      {required String title,
        required String usage,
        required String percentage,
        required Color color,
        VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(Icons.lightbulb, color: color),
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('$usage • $percentage'),
            trailing: onTap != null
                ? Icon(Icons.arrow_forward_ios, color: Colors.black)
                : null,
          ),
        ),
      ),
    );
  }
}
