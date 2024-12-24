import 'package:flutter/material.dart';

class MonthlyPatternsPage extends StatefulWidget {
  @override
  _MonthlyPatternsPageState createState() => _MonthlyPatternsPageState();
}

class _MonthlyPatternsPageState extends State<MonthlyPatternsPage> {
  // Current selected month
  String selectedMonth = 'January';

  // Sample usage data for each month
  final Map<String, List<Map<String, String>>> usageData = {
    'January': [
      {'label': 'TV-1', 'usage': '3450/10000'},
      {'label': 'AC-1', 'usage': '2500/10000'},
      {'label': 'Fridge', 'usage': '4050/10000'},
    ],
    'February': [
      {'label': 'TV-1', 'usage': '3000/10000'},
      {'label': 'AC-1', 'usage': '2200/10000'},
      {'label': 'Fridge', 'usage': '4000/10000'},
    ],
    'March': [
      {'label': 'TV-1', 'usage': '4000/10000'},
      {'label': 'AC-1', 'usage': '2700/10000'},
      {'label': 'Fridge', 'usage': '4500/10000'},
    ],
    'April': [
      {'label': 'TV-1', 'usage': '3800/10000'},
      {'label': 'AC-1', 'usage': '2600/10000'},
      {'label': 'Fridge', 'usage': '4200/10000'},
    ],
    'May': [
      {'label': 'TV-1', 'usage': '3600/10000'},
      {'label': 'AC-1', 'usage': '2400/10000'},
      {'label': 'Fridge', 'usage': '4000/10000'},
    ],
    'June': [
      {'label': 'TV-1', 'usage': '3700/10000'},
      {'label': 'AC-1', 'usage': '2500/10000'},
      {'label': 'Fridge', 'usage': '4100/10000'},
    ],
    'July': [
      {'label': 'TV-1', 'usage': '3900/10000'},
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
                                '2024',
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
                      // Month Selector
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: usageData.keys.map((month) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedMonth = month;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      month,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: selectedMonth == month
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: selectedMonth == month
                                            ? Colors.white
                                            : Colors.white70,
                                      ),
                                    ),
                                    if (selectedMonth == month)
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
                              ),
                            );
                          }).toList(),
                        ),
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
                    itemCount: usageData[selectedMonth]?.length ?? 0,
                    itemBuilder: (context, index) {
                      final device = usageData[selectedMonth]![index];
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