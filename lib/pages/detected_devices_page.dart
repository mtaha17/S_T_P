import 'package:flutter/material.dart';

class DetectedDevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Close the page and go back
          },
        ),
        title: Text('Detected devices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detected devices',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.devices),
              title: Text('SAMSUNG-SMART-fridge09877'),
              subtitle: Text('Detected in this room'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text('Connect'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('SAMSUNG-43inch-4Ktv'),
              subtitle: Text('Detected in living room'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text('Connect'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('LG-S4-aircon'),
              subtitle: Text('Detected in master room'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text('Connect'),
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Sensors setup'),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
