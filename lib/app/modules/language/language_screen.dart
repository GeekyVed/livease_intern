import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = 'English';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 180),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),

                    // Image placeholder
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.photo,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Title
                    const Text(
                      'Please select your Language',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'You can change the language\nat any time.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Language Dropdown
                    Container(
                      width: 225,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLanguage,
                          isExpanded: true,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          items: ['English', 'Spanish', 'French', 'German']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              selectedLanguage = newValue;
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Next Button
                    SizedBox(
                      width: 225,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed('/mobile-input'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B3A67),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Wave design at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 250),
              painter: WavePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the wave design
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0xff93d2f3).withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color =  Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path1 = Path();
    final path2 = Path();

    // First wave
    path1.moveTo(0, size.height);
    path1.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.7,
    );
    path1.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.9,
      size.width,
      size.height * 0.8,
    );
    path1.lineTo(size.width, size.height);
    path1.close();

    // Second wave
    path2.moveTo(0, size.height);
    path2.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.9,
      size.width * 0.5,
      size.height * 0.7,
    );
    path2.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.5,
      size.width,
      size.height * 0.7,
    );
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
