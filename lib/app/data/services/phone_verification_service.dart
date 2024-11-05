class PhoneVerificationService {
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  // String get phoneNumber => _auth.currentUser?.phoneNumber ?? '';

  @override
  void verifyPhone(String phoneNumber) async {
    // await _auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await _auth.signInWithCredential(credential);
    //     Get.offAllNamed('/'); // Redirect to Home Screen
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     Get.snackbar('Error', e.message ?? 'Verification Failed');
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     Get.toNamed('/otp', arguments: verificationId);
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
  }
}
