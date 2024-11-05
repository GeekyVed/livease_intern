import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class OtpScreen extends StatefulWidget {

  const OtpScreen({Key? key,}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _otpCode; // Store the OTP entered by the user
  bool _isLoading = false;

  void verifyOtp() async {
    if (_otpCode == null || _otpCode!.isEmpty) {
      Get.snackbar('Error', 'Please enter the OTP');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // // Create a PhoneAuthCredential with the code
      // PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //   verificationId: widget.verificationId,
      //   smsCode: _otpCode!,
      // );

      // // Sign the user in (or link) with the credential
      // await _auth.signInWithCredential(credential);
      Get.offAllNamed('/home'); // Navigate to Home or Dashboard
    } catch (e) {
      Get.snackbar('Error', 'Invalid OTP. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> resendOtp() async {
    // Logic to resend the OTP (you might need to re-trigger the send logic)
    Get.snackbar('Info', 'OTP has been resent to your phone number.');
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff93d2f3),
        border: Border.all(color: Colors.grey),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Verify Phone',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Code is sent to your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Pinput(
              length: 6,
              onChanged: (pin) {
                setState(() {
                  _otpCode = pin; // Update OTP code
                });
              },
              defaultPinTheme: defaultPinTheme,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Resend OTP logic
                    resendOtp();
                  },
                  child: const Text(
                    'Didn\'t receive the code?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Logic for requesting OTP again
                    resendOtp();
                  },
                  child: const Text(
                    'Request Again',
                    style: TextStyle(
                      color: Colors.blue, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 53,
              child: ElevatedButton(
                onPressed: _isLoading ? null : verifyOtp, // Disable button during loading
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B3A67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: _isLoading 
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    ) 
                  : const Text(
                      'CONTINUE',
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
    );
  }
}
