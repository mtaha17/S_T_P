import 'package:flutter/material.dart';

class WeeklyPatternsPage extends StatefulWidget {
  @override
  _WeeklyPatternsPageState createState() => _WeeklyPatternsPageState();
}

class _WeeklyPatternsPageState extends State<WeeklyPatternsPage> {
  // Current selected week
  int selectedWeek = 1;

  // Sample usage data for each week
  final Map<int, List<Map<String, String>>> usageData = {
    1: [
      {'label': 'TV-1', 'usage': '3450/10000'},
      {'label': 'AC-1', 'usage': '2500/10000'},
      {'label': 'Fridge', 'usage': '4050/10000'},
    ],
    2: [
      {'label': 'TV-1', 'usage': '3000/10000'},
      {'label': 'AC-1', 'usage': '2200/10000'},
      {'label': 'Fridge', 'usage': '4000/10000'},
    ],
    3: [
      {'label': 'TV-1', 'usage': '4000/10000'},
      {'label': 'AC-1', 'usage': '2700/10000'},
      {'label': 'Fridge', 'usage': '4500/10000'},
    ],
    4: [
      {'label': 'TV-1', 'usage': '3800/10000'},
      {'label': 'AC-1', 'usage': '2600/10000'},
      {'label': 'Fridge', 'usage': '4200/10000'},
    ],
  };

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
                      // Back Button and Greeting
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context); // Navigate back to the previous page
                            },
                          ),
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
                      // Week Selector Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(4, (index) {
                          final week = index + 1;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedWeek = week;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Week $week',
                                  style: TextStyle(
                                    color: selectedWeek == week
                                        ? Colors.white
                                        : Colors.white70,
                                    fontWeight: selectedWeek == week
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                if (selectedWeek == week)
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
                        }),
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
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: usageData[selectedWeek]?.length ?? 0,
                    itemBuilder: (context, index) {
                      final device = usageData[selectedWeek]![index];
                      return _buildDataCard(
                        label: device['label']!,
                        usage: device['usage']!,
                        color: Colors.green,
                      );
                    },
                  ),
                ),
              ],
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