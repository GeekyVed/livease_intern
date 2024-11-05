import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livease_intern/app/bindings/app_bindings.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Livease Intern',
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
    );
  }
}
