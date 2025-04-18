import 'package:flutter/material.dart';
import 'pages/start_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/choose_option_page.dart';
import 'pages/developer_info_page.dart';
import 'pages/bank_account_page.dart';
import 'pages/profile_setting_page.dart';
import 'pages/verified_account_developer.dart';
import 'pages/verified_account_client.dart';
import 'pages/home_page.dart';
import 'pages/website_page.dart';
import 'pages/profile_arg.dart';
import 'pages/category_details.dart';
import 'pages/job_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevLance Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/choose-option': (context) => const ChooseOptionPage(),
        '/developer-info': (context) => const DeveloperInfoPage(),
        '/bank-account': (context) => const BankAccountPage(),
        '/profile-setting': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return ProfileSettingPage(
            fullName: args is String ? args : null,
            bio: args is ProfileArgs ? args.bio : null,
            degree: args is ProfileArgs ? args.degree : null,
          );
        },
        '/home': (context) => const HomePage(),
        '/websites': (context) => const WebsitesPage(),
        '/category-details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return CategoryDetailsPage(category: args);
        },
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/verified-account') {
          final args = settings.arguments as Map<String, dynamic>? ?? {};
          final username = args['username'] as String? ?? '';
          final role = args['role'] as String? ?? 'developer';
          
          if (role == 'client') {
            return MaterialPageRoute(
              builder: (context) => VerifiedAccountClient(username: username),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => VerifiedAccountDeveloper(username: username),
            );
          }
        }
        return null;
      },
    );
  }
}