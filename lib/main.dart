import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/business_registration_page.dart';
import 'features/navigation/presentation/widgets/main_layout.dart';

void main() {
  runApp(const ServiceFlowApp());
}

class ServiceFlowApp extends StatelessWidget {
  const ServiceFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ServiceFlow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const BusinessRegistrationPage(),
        '/home': (context) => const MainLayout(),
      },
    );
  }
}
