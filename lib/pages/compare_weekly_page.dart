import 'package:flutter/material.dart';

class CompareWeeklyPage extends StatefulWidget {
  @override
  _CompareWeeklyPageState createState() => _CompareWeeklyPageState();
}

class _CompareWeeklyPageState extends State<CompareWeeklyPage> {
  int? _startWeek;
  int? _endWeek;

  void _selectWeek(BuildContext context, bool isStartWeek) async {
    // Simulating week selection with a simple dialog (Replace with actual week selection UI if required)
    int? selectedWeek = await showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select Week'),
          children: List.generate(
            52,
                (index) => SimpleDialogOption(
              onPressed: () => Navigator.pop(context, index + 1),
              child: Text('Week ${index + 1}'),
            ),
          ),
        );
      },
    );

    if (selectedWeek != null) {
      setState(() {
        if (isStartWeek) {
          _startWeek = selectedWeek;
        } else {
          _endWeek = selectedWeek;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Compare your weekly consumption',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                SizedBox(height: 16),
                Text(
                  'Choose your weeks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Start Week Picker
                    GestureDetector(
                      onTap: () => _selectWeek(context, true),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.calendar_view_week, color: Colors.blue),
                            SizedBox(height: 8),
                            Text(
                              _startWeek == null
                                  ? 'Start Week'
                                  : 'Week $_startWeek',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // End Week Picker
                    GestureDetector(
                      onTap: () => _selectWeek(context, false),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.calendar_view_week, color: Colors.blue),
                            SizedBox(height: 8),
                            Text(
                              _endWeek == null
                                  ? 'End Week'
                                  : 'Week $_endWeek',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                // Apply Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_startWeek != null && _endWeek != null) {
                        if (_startWeek! <= _endWeek!) {
                          // Perform comparison logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Comparing from Week $_startWeek to Week $_endWeek',
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Start week must be before or equal to end week.'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select both weeks.')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}