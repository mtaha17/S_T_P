import 'package:flutter/material.dart';

class CompareEnergyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Energy Usage'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Compare Energy Consumption',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'See how your energy usage compares to homes with similar size and appliances.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 16),

            // Comparison Data (Static for now)
            Expanded(
              child: ListView(
                children: [
                  _buildComparisonTile(
                    label: 'Your Home',
                    usage: '978 W',
                    color: Colors.blue,
                  ),
                  _buildComparisonTile(
                    label: 'Average Home',
                    usage: '890 W',
                    color: Colors.green,
                  ),
                  _buildComparisonTile(
                    label: 'Efficient Home',
                    usage: '750 W',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonTile(
      {required String label, required String usage, required Color color}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(Icons.home, color: color),
        ),
        title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(
          usage,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
