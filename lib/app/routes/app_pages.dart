import 'package:get/get.dart';
import 'package:livease_intern/app/modules/home/home_screen.dart';
import '../modules/language/language_screen.dart';
import '../modules/mobile_input/mobile_input_screen.dart';
import '../modules/otp_verification/otp_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.LANGUAGE;

  static final routes = [
    GetPage(name: Routes.LANGUAGE, page: () => const LanguageScreen()),
    GetPage(name: Routes.MOBILE_INPUT, page: () => MobileInputScreen()),
    GetPage(name: Routes.OTP, page: () => OtpScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
  ];
}
