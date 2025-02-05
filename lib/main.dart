import 'package:flutter/material.dart';
import 'package:hw_tiktok_clone/constants/sizes.dart';
import 'package:hw_tiktok_clone/features/authentication/create_account_screen.dart';
import 'package:hw_tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:hw_tiktok_clone/features/onboarding/Interest_screen.dart';
import 'package:hw_tiktok_clone/features/onboarding/category_screen.dart';
import 'package:hw_tiktok_clone/features/onboarding/validate_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeWork TikToK',
      theme: ThemeData(
      scaffoldBackgroundColor:  Colors.white,
       primaryColor:  const Color.fromRGBO(77, 154, 231, 1),
       secondaryHeaderColor:Colors.grey.shade700,
       appBarTheme:  const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: Sizes.size16 + Sizes.size2,
          fontWeight: FontWeight.w600,
        ),
       ),
      ),
      home: const CreateAccountScreen(),
    );
  }
}

