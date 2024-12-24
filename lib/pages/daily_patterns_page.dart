import 'package:flutter/material.dart';

class DailyPatternsPage extends StatefulWidget {
  @override
  _DailyPatternsPageState createState() => _DailyPatternsPageState();
}

class _DailyPatternsPageState extends State<DailyPatternsPage> {
  // Current selected day
  int selectedDay = 19;

  // Sample usage data for each day
  final Map<int, List<Map<String, String>>> usageData = {
    19: [
      {'label': 'TV-1', 'usage': '345/1000'},
      {'label': 'AC-1', 'usage': '250/1000'},
      {'label': 'Fridge', 'usage': '405/1000'},
    ],
    20: [
      {'label': 'TV-1', 'usage': '300/1000'},
      {'label': 'AC-1', 'usage': '200/1000'},
      {'label': 'Fridge', 'usage': '400/1000'},
    ],
    21: [
      {'label': 'TV-1', 'usage': '400/1000'},
      {'label': 'AC-1', 'usage': '275/1000'},
      {'label': 'Fridge', 'usage': '450/1000'},
    ],
    22: [
      {'label': 'TV-1', 'usage': '380/1000'},
      {'label': 'AC-1', 'usage': '260/1000'},
      {'label': 'Fridge', 'usage': '420/1000'},
    ],
    23: [
      {'label': 'TV-1', 'usage': '360/1000'},
      {'label': 'AC-1', 'usage': '230/1000'},
      {'label': 'Fridge', 'usage': '410/1000'},
    ],
    24: [
      {'label': 'TV-1', 'usage': '370/1000'},
      {'label': 'AC-1', 'usage': '240/1000'},
      {'label': 'Fridge', 'usage': '400/1000'},
    ],
    25: [
      {'label': 'TV-1', 'usage': '350/1000'},
      {'label': 'AC-1', 'usage': '220/1000'},
      {'label': 'Fridge', 'usage': '390/1000'},
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
                image: AssetImage('assets/background.jpg'), // Replace with your image
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
                            backgroundImage: AssetImage('assets/user_avatar.jpg'), // Replace with your image
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Date Selector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(7, (index) {
                          final day = 19 + index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDay = day;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
                                  style: TextStyle(
                                    color: selectedDay == day
                                        ? Colors.white
                                        : Colors.white70,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: selectedDay == day
                                        ? Colors.white
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    day.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: selectedDay == day
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: selectedDay == day
                                          ? Colors.blueAccent
                                          : Colors.white,
                                    ),
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
                    itemCount: usageData[selectedDay]?.length ?? 0,
                    itemBuilder: (context, index) {
                      final device = usageData[selectedDay]![index];
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