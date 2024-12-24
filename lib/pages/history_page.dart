import 'package:flutter/material.dart';
import 'daily_patterns_page.dart'; // Import Daily Patterns Page
import 'weekly_patterns_page.dart'; // Import Weekly Patterns Page
import 'monthly_patterns_page.dart'; // Import Monthly Patterns Page

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
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
                    'View Usage Patterns',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Analyze your daily, weekly, and monthly energy consumption trends.',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // History Cards
            _buildHistoryCard(
              context: context,
              title: 'Daily Patterns',
              icon: Icons.pie_chart,
              buttonText1: 'Discover Now',
              buttonText2: 'Compare',
              color: Colors.green,
              onDiscoverTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DailyPatternsPage()),
                );
              },
            ),
            SizedBox(height: 16),
            _buildHistoryCard(
              context: context,
              title: 'Weekly Patterns',
              icon: Icons.bar_chart,
              buttonText1: 'Discover Now',
              buttonText2: 'Compare',
              color: Colors.orange,
              onDiscoverTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeeklyPatternsPage()),
                );
              },
            ),
            SizedBox(height: 16),
            _buildHistoryCard(
              context: context,
              title: 'Monthly Patterns',
              icon: Icons.show_chart,
              buttonText1: 'Discover Now',
              buttonText2: 'Compare',
              color: Colors.purple,
              onDiscoverTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlyPatternsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String buttonText1,
    required String buttonText2,
    required Color color,
    required VoidCallback onDiscoverTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.1),
            ),
            child: Icon(icon, color: color, size: 40),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: onDiscoverTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(buttonText1),
                    ),
                    SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {
                        // Handle Compare functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Compare functionality is not implemented yet.')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: color),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        buttonText2,
                        style: TextStyle(color: color),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}