// lib/app/modules/mobile_input/mobile_input_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:livease_intern/app/shared/custom_button.dart';
import '../../controllers/phone_verification_controller.dart';

class MobileInputScreen extends StatelessWidget {
  final PhoneVerificationController _controller = Get.find();

  MobileInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(
          Icons.close,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Please enter your mobile number',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'You\'ll receive a 6 digit code \nto verify next.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                counterText: '',
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                phoneNumber = phone.completeNumber;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              dropdownIconPosition: IconPosition.trailing,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                _controller.sendOtp(phoneNumber);
              },
            ),
          ],
        ),
      ),
    );
  }
}
