import 'package:flutter/material.dart';
import 'daily_patterns_page.dart'; // Import Daily Patterns Page
import 'weekly_patterns_page.dart'; // Import Weekly Patterns Page

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My history',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Replace with your asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _createHistoryCard(
                    context,
                    title: 'Daily patterns',
                    chartColor: Colors.green,
                    onDiscover: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DailyPatternsPage()),
                      );
                    },
                    onCompare: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Compare Daily Patterns')),
                      );
                    },
                  ),
                  _createHistoryCard(
                    context,
                    title: 'Weekly patterns',
                    chartColor: Colors.lightGreen,
                    onDiscover: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeeklyPatternsPage()),
                      );
                    },
                    onCompare: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Compare Weekly Patterns')),
                      );
                    },
                  ),
                  _createHistoryCard(
                    context,
                    title: 'Monthly patterns',
                    chartColor: Colors.teal,
                    onDiscover: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Discover Monthly Patterns')),
                      );
                    },
                    onCompare: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Compare Monthly Patterns')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createHistoryCard(
      BuildContext context, {
        required String title,
        required Color chartColor,
        required VoidCallback onDiscover,
        required VoidCallback onCompare,
      }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          // Chart Placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: chartColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: chartColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Text and Buttons
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Discover Now Button
                    OutlinedButton(
                      onPressed: onDiscover,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.black54),
                      ),
                      child: Text(
                        'Discover now',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 8),
                    // Compare Button
                    OutlinedButton(
                      onPressed: onCompare,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.blueAccent),
                      ),
                      child: Text(
                        'Compare',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
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
