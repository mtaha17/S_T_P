import 'package:flutter/material.dart';

class CompareMonthlyPage extends StatefulWidget {
  @override
  _CompareMonthlyPageState createState() => _CompareMonthlyPageState();
}

class _CompareMonthlyPageState extends State<CompareMonthlyPage> {
  int? _startMonth;
  int? _endMonth;
  int currentYear = DateTime.now().year;

  void _selectMonth(BuildContext context, bool isStartMonth) async {
    // Simulating month selection with a simple dialog (Replace with actual month picker if needed)
    int? selectedMonth = await showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select Month'),
          children: List.generate(
            12,
                (index) => SimpleDialogOption(
              onPressed: () => Navigator.pop(context, index + 1),
              child: Text(
                '${['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][index]}',
              ),
            ),
          ),
        );
      },
    );

    if (selectedMonth != null) {
      setState(() {
        if (isStartMonth) {
          _startMonth = selectedMonth;
        } else {
          _endMonth = selectedMonth;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Compare your monthly consumption',
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
                  'Choose your months',
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
                    // Start Month Picker
                    GestureDetector(
                      onTap: () => _selectMonth(context, true),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.calendar_today, color: Colors.blue),
                            SizedBox(height: 8),
                            Text(
                              _startMonth == null
                                  ? 'Start Month'
                                  : '${['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][_startMonth! - 1]} $currentYear',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // End Month Picker
                    GestureDetector(
                      onTap: () => _selectMonth(context, false),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.calendar_today, color: Colors.blue),
                            SizedBox(height: 8),
                            Text(
                              _endMonth == null
                                  ? 'End Month'
                                  : '${['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][_endMonth! - 1]} $currentYear',
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
                      if (_startMonth != null && _endMonth != null) {
                        if (_startMonth! <= _endMonth!) {
                          // Perform comparison logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Comparing from ${['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][_startMonth! - 1]} '
                                    'to ${['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][_endMonth! - 1]} $currentYear',
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Start month must be before or equal to end month.'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select both months.')),
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