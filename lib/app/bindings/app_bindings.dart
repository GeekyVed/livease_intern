import 'package:get/get.dart';
import 'package:livease_intern/app/controllers/phone_verification_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PhoneVerificationController(),
    );

  }
}
