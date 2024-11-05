import 'package:flutter/material.dart';
import 'package:livease_intern/app/shared/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedProfile; // Track the selected profile option

  void _selectProfile(String profile) {
    setState(() {
      _selectedProfile = profile; // Update selected profile
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Please select your profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => _selectProfile('Shipper'), // Select Shipper
              child: ProfileOption(
                title: 'Shipper',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing',
                icon: Icons.home,
                isSelected: _selectedProfile == 'Shipper',
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => _selectProfile('Transporter'), // Select Transporter
              child: ProfileOption(
                title: 'Transporter',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing',
                icon: Icons.local_shipping,
                isSelected: _selectedProfile == 'Transporter',
              ),
            ),
            SizedBox(height: 32.0),
            CustomButton(text: 'Continue', onPressed: () {
              // Continue button logic
            }),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected; // Track if this option is selected

  const ProfileOption({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: title,
            groupValue:
                isSelected ? title : null,
            onChanged: (value) {
            },
          ),
          SizedBox(width: 12.0),
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(width: 24.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
