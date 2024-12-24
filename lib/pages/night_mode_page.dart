import 'package:flutter/material.dart';
import 'detected_devices_page.dart'; // Import the Detected Devices Page

class NightModePage extends StatefulWidget {
  @override
  _NightModePageState createState() => _NightModePageState();
}

class _NightModePageState extends State<NightModePage> {
  bool isNightModeActivated = false;
  bool isLivingRoomLightOn = false;
  bool isBedroomTVOn = false;
  bool isAirConditionerOn = false;
  TimeOfDay? selectedTime;

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
              'Night Mode 🌙',
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

            // Custom Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStyledButton(
                  icon: Icons.nightlight_round,
                  label: 'Activate',
                  isSelected: isNightModeActivated,
                  borderColor: Colors.redAccent.withOpacity(0.5),
                  textColor: Colors.redAccent,
                  onTap: () {
                    setState(() {
                      isNightModeActivated = true;
                      isLivingRoomLightOn = true;
                      isBedroomTVOn = true;
                      isAirConditionerOn = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Night mode activated!')),
                    );
                  },
                ),
                _buildStyledButton(
                  icon: Icons.nightlight_outlined,
                  label: 'Deactivate',
                  isSelected: !isNightModeActivated,
                  borderColor: Colors.greenAccent.withOpacity(0.5),
                  textColor: Colors.greenAccent,
                  onTap: () {
                    setState(() {
                      isNightModeActivated = false;
                      isLivingRoomLightOn = false;
                      isBedroomTVOn = false;
                      isAirConditionerOn = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Night mode deactivated!')),
                    );
                  },
                ),
                _buildStyledButton(
                  icon: Icons.access_time,
                  label: 'Set Time',
                  isSelected: false,
                  borderColor: Colors.blueAccent.withOpacity(0.5),
                  textColor: Colors.blueAccent,
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                    ).then((pickedTime) {
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Night mode set to activate at ${pickedTime.format(context)}'),
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
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
                value: isLivingRoomLightOn,
                onChanged: (value) {
                  setState(() {
                    isLivingRoomLightOn = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('Bedroom TV'),
              subtitle: Text('Auto shutdown during night mode'),
              trailing: Switch(
                value: isBedroomTVOn,
                onChanged: (value) {
                  setState(() {
                    isBedroomTVOn = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Air Conditioner'),
              subtitle: Text('Optimize cooling for night mode'),
              trailing: Switch(
                value: isAirConditionerOn,
                onChanged: (value) {
                  setState(() {
                    isAirConditionerOn = value;
                  });
                },
              ),
            ),

            Spacer(),

            // Add Devices Section
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Detected Devices Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetectedDevicesPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Add Devices'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom Button Design Method
  Widget _buildStyledButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required Color borderColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? borderColor.withOpacity(0.2) : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: textColor,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
