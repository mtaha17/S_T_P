import 'package:flutter/material.dart';

class NightModePage extends StatefulWidget {
  @override
  _NightModePageState createState() => _NightModePageState();
}

class _NightModePageState extends State<NightModePage> {
  bool isNightModeActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Night Mode 🌙'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              'Night Mode',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Control night mode settings for your devices.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32),

            // Activation Section
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isNightModeActivated = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Night mode activated!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isNightModeActivated
                          ? Colors.grey
                          : Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Activate'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isNightModeActivated = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Night mode deactivated!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isNightModeActivated
                          ? Colors.red
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Deactivate'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Devices Section
            Text(
              'Devices',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Living Room Lights'),
              subtitle: Text('Control brightness during night mode'),
              trailing: Switch(
                value: isNightModeActivated,
                onChanged: (value) {
                  setState(() {
                    isNightModeActivated = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('Bedroom TV'),
              subtitle: Text('Auto shutdown during night mode'),
              trailing: Switch(
                value: isNightModeActivated,
                onChanged: (value) {
                  setState(() {
                    isNightModeActivated = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Air Conditioner'),
              subtitle: Text('Optimize cooling for night mode'),
              trailing: Switch(
                value: isNightModeActivated,
                onChanged: (value) {
                  setState(() {
                    isNightModeActivated = value;
                  });
                },
              ),
            ),

            Spacer(),

            // Set Time Section
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((selectedTime) {
                    if (selectedTime != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Night mode set to activate at ${selectedTime.format(context)}'),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Set Time'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
