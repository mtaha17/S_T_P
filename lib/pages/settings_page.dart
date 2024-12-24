import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account Section
              _buildSectionTitle('ACCOUNT'),
              _buildSettingsTile(
                context,
                icon: Icons.face,
                title: 'Set up face recognition',
                onTap: () {},
              ),
              _buildSettingsTile(
                context,
                icon: Icons.person_outline,
                title: 'Personal information',
                onTap: () {},
              ),
              SizedBox(height: 16),

              // Appearance Section
              _buildSectionTitle('APPEARANCE'),
              SwitchListTile(
                value: true, // Change this value dynamically
                onChanged: (value) {},
                title: Row(
                  children: [
                    Icon(Icons.nightlight_round, color: Colors.blue),
                    SizedBox(width: 16),
                    Text('Night mode'),
                  ],
                ),
              ),
              _buildSettingsTile(
                context,
                icon: Icons.text_fields,
                title: 'Text size',
                trailing: Text(
                  'Medium',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),

              // Other Settings
              _buildSectionTitle('OTHER SETTINGS'),
              _buildSettingsTile(
                context,
                icon: Icons.security,
                title: 'Security',
                trailingIcon: Icons.lock_outline,
                onTap: () {},
              ),
              _buildSettingsTile(
                context,
                icon: Icons.payment,
                title: 'Payment',
                onTap: () {},
              ),
              _buildSettingsTile(
                context,
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
              SizedBox(height: 16),

              // Logout Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: Colors.white),
                  label: Text('Log-out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Changed to blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        VoidCallback? onTap,
        Widget? trailing,
        IconData? trailingIcon,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue), // Changed to blue
      title: Text(title),
      trailing: trailing ??
          (trailingIcon != null
              ? Icon(trailingIcon, color: Colors.grey)
              : Icon(Icons.chevron_right, color: Colors.grey)),
      onTap: onTap,
    );
  }
}
