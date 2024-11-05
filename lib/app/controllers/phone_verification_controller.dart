import 'package:get/get.dart';
import '../data/services/phone_verification_service.dart';

class PhoneVerificationController extends GetxController {
  final PhoneVerificationService service = PhoneVerificationService();

  void sendOtp(String phoneNumber) {
    service.verifyPhone(phoneNumber);
    Get.toNamed('/otp');
  }
}
