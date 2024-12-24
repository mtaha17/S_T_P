import 'package:flutter/material.dart';
import 'kitchen_analytics_page.dart'; // Import Kitchen Analytics Page

class DashboardPage extends StatelessWidget {
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
          // Energy Overview Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  '978 W',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '65% of 1504 W',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
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
                ),
                _buildRoomCard(
                  context,
                  title: 'Master Room',
                  usage: '293.4 W',
                  percentage: '30%',
                  color: Colors.lightBlue,
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
        elevation: 4,
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
          trailing: onTap != null ? Icon(Icons.arrow_forward_ios) : null,
        ),
      ),
    );
  }
}
