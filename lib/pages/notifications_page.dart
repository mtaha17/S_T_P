import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
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
                    'Notifications',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Keep track of important updates and alerts.',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Notifications Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recent Notifications',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildNotificationCard(
                  title: 'Heads Up!',
                  icon: Icons.warning,
                  description:
                  'Your kitchen has used more electricity than usual today.',
                  color: Colors.orange,
                  onTap: () {
                    _showSnackBar(context, 'Heads Up details opened!');
                  },
                ),
                _buildNotificationCard(
                  title: 'Alert',
                  icon: Icons.error,
                  description:
                  'Your kitchen exceeded its daily electricity limit.',
                  color: Colors.red,
                  onTap: () {
                    _showSnackBar(context, 'Alert details opened!');
                  },
                ),
                _buildNotificationCard(
                  title: 'Notice',
                  icon: Icons.info,
                  description:
                  'Your kitchen used 120% of its daily electricity budget.',
                  color: Colors.blue,
                  onTap: () {
                    _showSnackBar(context, 'Notice details opened!');
                  },
                ),
                _buildNotificationCard(
                  title: 'Tip',
                  icon: Icons.lightbulb,
                  description:
                  'Try energy-saving modes to reduce your consumption.',
                  color: Colors.green,
                  onTap: () {
                    _showSnackBar(context, 'Tip details opened!');
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            // Filter Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Filter Options',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        value: 'Today',
                        child: Text('Today'),
                      ),
                      DropdownMenuItem(
                        value: 'This Week',
                        child: Text('This Week'),
                      ),
                      DropdownMenuItem(
                        value: 'This Month',
                        child: Text('This Month'),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: Text('Select Date Range'),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text('Show All'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Notification Card Widget
  Widget _buildNotificationCard({
    required String title,
    required IconData icon,
    required String description,
    required Color color,
    required VoidCallback onTap,
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
            Icon(icon, size: 40, color: color),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
