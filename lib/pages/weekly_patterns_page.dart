import 'package:flutter/material.dart';

class WeeklyPatternsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.9),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting and Date Selector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi Sarah,',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'December 2024',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('assets/user_avatar.jpg'), // Replace with avatar image
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Week Selector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildWeekTab(context, 'Week 1', isSelected: true),
                          _buildWeekTab(context, 'Week 2'),
                          _buildWeekTab(context, 'Week 3'),
                          _buildWeekTab(context, 'Week 4'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Filters
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FILTERS',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      Icon(Icons.filter_list, color: Colors.black54),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Data Cards
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildDataCard(
                        label: 'TV-1',
                        usage: '3450/10000',
                        color: Colors.green,
                      ),
                      _buildDataCard(
                        label: 'AC-1',
                        usage: '2500/10000',
                        color: Colors.lightGreen,
                      ),
                      _buildDataCard(
                        label: 'Fridge',
                        usage: '4050/10000',
                        color: Colors.teal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekTab(BuildContext context, String label, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        // Add functionality for week tab switching if required
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$label selected')));
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDataCard({
    required String label,
    required String usage,
    required Color color,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Circular Chart Placeholder
            Container(
              width: 60,
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: double.parse(usage.split('/')[0]) /
                        double.parse(usage.split('/')[1]),
                    strokeWidth: 6,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                  Text(
                    '${(double.parse(usage.split('/')[0]) / double.parse(usage.split('/')[1]) * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Label and Usage Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  usage,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
